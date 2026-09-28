"""Portable regression checks for the delivered XML and resources."""
import unittest, struct, json, re
from pathlib import Path
import xml.etree.ElementTree as E
R=Path(__file__).resolve().parents[1]

class ModTests(unittest.TestCase):
    def test_xml_and_duplicate_defs(self):
        seen=set()
        for f in (R/'Mod').rglob('*.xml'):
            root=E.parse(f).getroot()
            if root.tag=='Defs':
                for d in root:
                    k=(d.tag,d.findtext('defName'))
                    self.assertNotIn(k,seen); seen.add(k)
        self.assertEqual(len(seen),13)

    def test_translation_coverage_and_paths(self):
        inventory=json.loads((R/'Tests/translation-inventory.json').read_text(encoding='utf-8'))
        actual={}
        for f in (R/'Mod/Languages/French/DefInjected').glob('*/*.xml'):
            for n in E.parse(f).getroot():
                k=(f.parent.name,n.tag); self.assertNotIn(k,actual); actual[k]=n.text
                self.assertTrue(n.text and n.text.strip()); self.assertNotRegex(n.text,r'TODO|TODO_TRANSLATE')
        found=0
        for f in (R/'Mod/Defs').glob('*.xml'):
            found+=sum(n.tag in {'label','labelMale','labelPlural','description','customLabel'} for n in E.parse(f).iter())
        self.assertEqual(len(inventory),found)
        self.assertEqual(set(actual),{(i['type'],i['key']) for i in inventory})
        for i in inventory:
            d=E.parse(R/i['file']).find(f"{i['type']}[defName='{i['defName']}']")
            self.assertIsNotNone(d)
            n=d.find(i['xpath']); self.assertIsNotNone(n)
            self.assertEqual(n.text,i['english'],i['key']+' source changed; review translation')
            self.assertEqual(re.findall(r'\{[^}]+\}',n.text),re.findall(r'\{[^}]+\}',actual[(i['type'],i['key'])]))

    def test_metadata(self):
        a=E.parse(R/'Mod/About/About.xml').getroot()
        self.assertEqual(a.findtext('packageId'),'nelim.megabeesrenew')
        self.assertEqual(a.findtext('name'),'Megabees Renew (unofficial)')
        self.assertEqual(a.findtext('supportedVersions/li'),'1.6')
        self.assertTrue(a.findtext('description').startswith('UNOFFICIAL.'))
        self.assertTrue(a.findtext('description').endswith('[url='+a.findtext('url')+']Source code on GitHub[/url]'))
        self.assertEqual((R/'ATTRIBUTION.md').read_bytes(),(R/'Mod/ATTRIBUTION.md').read_bytes())

    def test_production_and_save_identity(self):
        d=E.parse(R/'Mod/Defs/megabee.xml').find('ThingDef')
        defs={n.findtext('defName') for f in (R/'Mod/Defs').glob('*.xml') for n in E.parse(f).getroot()}
        for field in ('milkDef','woolDef','eggUnfertilizedDef','eggFertilizedDef'):
            self.assertIn(d.findtext('.//'+field),defs)
        self.assertEqual(d.findtext('statBases/Wildness'),'0.80')
        self.assertIsNone(d.find('race/wildness'))
        for n in d.findall('race/willNeverEat/li'):
            self.assertIn(n.get('MayRequire'),('Ludeon.RimWorld.Royalty','Ludeon.RimWorld.Ideology'))
        salve=E.parse(R/'Mod/Defs/salveDefs.xml').find('ThingDef')
        for n in salve.find('costList'): self.assertIn(n.tag,defs)

    def test_artifacts(self):
        for name,size in [('ModIcon.png',(128,128)),('Preview.png',(896,504))]:
            raw=(R/'Mod/About'/name).read_bytes()
            self.assertEqual(raw[:8],b'\x89PNG\r\n\x1a\n')
            self.assertEqual(struct.unpack('>II',raw[16:24]),size)
            if name=='Preview.png': self.assertLess(len(raw),1_000_000)

    def test_no_empty_settings(self):
        self.assertFalse(list((R/'Mod').rglob('*.dll')))
        for f in (R/'Mod/Defs').glob('*.xml'):
            self.assertIsNone(E.parse(f).find('MainButtonDef'))

