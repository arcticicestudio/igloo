* [dconf Configuration](#dconf-configuration)
* [Nord Color Scheme](#nord-color-scheme)
* [References][#references]

# dconf Configuration

The [dconf][dconf] dump [`config.dconf`][config-dconf-gh] provides configurations for the `com.gexperts.Tilix` Tilix schema and can be loaded via `dconf` by run

```sh
dconf load /com/gexperts/Tilix/ < config.dconf
```

# Nord Color Scheme

The [Nord Tilix][nord-tilix-gh] color scheme, included in the current [`config.dconf` dconf dump](##dconf-configuration), is installed through the AUR [`nord-tilix`][nord-tilix-aur] package version `0.3.0-2`.

# References

* [Official Tilix Website][tilix]
* [Tilix GitHub Repository][tilix-gh]
* [Official *dconf* GNOME Project Website][dconf]

[config-dconf-gh]: https://github.com/arcticicestudio/igloo/blob/develop/snowblocks/tilix/config.dconf
[dconf]: https://wiki.gnome.org/Projects/dconf
[nord-tilix-aur]: https://aur.archlinux.org/packages/nord-tilix
[nord-tilix-gh]: https://github.com/arcticicestudio/nord-tilix
[tilix]: https://gnunn1.github.io/tilix-web
[tilix-gh]: https://github.com/gnunn1/tilix
