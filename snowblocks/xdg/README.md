* [Application Desktop Entries](#application-desktop-entries)
* [Autostart](#autostart)
* [Bookmarks](#bookmarks)
* [User Directories](#user-directories)

### Application Desktop Entries

All application `*.desktop` entry files adhere the freedesktop [Desktop Entry Specification][fd-spec-desktop-entry].

Read the [Arch Linux Wiki][archw-desktop-entries] site for detailed information and examples.

### Autostart

In an XDG-compliant desktop environment, such as GNOME, the desktop environment will automatically start `*.desktop` files found in the directories specified in the [Desktop Application Autostart Specification][fd-spec-autostart]:

* System-wide: `$XDG_CONFIG_DIRS/autostart/` (`/etc/xdg/autostart/` by default)
  * GNOME also starts files found in `/usr/share/gnome/autostart/`
* User-specific: `$XDG_CONFIG_HOME/autostart/` (`~/.config/autostart/` by default)

System-wide `*.desktop` files can be overridden via the user-specific `~/.config/autostart/` folder.

References:

* [Arch Linux Wiki - Desktop Entries (Autostart)][archw-desktop-entries-autostart]

### Bookmarks

All bookmark configurations adhere the freedesktop [Desktop Bookmark Specification][fd-spec-bookmark].

### User Directories

All user directory configurations adhere the freedesktop [XDG user directories][archw-xdg-user-dir] specification.

[archw-desktop-entries]: https://wiki.archlinux.org/index.php/Desktop_entries
[archw-desktop-entries-autostart]: https://wiki.archlinux.org/index.php/Desktop_entries#Autostart
[archw-xdg-user-dir]: https://wiki.archlinux.org/index.php/XDG_user_directories
[fd-spec-autostart]: https://specifications.freedesktop.org/autostart-spec/autostart-spec-latest.html
[fd-spec-bookmark]: https://www.freedesktop.org/wiki/Specifications/desktop-bookmark-spec/
[fd-spec-desktop-entry]: https://specifications.freedesktop.org/desktop-entry-spec/latest/