# ---------------------------------------------------------------------------------------------------
# Animal-integration compatibility patches (PUBLISHING.md, "Mods qui ajoutent des animaux", 2026-09-28).
# RimWorld applies XML patches with .NET's XPath 1.0; lxml has the same semantics (an `or` over string
# literals is always true, for one), which ElementTree does not, so these tests apply the real patch
# file to the real Core definitions instead of only parsing it. Model: Funny Creatures Renew
# Tests/test_mod.py CompatibilityPatchTests.
# ---------------------------------------------------------------------------------------------------
import os, copy

try:
    from lxml import etree as LX
except ImportError:  # the patch-application tests are skipped, the structural ones still run
    LX = None

GAME = Path(os.environ.get('RIMWORLD_DIR', r'C:\Program Files (x86)\Steam\steamapps\common\RimWorld'))
WORKSHOP = Path(os.environ.get('RIMWORLD_WORKSHOP',
                               r'C:\Program Files (x86)\Steam\steamapps\workshop\content\294100'))
ADS_NAME = 'A Dog Said... Animal Prosthetics 2'
OPERATION_CLASSES = {'PatchOperationConditional', 'PatchOperationAdd'}


def elements(node):
    return [c for c in node if isinstance(c.tag, str)]


def absolute(xpath):
    xpath = xpath.strip()
    return xpath if xpath.startswith('/') else '/' + xpath


def apply_operation(op, doc):
    """The subset of Verse.PatchOperation this patch file uses, with RimWorld's semantics."""
    cls = op.get('Class')
    assert cls in OPERATION_CLASSES, f'operation not covered by the test applier: {cls}'
    if cls == 'PatchOperationConditional':
        branch = op.find('match') if doc.xpath(absolute(op.findtext('xpath'))) else op.find('nomatch')
        if branch is not None:
            apply_operation(branch, doc)
    elif cls == 'PatchOperationAdd':
        for node in doc.xpath(absolute(op.findtext('xpath'))):
            for child in elements(op.find('value')):
                node.append(copy.deepcopy(child))


def apply_patch_file(name, doc):
    for op in LX.parse(str(R / 'Mod/Patches' / name)).getroot().findall('Operation'):
        apply_operation(op, doc)


def snapshot(doc):
    return LX.tostring(doc)


