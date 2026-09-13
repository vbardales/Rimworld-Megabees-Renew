"""Rebuild the French DefInjected files and their source-path inventory."""
from pathlib import Path
import xml.etree.ElementTree as E
import json

ROOT = Path(__file__).resolve().parents[1]
LABELS = {
 'thorax':'thorax', 'abdomen':'abdomen', 'metathorax':'métathorax',
 'Trophylactic Stomach':'estomac trophallactique', 'Reproductive Tract':'appareil reproducteur',
 'megabee-like':'mégabeille', 'megabee':'mégabeille', 'megabee drone':'faux-bourdon de mégabeille',
 'brood':'couvain', 'Mandibles':'mandibules', 'head':'tête',
 'megabee egg (unfert.)':'œuf de mégabeille (non fécondé)',
 'megabee egg (fert.)':'œuf de mégabeille (fécondé)',
 'megabee tallow':'suif de mégabeille', 'megabee wool':'laine de mégabeille',
 'megabee tallow salve':'onguent au suif de mégabeille',
 'left elytra':'élytre gauche', 'right elytra':'élytre droit',
 'left eye':'œil gauche', 'right eye':'œil droit',
 'left antenna':'antenne gauche', 'right antenna':'antenne droite',
 'primary trophylactic stomach':'estomac trophallactique primaire',
 'secondary trophylactic stomach':'estomac trophallactique secondaire',
 'tertiary trophylactic stomach':'estomac trophallactique tertiaire',
 'quaternary trophylactic stomach':'estomac trophallactique quaternaire',
 'front left leg':'patte antérieure gauche', 'front right leg':'patte antérieure droite',
 'middle left leg':'patte médiane gauche', 'middle right leg':'patte médiane droite',
 'rear left leg':'patte postérieure gauche', 'rear right leg':'patte postérieure droite',
}
DESCRIPTIONS = {
 'Megabee': "Issues d'une ingénierie génétique débridée, les mégabeilles sont plutôt inhabituelles sur la Bordure. Dépourvues de dard et extrêmement dociles, elles doivent à leur taille imposante et à leur ressemblance avec les abeilles mellifères de dissuader la plupart des prédateurs.\\n\\nLeur organisme est optimisé pour produire des ressources : elles peuvent produire du miel sans ruche ni autre structure, leur fourrure a été modifiée pour se comporter comme de la laine et elles peuvent même pondre des œufs non fécondés, comme les poules.\\n\\nCes véritables machines de production vivantes ont toutefois un appétit considérable. Elles mangent volontiers ce qu'elles trouvent : cultures, arbres et toutes sortes d'autres plantes.\\n\\nBien que très dociles, elles sont quelque peu capricieuses et ont tendance à vagabonder. Une fois apprivoisées, elles peuvent néanmoins se montrer très affectueuses.",
 'EggMegabeeUnfertilized': "Un œuf de mégabeille non fécondé. Il peut être consommé cru, mais il est bien meilleur cuit. Ces œufs de la taille d'un torse humain sont peu appétissants, mais un seul suffit à nourrir une petite famille.",
 'EggMegabeeFertilized': "Un œuf de mégabeille fécondé. Si tout se passe bien, une jeune mégabeille devrait en éclore. Il peut être consommé cru, mais il est bien meilleur cuit.",
 'MegabeeTallow': "Une substance proche de la gelée d'insecte géant, produite par les mégabeilles. Elle reste assez liquide jusqu'à son exposition à l'air libre, qui gélifie ses couches externes et facilite grandement son stockage. Sur les mondes où l'on élève des mégabeilles, les enfants raffolent des « geysers de mégabeille » : de petites portions de suif solidifiées, à l'enveloppe moelleuse et au cœur liquide. Ses propriétés antimicrobiennes lui permettent de ne jamais provoquer d'intoxication alimentaire. On peut même en faire un onguent d'une efficacité comparable à l'extrait d'herbe médicinale.",
 'WoolMegabee': "Une pseudo-laine rigide et fibreuse récoltée sur les mégabeilles. Sans être particulièrement douce, elle offre une isolation thermique convenable et résiste à la chaleur. Son extraordinaire durabilité en fait un bon matériau pour les vêtements et les constructions, d'autant qu'une seule mégabeille en fournit une quantité considérable à chaque tonte.",
 'MedicineMegabee': "Un onguent fabriqué à partir de la fourrure et du suif d'une mégabeille. Les propriétés antimicrobiennes du suif le rendent presque aussi efficace que l'herbe médicinale, tout en le rendant bien plus facile à obtenir lorsque la colonie possède une mégabeille.",
}

def handle(n, parent, index):
    if parent.tag == 'parts':
        return (n.findtext('customLabel') or n.findtext('def')).replace(' ', '_')
    if parent.tag in {'tools','lifeStages'} and n.findtext('label'):
        return n.findtext('label').replace(' ', '_')
    return str(index)

def main():
    outputs, inventory = {}, []
    for file in sorted((ROOT/'Mod/Defs').glob('*.xml')):
        for d in E.parse(file).getroot():
            name = d.findtext('defName')
            def walk(node, key, xpath):
                if node.tag in {'label','description','customLabel','labelMale','labelPlural'}:
                    text = DESCRIPTIONS[name] if node.tag == 'description' else LABELS[node.text]
                    root = outputs.setdefault(d.tag, E.Element('LanguageData'))
                    E.SubElement(root, key).text = text
                    inventory.append(dict(file=file.relative_to(ROOT).as_posix(), type=d.tag,
                        defName=name, xpath=xpath, key=key, english=node.text))
                for i, child in enumerate(list(node)):
                    segment = handle(child,node,i) if child.tag == 'li' else child.tag
                    xmlsegment = f'li[{i+1}]' if child.tag == 'li' else child.tag
                    walk(child, key+'.'+segment, xpath+'/'+xmlsegment)
            for child in d:
                walk(child, name+'.'+child.tag, child.tag)
    for typ, root in outputs.items():
        folder=ROOT/'Mod/Languages/French/DefInjected'/typ
        folder.mkdir(parents=True,exist_ok=True)
        E.indent(root, space='  ')
        E.ElementTree(root).write(folder/'Megabees.xml',encoding='utf-8',xml_declaration=True)
    (ROOT/'Tests/translation-inventory.json').write_text(json.dumps(inventory,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
    print(f'Wrote {len(inventory)} French fields across {len(outputs)} Def types')

if __name__ == '__main__': main()
