* [Troubleshooting](#troubleshooting)
  * [Fix instantaneous MacBook Pro suspend wakeup after lid close](#fix-instantaneous-macbook-pro-suspend-wakeup-after-lid-close)
    * [lid close behavior](#lid-close-behavior)
    * [custom suspend service](#custom-suspend-service)
    * [`system-sleep` hook](#system-sleep-hook)

# Troubleshooting

## Fix instantaneous MacBook Pro suspend wakeup after lid close

When closing the lid of a MacBook Pro (11,x) it will wakeup instantly instead of going into the suspend mode. This is caused by the `XHC1` device (USB ports) which is enabled (default) to fire a ACPI suspend wakeup event.

In order to prevent immediate wakeup after the lid has been closed the `XHC1` device must be disabled. This can be achieved by either using a [custom systemd suspend service][archw-suspend-service] (recommended) or a [`system-sleep` hook][archw-system-sleep-hook]. Note that the problem has been reported to the Linux Kernel and should be fixed by [13cfc732160f][gh-lk-fix-commit], but still can occur on different devices.

### lid close behavior

Make sure to [configure the behavior on lid close][archw-gnome-lid-behavior] before installing the service or hook by either

* use the automatic method via the GNOME Tweak Tool which can inhibit the *systemd* setting for the lid close ACPI event via the *Power* > *Suspend when laptop lid is closed* option.
* set the `HandleLidSwitch=suspend` option in `/etc/systemd/logind.conf` to let *systemd* handle the [ACPI event][archw-pw-mng-acpi-event].

The changes will be applied after the `systemd-logind` daemon has been restarted which will terminate all currently open user sessions.

### custom suspend service

Install the [`igloo-mbp-lid-suspend.service`][gh-unit-suspend] suspend/resume service file, a single hook that does all the work for different phases (sleep/resume) and for different targets (suspend/hibernate/hybrid-sleep).

```sh
sudo cp snowflakes/systemd/units/system/igloo-mbp-lid-suspend.service /lib/systemd/system/igloo-mbp-lid-suspend.service
sudo systemctl daemon-reload
sudo systemctl enable igloo-mbp-lid-suspend.service
```

### `system-sleep` hook

*systemd* runs all executables in `/usr/lib/systemd/system-sleep/`, passing two arguments to each of them:

* either `pre` or `post`: Depending on whether the machine is going to *sleep* or *waking* up
* `suspend`, `hibernate` or `hybrid-sleep`: Depending on which is being invoked

Install the [`igloo-mbp-lid-suspend.service.sh`][gh-hook-system-sleep] *system-sleep* hook:

```sh
sudo cp snowflakes/systemd/hooks/system-sleep/igloo-mbp-lid-suspend.service.sh /lib/systemd/system-sleep/igloo-mbp-lid-suspend.service.sh
sudo systemctl daemon-reload
```

The output of any custom script will be logged by `systemd-suspend.service`, `systemd-hibernate.service` or `systemd-hybrid-sleep.service` which can be shown with *systemd*'s [journal][archw-journal]:

```sh
journalctl -b -u systemd-suspend
```

See [systemd.special(7)][man-systemd.special] and [systemd.sleep(8)][man-systemd.sleep] for more details.

References:

* [MacBook Pro 11,x Suspend][archw-mbp-11x-suspend]
* [Instantaneous wakeups from suspend][archw-pw-mng-inst-wakeup]

[archw-journal]: https://wiki.archlinux.org/index.php/Systemd#Journal
[archw-gnome-lid-behavior]: https://wiki.archlinux.org/index.php/GNOME#Configure_behaviour_on_lid_switch_close
[archw-mbp-11x-suspend]: https://wiki.archlinux.org/index.php/MacBookPro11,x#Suspend
[archw-pw-mng-acpi-event]: https://wiki.archlinux.org/index.php/Power_management#ACPI_events
[archw-pw-mng-inst-wakeup]: https://wiki.archlinux.org/index.php/Power_management/Suspend_and_hibernate#Instantaneous_wakeups_from_suspend
[archw-suspend-service]: https://wiki.archlinux.org/index.php/Power_management#Combined_Suspend.2Fresume_service_file
[archw-system-sleep-hook]: https://wiki.archlinux.org/index.php/Power_management#Hooks_in_.2Fusr.2Flib.2Fsystemd.2Fsystem-sleep
[gh-hook-system-sleep]: https://github.com/arcticicestudio/igloo/blob/develop/snowflakes/systemd/hooks/system-sleep/igloo-mbp-lid-suspend.sh
[gh-lk-fix-commit]: https://github.com/torvalds/linux/commit/13cfc732160f7bc7e596128ce34cda361c556966
[gh-unit-suspend]: https://github.com/arcticicestudio/igloo/blob/develop/snowflakes/systemd/units/system/igloo-mbp-lid-suspend.service
[man-systemd.sleep]: https://www.freedesktop.org/software/systemd/man/sleep.conf.d.html
[man-systemd.special]: https://www.freedesktop.org/software/systemd/man/systemd.special.html
