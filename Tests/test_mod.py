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

if __name__=='__main__': unittest.main()
