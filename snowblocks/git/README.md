# Colors

## _diff_ Syntax Highlighter

Instead of using the [diff-highlight][] tool that is bundled with _Git_ [diff-so-fancy][] was used for some time because it provided way better syntax highlighting features and styles.
Anyway, next to the fact that it is written in _Perl_ and required yet another interpreter installation, there have also been long-time problems regarding the `fatal: mismatched output` error when running as `interactive.diffFilter`. In https://github.com/so-fancy/diff-so-fancy/issues/296 and https://github.com/so-fancy/diff-so-fancy/issues/35 are long discussions and some proposed workarounds, but none really worked properly.

Anyway, next to the fact that it is written in _Perl_ and therefore requires yet another interpreter installation there have also been long-time problems regarding the `fatal: mismatched output` error when running as Git‘s `interactive.diffFilter`. There are long discussions and some workarounds in https://github.com/so-fancy/diff-so-fancy/issues/296 and https://github.com/so-fancy/diff-so-fancy/issues/35, but none really worked 100% even when additional new lines at the end have been removed from target files.

Therefore this configuration switched to [delta][] that not only provides the [same features like _diff-so-fancy_ and other highlighters][delta#features] but also comes with many more advantages.
The highlighting can also be styled using the same themes like [bat][], that is also already [available as _snowblock_][gh-tree-sb-bat], and so the colors have been adjusted to match the [Nord][] theme.
Note that the _Nord_ color palettes must be [provided through the terminal][nord-ports] as the 16 ANSI base colors. Some _diff_ specific colors are specified as HEX tripplets. The background colors for added, removed and modified lines have been adjusted in brightness and saturation using the [`scale()` function][sass-docs-mods-color#scale] of the [`color` module][sass-docs-mods] provided by the [official Sass reference implementation written in Dart][sass].

```scss
@use "sass:color";

$nord10: #5e81ac;
$nord11: #bf616a;

$minus-color: color.scale($nord11, $lightness: -28%, $saturation: -20%);
$plus-color: color.scale($nord10, $lightness: -22%, $saturation: -16%);
```

[bat]: https://github.com/sharkdp/bat
[delta]: https://github.com/dandavison/delta
[delta#features]: https://github.com/dandavison/delta#features
[diff-highlight]: https://github.com/git/git/tree/master/contrib/diff-highlight
[diff-so-fancy]: https://github.com/so-fancy/diff-so-fancy
[gh-tree-sb-bat]: https://github.com/arcticicestudio/igloo/tree/master/snowblocks/bat
[nord-ports]: https://www.nordtheme.com/ports
[nord]: https://www.nordtheme.com
[sass-docs-mods-color#scale]: https://sass-lang.com/documentation/modules/color#scale
[sass-docs-mods]: https://sass-lang.com/documentation/modules
[sass]: https://github.com/sass/dart-sass
