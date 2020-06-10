## Godot Theme for JetBrains IDEs (PyCharm, IntelliJ, etc.)
This is a JetBrains theme designed to look like the [Godot editor's](https://docs.godotengine.org/en/stable/getting_started/step_by_step/intro_to_the_editor_interface.html) default theme.

## Install
In your IDE, go to Settings > Plugins > Marketplace, and search for "Godot Theme," then select the plugin and click "Install."<br>

Or you can download it here: [https://plugins.jetbrains.com/plugin/14374-godot-theme](https://plugins.jetbrains.com/plugin/14374-godot-theme)

## Matching The Godot Editor's Font
To match the Godot editor's font, use the following settings: 
* Preferences > Editor > Font > Font: Source Code Pro (downloadable [here](https://fonts.google.com/specimen/Source+Code+Pro))
* Preferences > Appearance & Behavior > Appearance > Antialiasing > IDE: Greyscale
* Preferences > Appearance & Behavior > Appearance > Antialiasing > Editor: Greyscale

## GDScript Syntax Highlighting Issues
The syntax highlighting is currently only working for Python.
To get the syntax highlighting somewhat working for GDScript, 
install the [GDScript plugin](https://plugins.jetbrains.com/plugin/13107-gdscript). 
But since that plugin does not classify all the different types of syntax symbols, 
many of the symbols cannot be targeted to be set to the correct color. 
Hopefully this will be improved in the future.

## Screenshot
<img src="https://raw.githubusercontent.com/elliotwaite/jetbrains-godot-theme/master/screenshots/screenshot-v2.png" />

## Open Source
This theme is open source and was built on top of [One Dark](https://github.com/one-dark/jetbrains-one-dark-theme), which was used as the base theme, and then modified to look more like the Godot editor's default theme.
