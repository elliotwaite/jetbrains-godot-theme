import collections.abc
import copy
import json
import os
import yaml
import xml.etree.cElementTree as ET
import xml.dom.minidom as minidom

CUR_DIR = os.path.dirname(__file__)
OUTPUT_DIR = os.path.join(CUR_DIR, '../src/main/resources')

BASE_IDE_THEME_PATH = os.path.join(CUR_DIR, 'base_theme/one_dark_ide.json')
OVERRIDE_IDE_THEME_PATH = os.path.join(CUR_DIR, 'override_theme/godot_ide.json')
OVERRIDE_IDE_COLORS_PATH = os.path.join(CUR_DIR, 'override_theme/godot_ide_colors.json')
OUTPUT_IDE_THEME_PATH = os.path.join(OUTPUT_DIR, 'godot_theme.theme.json')

BASE_EDITOR_THEME_PATH = os.path.join(CUR_DIR, 'base_theme/one_dark_editor.yaml')
OVERRIDE_EDITOR_THEME_PATH = os.path.join(CUR_DIR, 'override_theme/godot_editor.yaml')
OVERRIDE_EDITOR_COLORS_PATH = os.path.join(CUR_DIR, 'override_theme/godot_editor_colors.yaml')
OVERRIDE_EDITOR_COLOR_MAP_PATH = os.path.join(CUR_DIR, 'override_theme/godot_editor_color_map.yaml')
OUTPUT_EDITOR_THEME_PATH = os.path.join(OUTPUT_DIR, 'godot_theme.xml')

THEME_NAME = 'Godot Theme'

OPTION_TO_TYPE_AND_CODE = {
    'bold': ('font-type', '1'),
    'italic': ('font-type', '2'),
    'bold-italic': ('font-type', '3'),
    'underscored': ('effect-type', '1'),
    'underwaved': ('effect-type', '2'),
    'strikeout': ('effect-type', '3'),
    'bold-underscored': ('effect-type', '4'),
    'dotted-line': ('effect-type', '5'),
    'bordered': ('effect-type', '6'),
}


def dict_deep_update(dest_dict, source_dict):
    for key, val in source_dict.items():
        if isinstance(val, collections.abc.Mapping):
            dest_dict[key] = dest_dict.get(key, {})
            if not isinstance(dest_dict[key], collections.abc.Mapping):
                dest_dict[key] = {}
            dict_deep_update(dest_dict[key], val)
        else:
            dest_dict[key] = val


def dict_deep_replace_vals(dest_dict, replacement_vals):
    for key, val in dest_dict.items():
        if isinstance(val, collections.abc.Mapping):
            dict_deep_replace_vals(val, replacement_vals)
        elif val in replacement_vals:
            dest_dict[key] = replacement_vals[val]


def build_ide_theme():
    with open(BASE_IDE_THEME_PATH) as f:
        base_ide_theme = json.load(f)

    with open(OVERRIDE_IDE_THEME_PATH) as f:
        override_ide_theme = json.load(f)

    with open(OVERRIDE_IDE_COLORS_PATH) as f:
        override_ide_colors = json.load(f)

    dict_deep_replace_vals(override_ide_theme, override_ide_colors)
    dict_deep_update(base_ide_theme, override_ide_theme)

    with open(OUTPUT_IDE_THEME_PATH, 'w') as f:
        json.dump(base_ide_theme, f, indent=2)


class EditorThemeBuilder:
    def __init__(self, theme, italic=False):
        self.theme = theme
        self.italic = italic

    def should_add_option(self, condition):
        return condition == 'always' or (condition == 'theme' and self.italic is True)

    def build_parsed_theme(self):
        theme = copy.deepcopy(self.theme)

        for attribute, options in theme['attributes'].items():
            # String-only options are the foreground color.
            if isinstance(options, str):
                theme['attributes'][attribute] = {'foreground': options}
                continue

            saved_options = options.copy()
            for option, condition in list(options.items()):
                if option in OPTION_TO_TYPE_AND_CODE:
                    # Remove the original option.
                    del theme['attributes'][attribute][option]

                    # Add the actual JetBrains option if it applies to this theme.
                    if self.should_add_option(condition):
                        option_type, option_code = OPTION_TO_TYPE_AND_CODE[option]
                        theme['attributes'][attribute][option_type] = option_code

                else:
                    theme['attributes'][attribute][option] = condition

            # If an option is both bold and italic, update the option code.
            if ('bold' in saved_options and 'italic' in saved_options and
                    self.should_add_option(saved_options['italic'])):
                option_code = OPTION_TO_TYPE_AND_CODE['bold-italic'][1]
                theme['attributes'][attribute]['font-type'] = option_code

        return theme

    @staticmethod
    def build_xml(theme):
        scheme = ET.Element('scheme')

        scheme.attrib['name'] = THEME_NAME
        scheme.attrib['parent_scheme'] = theme['parent-scheme']
        scheme.attrib['version'] = '142'

        colors = ET.SubElement(scheme, 'colors')
        for name, value in theme['colors'].items():
            ET.SubElement(colors, 'option', name=name, value=value)

        attributes = ET.SubElement(scheme, 'attributes')

        for attribute, base_attribute in theme['inheriting-attributes'].items():
            ET.SubElement(
                attributes,
                'option',
                name=attribute,
                baseAttributes=base_attribute
            )

        for name, styles in theme['attributes'].items():
            option = ET.SubElement(attributes, 'option', name=name)
            value = ET.SubElement(option, 'value')

            for style_name, style_value in styles.items():
                ET.SubElement(
                    value,
                    'option',
                    name=style_name.replace('-', '_').upper(),
                    value=style_value
                )

        attributes[:] = sorted(attributes, key=lambda e: e.get('name'))

        return ET.ElementTree(scheme)

    def write(self, output_path):
        parsed_theme = self.build_parsed_theme()
        xml = self.build_xml(parsed_theme)
        with open(output_path, 'w') as f:
            f.write(minidom.parseString(ET.tostring(xml.getroot())).toprettyxml(indent='  '))


def build_editor_theme():
    with open(BASE_EDITOR_THEME_PATH) as f:
        base_editor_theme = yaml.load(f, Loader=yaml.FullLoader)

    with open(OVERRIDE_EDITOR_THEME_PATH) as f:
        override_editor_theme = yaml.load(f, Loader=yaml.FullLoader)

    with open(OVERRIDE_EDITOR_COLORS_PATH) as f:
        override_editor_colors = yaml.load(f, Loader=yaml.FullLoader)

    with open(OVERRIDE_EDITOR_COLOR_MAP_PATH) as f:
        override_editor_color_map = yaml.load(f, Loader=yaml.FullLoader)

    dict_deep_replace_vals(base_editor_theme, override_editor_color_map)
    dict_deep_update(base_editor_theme, override_editor_theme)
    dict_deep_replace_vals(base_editor_theme, override_editor_colors)

    builder = EditorThemeBuilder(base_editor_theme, italic=False)
    builder.write(OUTPUT_EDITOR_THEME_PATH)


def main():
    build_ide_theme()
    build_editor_theme()
    print('Theme files generated.')


if __name__ == '__main__':
    main()
