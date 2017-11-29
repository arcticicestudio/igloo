* [dconf Configuration](#dconf-configuration)
* [Nord Color Scheme](#nord-color-scheme)
* [Key Mappings](#key-mappings)
  * [tmux snowblock compatibility](#tmux-snowblock-compatibility)
* [References](#references)

# dconf Configuration

The [dconf][dconf] dump [`tilix.dconf`][config-dconf-gh] provides configurations for the `com.gexperts.Tilix` Tilix schema and can be loaded via `dconf` by run

```sh
dconf load /com/gexperts/Tilix/ < tilix.dconf
```

A new dump can be exported via

```sh
dconf dump /com/gexperts/Tilix/ > tilix.dconf
```

# Nord Color Scheme

The [Nord Tilix][nord-tilix-gh] color scheme, included in the current [`tilix.dconf` dconf dump](##dconf-configuration), is installed through the AUR [`nord-tilix`][nord-tilix-aur] package version `0.3.0-2`.

# Key Mappings

## tmux snowblock compatibility

The key mappings

* *Scroll down* <kbd>Shift</kbd> + <kbd>Ctrl</kbd> + <kbd>Down</kbd>
* *Scroll up* <kbd>Shift</kbd> + <kbd>Ctrl</kbd> + <kbd>Up</kbd>

have been disabled for compatibility reasons with the [tmux snowlbock][gh-sb-tmux]. It provides key mappings to resize panes via <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>🠨</kbd><kbd>🠩</kbd><kbd>🠪</kbd><kbd>🠫</kbd> which key press events are catched by the Tilix efault terminal scroll key mappings.

# References

* [Official Tilix Website][tilix]
* [Tilix GitHub Repository][tilix-gh]

[config-dconf-gh]: https://github.com/arcticicestudio/igloo/blob/develop/snowblocks/tilix/config.dconf
[dconf]: https://wiki.gnome.org/Projects/dconf
[nord-tilix-aur]: https://aur.archlinux.org/packages/nord-tilix
[nord-tilix-gh]: https://github.com/arcticicestudio/nord-tilix
[tilix]: https://gnunn1.github.io/tilix-web
[tilix-gh]: https://github.com/gnunn1/tilix
[gh-sb-tmux]: https://github.com/arcticicestudio/igloo/tree/develop/snowblocks/tmux
