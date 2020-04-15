# _dconf_ Configuration

The [dconf][] dump [`plank.dconf`][blob-plank.dconf] provides configurations for the `net.launchpad.plank` schema.

```sh
# Load the schema configurations from the dump file.
dconf load /net/launchpad/plank/ < plank.dconf

# Export the schema configurations as dump file.
dconf dump /net/launchpad/plank/ > plank.dconf
```

Also see [_Plank_'s GitHub repository][ricotz/plank] for more documentations and details.

# _XDG_ Autostart

The [_XDG_ _snowblock_][tree-sb-xdg] provides host specific [autostart][archw-xdg_autostart] configurations for the `igloo` _Plank_ launcher profile.

[archw-plank]: https://wiki.archlinux.org/index.php/Plank
[archw-xdg_autostart]: https://wiki.archlinux.org/index.php/XDG_Autostart
[blob-plank.dconf]: https://github.com/arcticicestudio/igloo/blob/master/snowblocks/plank/plank.dconf
[dconf]: https://wiki.gnome.org/Projects/dconf
[ricotz/plank]: https://github.com/ricotz/plank
[tree-sb-xdg-autostart]: https://github.com/arcticicestudio/igloo/tree/master/snowblocks/xdg/autostart
[tree-sb-xdg]: https://github.com/arcticicestudio/igloo/tree/master/snowblocks/xdg
