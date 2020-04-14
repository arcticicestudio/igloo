## _XDG_ Application Desktop Launchers

All application `*.desktop` launcher files adhere the [_XDG_ Desktop Entry Specification][fd-spec-desktop-entry].

See the _Arch Linux wiki_ page about [desktop entries][archw-desktop_entries] for more details.

## _XDG_ Autostart

In an _XDG_-compliant desktop environment, such as [GNOME][], the desktop environment will automatically start `*.desktop` files found in the directories specified in the [Desktop Application Autostart Specification][fd-spec-autostart]:

- System-wide: `$XDG_CONFIG_DIRS/autostart/` (`/etc/xdg/autostart/` by default)
  - GNOME also starts files found in `/usr/share/gnome/autostart`
- User-level: `$XDG_CONFIG_HOME/autostart` (`~/.config/autostart/` by default)

See the _Arch Linux_ wiki page about [desktop autostart entries][archw-desktop_entries#autostart] for more details.

## _XDG_ User Directories

All user directory configurations adhere the _freedesktop_/_XDG_ [user directories specification][archw-xdg_user_dir].

[archw-desktop_entries]: https://wiki.archlinux.org/index.php/Desktop_entries
[archw-desktop_entries#autostart]: https://wiki.archlinux.org/index.php/Desktop_entries#Autostart
[archw-xdg_user_dir]: https://wiki.archlinux.org/index.php/XDG_user_directories
[fd-spec-autostart]: https://specifications.freedesktop.org/autostart-spec/autostart-spec-latest.html
[fd-spec-desktop-entry]: https://specifications.freedesktop.org/desktop-entry-spec/latest
[gnome]: https://www.gnome.org
