* [Mapping scancodes to keycodes](#mapping-scancodes-to-keycodes)
  * [Logitech R400 Presenter](#logitech-r400-presenter)
    * [Find out the input event ID](#find-out-the-input-event-id)
    * [Identifying the scancodes](#identifying-the-scancodes)
    * [Update and reload the Hardware Database Index](#update-and-reload-the-hardware-database-index)
    * [Verify the new mappings](#verify-the-new-mappings)

# Mapping scancodes to keycodes

## Logitech R400 Presenter

The [Logitech R400 Presenter][logitech-r400-presenter] works out-of-the-box™ for presentations made with the React library [Spectacle][], but can not be used for the [Code Slide][gh-jamiebuilds/spectacle-code-slide] extension because it requires to use the <kbd>⭡</kbd> and <kbd>⭣</kbd> keys.

The presenter itself includes two more controls for slideshows:

* „play“ (lower-left)
* „toggle screen“ (lower-right)

These are designed for applications like _LibreOffice Impress_ or _Microsoft PowerPoint_, but have no meaningful use for _Spectacle_-based presentations. [udev][archw-udev] can be used to change the mappings for both buttons to fire key events for the <kbd>⭡</kbd> and <kbd>⭣</kbd> keys instead. This allows to also use the presenter for presentations with the _Code Slide_ extension.

Make sure to read the Arch Linux Wiki pages about [extra keyboard keys][archw-extra-keyboard-keys] and how to [map scancodes to keycodes][archw-map-scancodes-to-keycodes] to get more information about the way it works. There is also a blog post about [tweaking the Logitech R400 presenter tool on Linux][ref-blog-rweaking-r400].

The [`igloo-udev-logitech-r400-presenter.hwdb`][gh-igloo-udev-logitech-r400-presenter.hwdb] file contains custom mappings to this use case and be installed by copying it to the `/etc/udev/hwdb.d` directory. The following subsections contain information about the creation and functionality of this file.

### Find out the input event ID

The first column of a udev rule represents the scancode. It can be obtained by looking up which input event ID the device was tied to:

```sh
ls /dev/input/by-id/usb-Logitech_USB_Receiver-event-kbd
```
Alternatively, `stat` can be used:

```sh
stat -t /dev/input/by-id/usb-Logitech_USB_Receiver-event-kbd --printf "%N\n"
```

This will print the target of the symlink, e.g. `event15`. Verify the result of the bound event ID against the `/proc/bus/input/devices`:

```sh
cat /proc/bus/input/devices | rg --context 10 Logitech
```

### Identifying the scancodes

Run [evtest][archpkg-evtest] (or `showkey` when using a virtual console in a non-graphical environment) against the input event and press one of the buttons on the presenter. This will print the scancode and keycode.

```sh
# Will require root privileges
evtest /dev/input/<EVENT_ID>
# Example: evtest /dev/input/event15
```

**Example result for all buttons**:

```sh
# ...
Testing ... (interrupt to exit)
# key "left"
Event: time 1529159600.115918, type 4 (EV_MSC), code 4 (MSC_SCAN), value 7004b
Event: time 1529159600.115918, type 1 (EV_KEY), code 104 (KEY_PAGEUP), value 1
Event: time 1529159600.115918, -------------- SYN_REPORT ------------
Event: time 1529159600.195903, type 4 (EV_MSC), code 4 (MSC_SCAN), value 7004b
Event: time 1529159600.195903, type 1 (EV_KEY), code 104 (KEY_PAGEUP), value 0
Event: time 1529159600.195903, -------------- SYN_REPORT ------------
# key "right"
Event: time 1529159620.267783, type 4 (EV_MSC), code 4 (MSC_SCAN), value 7004e
Event: time 1529159620.267783, type 1 (EV_KEY), code 109 (KEY_PAGEDOWN), value 1
Event: time 1529159620.267783, -------------- SYN_REPORT ------------
Event: time 1529159620.387780, type 4 (EV_MSC), code 4 (MSC_SCAN), value 7004e
Event: time 1529159620.387780, type 1 (EV_KEY), code 109 (KEY_PAGEDOWN), value 0
Event: time 1529159620.387780, -------------- SYN_REPORT ------------
# key "play"
Event: time 1529159635.691683, type 4 (EV_MSC), code 4 (MSC_SCAN), value 7003e
Event: time 1529159635.691683, type 1 (EV_KEY), code 425 (KEY_PRESENTATION), value 1
Event: time 1529159635.691683, -------------- SYN_REPORT ------------
Event: time 1529159635.851676, type 4 (EV_MSC), code 4 (MSC_SCAN), value 7003e
Event: time 1529159635.851676, type 1 (EV_KEY), code 425 (KEY_PRESENTATION), value 0
Event: time 1529159635.851676, -------------- SYN_REPORT ------------
# key "toggle screen"
Event: time 1529159644.331624, type 4 (EV_MSC), code 4 (MSC_SCAN), value 70037
Event: time 1529159644.331624, type 1 (EV_KEY), code 431 (KEY_DISPLAYTOGGLE), value 1
Event: time 1529159644.331624, -------------- SYN_REPORT ------------
Event: time 1529159644.459619, type 4 (EV_MSC), code 4 (MSC_SCAN), value 70037
Event: time 1529159644.459619, type 1 (EV_KEY), code 431 (KEY_DISPLAYTOGGLE), value 0
Event: time 1529159644.459619, -------------- SYN_REPORT ------------
# ...
```

This example shows that

* `KEY_PAGEUP` (left) has scancode `7004b` and keycode `104`
* `KEY_PAGEDOWN` (right) has scancode `7004e` and keycode `109`
* `KEY_PRESENTATION` („play“) has scancode `7003e` and keycode `425`
* `KEY_DISPLAYTOGGLE` (toggle screen“) has scancode `70037` and keycode `431`

### Create the custom udev rule

**Note**: Make sure to read the Arch Linux Wiki about how to [map scancodes to keycodes using udev][archw-map-scancodes-to-keycodes] and `udev(7)`! They contain details about

* the _udev_ hardware database index `/etc/udev/hwdb.bin`.
* the default custom rule paths `/usr/lib/udev/hwdb.d/`, `/run/udev/hwdb.d/` and `/etc/udev/hwdb.d/`.
* the default _scancodes-to-keycodes_ mapping files `/usr/lib/udev/hwdb.d/60-keyboard.hwdb` and `/lib/udev/hwdb.d/60-keyboard.hwdb` which are already include default mappings for the Logitech R400 presenter: `rg --context 6 R400 /usr/lib/udev/hwdb.d/60-keyboard.hwdb`

Create a new custom `.hwdb` file in the `/etc/udev/hwdb.d` directory, e.g. `/etc/udev/hwdb.d/igloo-udev-logitech-r400-presenter.hwdb`:

```raw
evdev:input:b0003v046DpC52D*
 KEYBOARD_KEY_07004b=left
 KEYBOARD_KEY_07004e=right
 KEYBOARD_KEY_07003e=up
 KEYBOARD_KEY_070037=down
```

This maps the „play“ and „toggle screen“ button to the <kbd>⭡</kbd> (up) and <kbd>⭣</kbd> (down) keys. **Note that the single whitespace character at the beginning of each mapping line is required!**

### Update and reload the Hardware Database Index

By default, the `systemd-hwdb-update.service` service takes care to rebuilt the hardware database index file `/etc/udev/hwdb.bin` on boot and after a systemd update as [described in the Arch Wiki][archw-map-scancodes-to-keycodes-index-update].

To apply newly added mappings or configuration changes without a reboot, the index needs to be rebuilt and reloaded manually:

```sh
# Built the index file (will require root privileges)...
systemd-hwdb update

# ...and reload it.
udevadm trigger
```

### Verify the new mappings

To verify that the new mappings have successfully been applied the hardware database index can be queried with `udevadm`:

```sh
udevadm info /dev/input/by-id/usb-Logitech_USB_Receiver-event-kbd | rg KEYBOARD_KEY
```

**Example output**:

```sh
# ...
E: KEYBOARD_KEY_070029=presentation
E: KEYBOARD_KEY_070037=down
E: KEYBOARD_KEY_07003e=up
E: KEYBOARD_KEY_07004b=left
E: KEYBOARD_KEY_07004e=right
# ...
```

[archpkg-evtest]: https://www.archlinux.org/packages/community/x86_64/evtest
[archw-extra-keyboard-keys]: https://wiki.archlinux.org/index.php/Extra_keyboard_keys
[archw-map-scancodes-to-keycodes]: https://wiki.archlinux.org/index.php/Map_scancodes_to_keycodes#Using_udev
[archw-map-scancodes-to-keycodes-index-update]: https://wiki.archlinux.org/index.php/Map_scancodes_to_keycodes#Updating_the_Hardware_Database_Index
[archw-udev]: https://wiki.archlinux.org/index.php/Udev
[gh-jamiebuilds/spectacle-code-slide]: https://github.com/jamiebuilds/spectacle-code-slide
[gh-igloo-udev-logitech-r400-presenter.hwdb]: https://github.com/arcticicestudio/igloo/blob/develop/snowflakes/udev/rules/igloo-udev-logitech-r400-presenter.hwdb
[logitech-r400-presenter]: https://www.logitech.com/en-us/product/wireless-presenter-r400
[ref-blog-rweaking-r400]: https://derickrethans.nl/logitech-r400-take2.html
[spectacle]: https://formidable.com/open-source/spectacle