@unittest.skipIf(LX is None, 'lxml is needed to apply the patches')
class CompatibilityPatchTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.core = GAME / 'Data/Core/Defs'
        assert cls.core.is_dir(), 'Set RIMWORLD_DIR to an installed 1.6 game for Core checks'

    def fresh_doc(self):
        """Core definitions plus this mod's, as one document: what the patch runs against."""
        root = LX.Element('Defs')
        for folder in (self.core, R / 'Mod/Defs'):
            for file in sorted(folder.rglob('*.xml')):
                for child in LX.parse(str(file)).getroot():
                    if isinstance(child.tag, str):
                        root.append(child)
        return LX.ElementTree(root)

    def test_every_operation_is_guarded(self):
        files = sorted((R / 'Mod/Patches').glob('*.xml'))
        self.assertEqual([f.name for f in files], ['Compat_ADogSaidAnimalProsthetics2.xml'])
        for file in files:
            root = E.parse(file).getroot()
            for op in root.findall('Operation'):
                with self.subTest(file=file.name):
                    # MayRequire on an <Operation> is read by nothing; only PatchOperationConditional works here.
                    self.assertNotIn('MayRequire', op.attrib)
                    self.assertEqual(op.get('Class'), 'PatchOperationConditional')
                    self.assertIsNone(op.find('nomatch'), 'a guard must do nothing when the mod is absent')

    def test_load_order_for_ads2_is_declared(self):
        about = E.parse(R / 'Mod/About/About.xml').getroot()
        self.assertIn('SamBucher.ADogSaidAnimalProsthetics2', [e.text for e in about.findall('loadBefore/li')])
        self.assertFalse(about.findall('modDependencies/li'), 'every integration stays optional')

    def test_ads2_adds_megabee_to_all_three_categories_and_nothing_else(self):
        doc = self.fresh_doc()
        root = doc.getroot()
        for cat in ('ADS_Cat1', 'ADS_Cat2', 'ADS_Cat3'):
            recipe = LX.SubElement(root, 'RecipeDef', Name=cat, Abstract='True')
            LX.SubElement(LX.SubElement(recipe, 'recipeUsers'), 'li').text = 'Megaspider'
        unrelated = LX.SubElement(root, 'RecipeDef')
        LX.SubElement(unrelated, 'defName').text = 'UnrelatedSurgery'
        LX.SubElement(LX.SubElement(unrelated, 'recipeUsers'), 'li').text = 'Cat'
        apply_patch_file('Compat_ADogSaidAnimalProsthetics2.xml', doc)  # ADS 2 present, no other mod
        for cat in ('ADS_Cat1', 'ADS_Cat2', 'ADS_Cat3'):
            users = [li.text for li in doc.xpath(f'/Defs/RecipeDef[@Name="{cat}"]/recipeUsers/li')]
            self.assertEqual(users, ['Megaspider', 'Megabee'], cat)
        # The always-true predicate this file avoids would have reached every RecipeDef in the game.
        self.assertEqual([li.text for li in doc.xpath('/Defs/RecipeDef[defName="UnrelatedSurgery"]/recipeUsers/li')],
                         ['Cat'])
        reached = doc.xpath('/Defs/RecipeDef[not(@Name)]/recipeUsers/li[text()="Megabee"]')
        self.assertEqual(reached, [], 'a recipe outside the three categories was reached')

    def test_ads2_absent_changes_nothing(self):
        doc = self.fresh_doc()
        before = snapshot(doc)
        apply_patch_file('Compat_ADogSaidAnimalProsthetics2.xml', doc)
        self.assertEqual(snapshot(doc), before)

    def test_ads2_against_the_installed_categories(self):
        path = WORKSHOP / '3238353862/1.6/Defs/AnimalCategories/Animal_Categories.xml'
        if not path.exists():
            self.skipTest('ADS 2 is not installed')
        doc = LX.parse(str(path))
        before = {c: [li.text for li in doc.xpath(f'/Defs/RecipeDef[@Name="{c}"]/recipeUsers/li')]
                  for c in ('ADS_Cat1', 'ADS_Cat2', 'ADS_Cat3')}
        apply_patch_file('Compat_ADogSaidAnimalProsthetics2.xml', doc)
        for cat, users in before.items():
            after = [li.text for li in doc.xpath(f'/Defs/RecipeDef[@Name="{cat}"]/recipeUsers/li')]
            self.assertEqual(after, users + ['Megabee'], cat)
            # The rationale in the patch header: the analogues (Megascarab, its sounds; Megaspider,
            # its meat) are in every category.
            self.assertIn('Megascarab', users)
            self.assertIn('Megaspider', users)

    def test_every_patch_names_the_mod_the_way_the_game_does(self):
        about = WORKSHOP / '3238353862/About/About.xml'
        if not about.exists():
            self.skipTest('ADS 2 is not installed')
        self.assertEqual(E.parse(about).getroot().findtext('name'), ADS_NAME)

    def test_no_nocturnal_animals_or_crossbreeding_patch_is_shipped(self):
        # Written reasons (STATUS.md "Animal integrations", 2026-09-28): Nocturnal Animals lists no
        # insect analogue (Megascarab, Megaspider) as Nocturnal in its own Core patches, so Megabee
        # stays diurnal, the unpatched default. Better Crossbreeding ships no pairing for an insect
        # either, and Megabee's own description names no vanilla animal it derives from or could
        # plausibly pair with. Neither integration is a defect: both are a documented "no".
        names = {f.name for f in (R / 'Mod/Patches').glob('*.xml')}
        self.assertNotIn('Compat_NocturnalAnimals.xml', names)
        self.assertNotIn('Compat_BetterCrossbreeding.xml', names)

if __name__=='__main__': unittest.main()
