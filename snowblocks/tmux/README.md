- [Configuration](#configuration)
  - [24-bit "True Color" Support](#24-bit-true-color-support)
  - [Automatic tpm Installation](#automatic-tpm-installation)
- [Key Mappings](#key-mappings)
- [Development](#development)
  - [Manual Plugin Loading](#manual-plugin-loading)

# Configuration

## 24-bit "True color" Support

[tmux][tmux] supports 24-bit _True color_ since version [2.2][tc-version].

To check if tmux has been compiled with _True color_ support start `tmux` and run

```sh
tmux info | grep Tc
```

If the output is `Tc: (flag) true` tmux supports _True color_, otherwise the output will be `Tc: [missing]`.

The 24-bit colors can be tested by run this inside tmux:

```awk
awk 'BEGIN{
  s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;
  for (colnum = 0; colnum<77; colnum++) {
    r = 255-(colnum*255/76);
    g = (colnum*510/76);
    b = (colnum*255/76);
    if (g>255) g = 510-g;
    printf "\033[48;2;%d;%d;%dm", r,g,b;
    printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
    printf "%s\033[0m", substr(s,colnum+1,1);
  }
  printf "\n";
  }'
```

If the line looks "stepwise" tmux does not use 24-bit _True color_:

![](https://raw.githubusercontent.com/arcticicestudio/igloo/master/snowblocks/tmux/assets/scrot-doc-tc-support-disabled.png)

Otherwise the line should have smooth transitions:

![](https://raw.githubusercontent.com/arcticicestudio/igloo/master/snowblocks/tmux/assets/scrot-doc-tc-support-enabled.png)

The `$TERM` environment variable is important for tmux as described in the official [tmux FAQ][tmux-faq]. The variable must be initialized with a terminal that supports 256 colors (`*-256color`). More information about 24-bit color terminal support can be found in the [ArchWiki][archw-24bit].

If the terminal supports _True color_ the `terminal-overrides` option must be set in the `~/.tmux.conf` file for the `$TERM` value and the _True color_ `Tc` tmux flag:

```sh
set-option -ga terminal-overrides ",xterm-256color:Tc"
```

This will reflect the actual `$TERM` outside of tmux and enables full compatibility.

For other terminals, replace `xterm-256color` with the relevant terminal type, stored in `$TERM`, **including the important `Tc` terminfo extension flag!**.

See the _tmux(1)_ man page for details about the `Tc` [terminfo][terminfo] extension.

## Automatic tpm Installation

If [tpm][tpm-gh] doesn't exist it can be automatically installed by adding this check from the [official tpm wiki][tpm-autoinstall] to `~/.tmux.conf`:

```sh
if "test ! -d ~/.tmux/plugins/tpm" \
  "run 'git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && ~/.tmux/plugins/tpm/bin/install_plugins'"
```

After cloning the tpm repository the [plugin installer helper script][tpm-bin-plugin-installer] will be run to install all configured plugins.

# Key Mappings

## Split windows

- Horizontal: <kbd>Prefix</kbd> - <kbd>h</kbd>
- Vertical: <kbd>Prefix</kbd> - <kbd>v</kbd>

## Switch windows

- Switch to previous window: <kbd>Prefix</kbd> - <kbd>Shift</kbd> + <kbd>🠨</kbd>
- Switch to next window: <kbd>Prefix</kbd> - <kbd>Shift</kbd> + <kbd>🠪</kbd>

## Resize panes

- Resize left: <kbd>Prefix</kbd> - <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>🠨</kbd>
- Resize right: <kbd>Prefix</kbd> - <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>🠪</kbd>
- Resize up: <kbd>Prefix</kbd> - <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>🠩</kbd>
- Resize down: <kbd>Prefix</kbd> - <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>🠫</kbd>

Please read the documentation of the [Tilix][gh-sb-tilix] snowblock about the [compatibility with the tmux key mappings][gh-sb-tilix-keymap-tmux-comp].

## Synchronize typing between panes

- Toggle typing synchronization: <kbd>Prefix</kbd> - <kbd>e</kbd>

# Development

## Manual Plugin Loading

Local plugins can be manually loaded without using [tpm][tpm-gh] by adding this to the `~/.tmux.conf`:

```sh
run-shell ~/.tmux/plugins/nord-tmux/nord.tmux
```

[archw-24bit]: https://wiki.archlinux.org/index.php/Tmux#24-bit_color
[faq]: https://github.com/tmux/tmux/wiki/FAQ#what-is-term-and-what-does-it-do
[gh-sb-tilix]: https://github.com/arcticicestudio/igloo/tree/master/snowblocks/tilix
[gh-sb-tilix-keymap-tmux-comp]: https://github.com/arcticicestudio/igloo/tree/master/snowblocks/tilix#tmux-snowblock-compatibility
[ghg-truecolor]: https://gist.github.com/XVilka/8346728
[tc-version]: https://github.com/tmux/tmux/commit/427b8204268af5548d09b830e101c59daa095df9
[terminfo]: https://en.wikipedia.org/wiki/Terminfo
[tmux]: https://tmux.github.io
[tpm-gh]: https://github.com/tmux-plugins/tpm
[tpm-autoinstall]: https://github.com/tmux-plugins/tpm/blob/master/docs/automatic_tpm_installation.md
[tpm-bin-plugin-installer]: https://github.com/tmux-plugins/tpm/blob/master/bin/install_plugins
