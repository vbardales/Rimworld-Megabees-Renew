"""Exact values of the Pickle suite of this mod (Tests/Pickle). They do not start a game.

Step resolution, tags and @requires declarations are Check-Steps.ps1 (shared). Here only what is this mod's own:
the companion mod, the dependency maps of each pass and the def names the scenarios point at.
"""
import os
from pathlib import Path
import re
import unittest
import xml.etree.ElementTree as ET

ROOT = Path(__file__).resolve().parents[1]
COLLECTION = ROOT.parent
PICKLE = ROOT / 'Tests' / 'Pickle'
FEATURES = PICKLE / 'Mod' / 'Pickle' / 'Features'
GAME = Path(os.environ.get('RIMWORLD_DIR', r'C:\Program Files (x86)\Steam\steamapps\common\RimWorld'))
WORKSHOP = Path(os.environ.get('RIMWORLD_WORKSHOP',
                               r'C:\Program Files (x86)\Steam\steamapps\workshop\content\294100'))

PREFIX = 'Megabees Renew:'
DLC = {'ludeon.rimworld.royalty', 'ludeon.rimworld.ideology'}


def feature_tags():
    """file name -> tags of the Feature line."""
    out = {}
    for file in sorted(FEATURES.glob('*.feature')):
        pending, tags = set(), set()
        for raw in file.read_text(encoding='utf-8').splitlines():
            line = raw.strip()
            if line.startswith('@'):
                pending |= {t[1:] for t in line.split()}
            elif line.startswith('Feature:'):
                tags, pending = pending, set()
        out[file.name] = tags
    return out


def step_lines():
    return [(f.name, m.group(1)) for f in sorted(FEATURES.glob('*.feature'))
            for raw in f.read_text(encoding='utf-8').splitlines()
            for m in [re.match(r'^\s*(?:Given|When|Then|And|But)\s+(.*)$', raw)] if m]


def read_map(path):
    entries = []
    for number, line in enumerate(path.read_text(encoding='utf-8').splitlines(), 1):
        stripped = line.split('#', 1)[0].strip()
        if stripped:
            entries.append((number, stripped.split()))
    return entries


