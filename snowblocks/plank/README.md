* [dconf Configuration](#dconf-configuration)
* [Autostart](#autostart)

# dconf Configuration

The [dconf][dconf] dump [`plank.dconf`][config-dconf-gh] provides configurations for the `net.launchpad.plank` schema and can be loaded via `dconf` by run

```sh
dconf load /net/launchpad/plank/ < plank.dconf
```

A new dump can be exported via

```sh
dconf dump /net/launchpad/plank/ > plank.dconf
```

# Autostart

The [xdg snowblock][gh-sb-xdg] provides host specific [autostart][gh-sb-xdg-autostart] configurations for the [igloo][gh-sb-xdg-autostart-igloo] Plank launcher profile(s).

# References

* [Plank GitHub Repository][plank-gh]

[config-dconf-gh]: https://github.com/arcticicestudio/igloo/blob/develop/snowblocks/plank/plank.dconf
[dconf]: https://wiki.gnome.org/Projects/dconf
[gh-sb-xdg]: https://github.com/arcticicestudio/igloo/tree/develop/snowblocks/xdg
[gh-sb-xdg-autostart]: https://github.com/arcticicestudio/igloo/tree/develop/snowblocks/xdg/autostart
[gh-sb-xdg-autostart-igloo]: https://github.com/arcticicestudio/igloo/blob/develop/snowblocks/xdg/autostart/plank.desktop.igloo
[plank-gh]: https://github.com/ricotz/plank
