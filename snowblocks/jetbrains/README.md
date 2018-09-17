# JetBrains IDEs

This snowblock provides all important configurations for all used [JetBrains][] IDEs and products, currently [IntelliJ][] (Ultimate Edition), [PyCharm][] (Community Edition), [Webstorm][] and [GoLand][]. For details about the paths for user configurations see the documentation about [directories used by the IDE to store settings, caches, plugins and logs][intellij-doc-settings-paths].

## Content

The includes configurations are mostly platform and IDE/product independent.

* The [code style][intellij-doc-code-style] XMl configuration file stored in the `codestyles` folder.
* The [inspections][intellij-doc-inspections] XMl configuration file stored in the `inspections` folder.
* The [keymaps][intellij-doc-keymap] XMl configuration files for Linux and macOS stored in the `keymaps` folder. See the [keymap reference][intellij-doc-keymap-ref] for a visual presentation of the default mappings.
* The [preference][intellij-doc-prefs] XMl configuration files are stored in the `options` folder:
  * `code.style.schemes.xml` - settings of the currently used code style.
  * `colors.scheme.xml` - settings of the currently used color scheme.
  * `customization.xml` and `project.default.xml` - settings of the customized [menus and toolbars][intellij-doc-menu-toolbar].
  * `editor.codeinsight.xml` - settings of various automatic code transformations.
  * `keymap.xml` - the currently used keymap.
  * `laf.xml` and `ui.lnf.yml` - settings of the currently used UI theme.
  * all other customized preferences defined in the various categories: `editor.xml`, `ide.general.xml` and `options.xml`
* The list of [disabled plugins][intellij-doc-plugins] stored in the `disabled_plugins.txt` file.

## Configurations

### Typeface

Due to licensing and the availability of specific font families on different operating systems the preferences for the sans-serif UI typefaces must be configured manually using the IntelliJ UI (_Preferences_ → _Appearance & Behavior_ → _Appearance_ → _UI Options_) or by adding the following `<option>` entries with the desired font family names:

```xml
<!-- Linux -->
<option name="FONT_FACE" value="Noto Sans" />

<!-- macOS (default font families) -->
<option name="FONT_FACE" value=".SF NS Text" />
```

The default and secondary monospace fonts for the editor typeface are system independent and have already been set in the [`editor.xml`][gh-igloo-sb-jb-editor.xml] file to [Source Code Pro][google-font-source-code-pro] and [Hack][font-hack]:

```xml
<option name="FONT_FAMILY" value="Source Code Pro" />
<option name="SECONDARY_FONT_FAMILY" value="Hack" />
```

### snowsaw core plugins

JetBrains uses a [naming scheme for the folder all user configurations][intellij-doc-settings-paths] are stored in based on the product major/minor version! This requires this snowblock to be updated as soon as the product gets updated to adapt to the new version string based on the pattern `<PRODUCT><VERSION>`.

The base target folder name for the `clean` and `link` plugins must be updated after updating to a new product version. Next to this, the `clean` plugin should also keep the previous target paths to ensure they are cleaned up after updating.

[font-hack]: https://sourcefoundry.org/hack
[gh-igloo-sb-jb-editor.xml]: https://github.com/arcticicestudio/igloo/blob/develop/snowblocks/jetbrains/ooptions/editor.xml
[goland]: https://www.jetbrains.com/go
[google-font-source-code-pro]: https://fonts.google.com/specimen/Source+Code+Pro
[intellij]: https://www.jetbrains.com/idea
[intellij-doc-code-style]: https://www.jetbrains.com/help/idea/settings-code-style.html
[intellij-doc-inspections]: https://www.jetbrains.com/help/idea/inspections-settings.html
[intellij-doc-keymap]: https://www.jetbrains.com/help/idea/settings-keymap.html
[intellij-doc-keymap-ref]: https://www.jetbrains.com/help/idea/keymap-reference.html
[intellij-doc-menu-toolbar]: https://www.jetbrains.com/help/idea/menus-and-toolbars.html
[intellij-doc-plugins]: https://www.jetbrains.com/help/idea/managing-plugins.html
[intellij-doc-prefs]: https://www.jetbrains.com/help/idea/settings-preferences-dialog.html
[intellij-doc-settings-paths]: https://intellij-support.jetbrains.com/hc/en-us/articles/206544519-Directories-used-by-the-IDE-to-store-settings-caches-plugins-and-logs
[jetbrains]: https://www.jetbrains.com/products.html
[pycharm]: https://www.jetbrains.com/pycharm
[webstorm]: https://www.jetbrains.com/webstorm
