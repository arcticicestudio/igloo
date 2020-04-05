# GnuPG - The GNU Privacy Guard

> [GnuPG][] is a complete and free implementation of the OpenPGP standard as defined by [RFC4880][] (also known as PGP).

## Troubleshooting

### Fix failed IPC connection call on macOS

There is a problem where the `gpg-agent` is not able to create the socket files within the `~/.gnupg` folder that is symlinked to the [gocryptfs][] container (to securely store the GPG keys encrypted):

```raw
gpg: can’t connect to the agent: IPC connect call failed
```

See the „igloosync-dropbox“ setup from the [systemd][gh-igloo-snowblock-systemd] and [launchd][gh-igloo-snowblock-launchd] setup snowblocks.

The error might be caused by either the macOS filesystem (APFS) that doesn't support the creation of sockets (it works fine on other Arch Linux hosts like `igloo`) or by restrictions due to read/write permissions that are not passed through.

One solution/workaround is to change the default **absolute** file paths of the socket files by

1. creating a `S.gpg-agent` and `S.gpg-agent.ssh` file manually in the `$GNUPGPHOME` folder (defaults to `~/.gnupg`).
2. adding the `extra-socket` and `browser-socket` options in the `gpg-agent.conf` file with the desired paths.

**NOTE**: The created `S.gpg-agent` and `S.gpg-agent.ssh` files allow to use values of environment variables via [string interpolation][wikipedia-string-interpol], e.g. `${HOME}`.

###### `S.gpg-agent`

```raw
%Assuan%
socket=${HOME}/path/to/S.gpg-agent
```

###### `S.gpg-agent.ssh`

```raw
%Assuan%
socket=${HOME}/path/to/S.gpg-agent.ssh
```

###### `gpg-agent.conf`

```conf
# ...
# Disable the usage of the default/standard sockets.
no-use-standard-socket

# Set the cutom paths of the socket files.
extra-socket /path/to/S.gpg-agent.extra
browser-socket /path/to/S.gpg-agent.browser
# ...
```

**NOTE**: It is important to make sure that the **target folder exists** and the **permissions** are set to `700`!

```sh
chmod 700 ~/path/to/target/folder
```

See the [references](#references) for more information and details.

## References

**Fix failed IPC connection call on macOS**

* [gpg: can’t connect to the agent: IPC connect call failed][ref-blog-michaelheap-ipc-connect-fail]
* [GNUPG bugtracker: “gpg-agent 2.1 socket and nfs /home“][ref-gnupg-bugtracker-t1752]
* [How to configure GnuPG's S.gpg-agent socket location?]([ref-askubuntu-gpg-socket])

[gnupg]: https://www.gnupg.org
[gh-igloo-snowblock-launchd]: https://github.com/arcticicestudio/igloo/tree/develop/snowblocks/launchd
[gh-igloo-snowblock-systemd]: https://github.com/arcticicestudio/igloo/tree/develop/snowblocks/systemd
[gocryptfs]: https://github.com/rfjakob/gocryptfs
[ref-askubuntu-gpg-socket]: https://askubuntu.com/a/1053594
[ref-blog-michaelheap-ipc-connect-fail]: https://michaelheap.com/gpg-cant-connect-to-the-agent-ipc-connect-call-failed
[ref-gnupg-bugtracker-t1752]: https://dev.gnupg.org/T1752
[rfc4880]: https://www.ietf.org/rfc/rfc4880.txt
[wikipedia-string-interpol]: https://en.wikipedia.org/wiki/String_interpolation