class PickleSuiteTests(unittest.TestCase):
    def test_the_companion_is_a_pickle_test_mod_of_this_mod(self):
        about = ET.parse(PICKLE / 'Mod/About/About.xml').getroot()
        self.assertEqual(about.findtext('packageId'), 'nelim.megabees.pickletests')
        deps = [e.text for e in about.findall('modDependencies/li/packageId')]
        self.assertEqual(sorted(deps), ['nelim.megabees', 'rimworks.pickle'])
        for dep in about.findall('modDependencies/li'):
            self.assertTrue(dep.findtext('displayName'))
        self.assertIn('Pickle tests', about.findtext('name'))
        # A test dependency without a URL logs a warning that the load audit attributes to this mod.
        for dep in about.findall('modDependencies/li'):
            if dep.findtext('packageId') == 'rimworks.pickle':
                self.assertTrue(dep.findtext('steamWorkshopUrl') or dep.findtext('downloadUrl'))

    def test_every_map_is_well_formed_and_ends_with_a_newline(self):
        maps = sorted(PICKLE.glob('wsl-deps.*.map'))
        self.assertEqual([m.name for m in maps], ['wsl-deps.avec-ads2.map', 'wsl-deps.dlc-absent.map',
                                                  'wsl-deps.incompat-original.map', 'wsl-deps.make-honey.map', 'wsl-deps.minimal-17.map', 'wsl-deps.sanctuary.map',
                                                  'wsl-deps.tools.map'])
        for path in maps:
            with self.subTest(map=path.name):
                # `read` drops a last line with no newline, without a word, and the mod on it is never staged.
                self.assertTrue(path.read_bytes().endswith(b'\n'))
                for number, parts in read_map(path):
                    if parts[0].startswith('!'):
                        self.assertIn(parts[0][1:], DLC, f'{path.name}:{number} may only drop Royalty or Ideology')
                        continue
                    self.assertEqual(len(parts), 2, f'{path.name}:{number} is not "packageId workshopId|path:folder"')
                    if parts[1].startswith('path:'):
                        folder = COLLECTION / parts[1][len('path:'):]
                        if not folder.resolve().is_relative_to(COLLECTION.resolve()) and not folder.exists():
                            continue  # a copy kept in the WSL home (wsl-deps.minimal-17.map): only visible from WSL
                        about = folder / 'About' / 'About.xml'
                        self.assertTrue(about.exists(), f'{path.name}:{number}: no About/About.xml in {folder}')
                        self.assertEqual(ET.parse(about).getroot().findtext('packageId'), parts[0],
                                         f'{path.name}:{number}: the folder declares another packageId')
                    else:
                        self.assertRegex(parts[1], r'^\d+$')

    def test_the_optional_mod_pass_loads_this_mod_before_ads2(self):
        order = [parts[0] for _, parts in read_map(PICKLE / 'wsl-deps.avec-ads2.map')]
        self.assertLess(order.index('nelim.megabees'), order.index('SamBucher.ADogSaidAnimalProsthetics2'),
                        'ADS 2 copies its lists once: this mod has to load first (About.xml loadBefore)')
        self.assertEqual(sorted(order), sorted(['nelim.pickletools.loadaudit', 'nelim.megabees',
                                                'SamBucher.ADogSaidAnimalProsthetics2']))
        self.assertEqual({p[0] for _, p in read_map(PICKLE / 'wsl-deps.incompat-original.map')},
                         {'nelim.pickletools.loadaudit', 'zoura3025.megabees'})
        self.assertEqual({p[0] for _, p in read_map(PICKLE / 'wsl-deps.dlc-absent.map')} - {'nelim.pickletools.loadaudit'},
                         {'!' + e for e in DLC})

    def test_every_requirement_is_staged_by_the_map_that_plays_it(self):
        staged = {
            'SamBucher.ADogSaidAnimalProsthetics2': 'wsl-deps.avec-ads2.map',
            'zoura3025.megabees': 'wsl-deps.incompat-original.map',
            'TSP.zal.patchhoney2': 'wsl-deps.make-honey.map',
            'nelim.pickletools.loadaudit': 'wsl-deps.tools.map',
            'nelim.sanctuarybacklot': 'wsl-deps.sanctuary.map',
            'nelim.pickletools.screenshotstudio': 'wsl-deps.sanctuary.map',
            'nelim.pickletools.stagedecor': 'wsl-deps.sanctuary.map',
            'nelim.pickletools.colonistrace': 'wsl-deps.sanctuary.map',
        }
        for file, tags in feature_tags().items():
            for tag in tags:
                if tag.startswith('requires:'):
                    with self.subTest(file=file, tag=tag):
                        package = tag[len('requires:'):]
                        self.assertIn(package, staged)
                        names = [p[0] for _, p in read_map(PICKLE / staged[package])]
                        self.assertIn(package, names)

    def test_step_arguments_name_defs_that_exist(self):
        core = GAME / 'Data/Core/Defs'
        if not core.is_dir():
            self.skipTest('no installed game')
        things = set()
        for folder in (core, ROOT / 'Mod/Defs'):
            for file in folder.rglob('*.xml'):
                things.update(d.findtext('defName') for d in ET.parse(file).getroot() if d.tag == 'ThingDef')
        recipes = set()
        ads = WORKSHOP / '3238353862/1.6/Defs/HediffDefs'
        if ads.is_dir():
            for file in ads.glob('*.xml'):
                recipes.update(re.findall(r'<defName>([^<]+)</defName>', file.read_text(encoding='utf-8')))
        for file, text in step_lines():
            if text.startswith(PREFIX + ' the race'):
                with self.subTest(file=file, step=text):
                    quoted = re.findall(r'"([^"]*)"', text)
                    self.assertIn(quoted[0], things, 'not a ThingDef')
                    if 'recipe' in text and recipes:
                        self.assertIn(quoted[1], recipes, 'not a recipe of the installed ADS 2')

    def test_passes_are_selectable_by_the_filters_written_in_the_readme(self):
        readme = (PICKLE / 'README.md').read_text(encoding='utf-8')
        for tag in ('@sans-facultatifs', '@dlc-absent', '@clean-load', '@gallery'):
            self.assertIn(tag, readme, tag + ' is used by a feature and must be explained where the passes are')
        for name in sorted(f.stem for f in FEATURES.glob('*.feature')):
            self.assertIn(name, readme, name + ' is not placed in a pass of the README')


if __name__ == '__main__':
    unittest.main(verbosity=2)
