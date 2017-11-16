* [Units](#units)
  * [Services](#services)
    * [igloosync-dropbox](#igloosync-dropbox)
      * [`gocryptfs` and `secret-tool` setup](#gocryptfs-and-secret-tool-setup)
      * [`libfuse` configuration](#libfuse-configuration)

# Units

## Services

### igloosync-dropbox

#### `gocryptfs` and `secret-tool` setup

> The [gocryptfs][gocryptfs-gh] password **must be stored in the** [GNOME Keyring][archwiki-keyring] **before enabling this user service** in order to receive the value from the [`secret-tool`][gnome-libsecret]!

The stored password must be assigned with the following attribute-value pair:

* attribute: `igloosync`
* value: `dropbox`

To store the password run

```sh
secret-tool store --label="igloosync-dropbox" igloosync dropbox
```

The password can be received from the `secret-tool` by running

```sh
secret-tool lookup igloosync dropbox
```

#### `libfuse` configuration

[FUSE][fuse] ([libfuse][libfuse]) must be configured with the `/etc/fuse.conf` file to allow non-root users to specify the `allow_other` or `allow_root` mount options which overrides the security measure restricting file access to the filesystem owner, so that all users (including root) can access the files.

This is necessary to access the files of the mounted `gocryptfs` volume with applications that are run via `sudo`. It is used in the [pacman][snowblock-pacman] snowblock for the local package repository `bitfroest` which would throw a *Permission Denied* exception when running `pacman` (e.g. `sudo pacman -Sy`) if the volume is not mounted with the `gocryptfs -allow_other` option.

Please note that `libfuse` has a **[unresolved security bug][libfuse-secbug]** when using the `allow_other` mount option as [described in the official documentation][libfuse-sec], but is of **little concern if the filesystem is accessible only to the mounting user** which is the case since these are **dotfiles for a personal system**:

> No other user (including root) can access the contents of the mounted filesystem (though this can be relaxed by allowing the use of the `allow_other` and `allow_root` mount options in `/etc/fuse.conf`)
> 
> If you intend to use the allow_other mount options, be aware that FUSE has an unresolved [security bug][libfuse-secbug]: if the `default_permissions` mount option is not used, the results of the first permission check performed by the file system for a directory entry will be re-used for subsequent accesses as long as the inode of the accessed entry is present in the kernel cache - even if the permissions have since changed, and even if the subsequent access is made by a different user. This is of little concern if the filesystem is accessible only to the mounting user (which has full access to the filesystem anyway), but becomes a security issue when other users are allowed to access the filesystem (since they can exploit this to perform operations on the filesystem that they do not actually have permissions for).
> 
> This bug needs to be fixed in the Linux kernel and has been known since 2006 but unfortunately no fix has been applied yet. If you depend on correct permission handling for FUSE file systems, the only workaround is to use `default_permissions` (which does not currently support ACLs), or to completely disable caching of directory entry attributes.

[archwiki-keyring]: https://wiki.archlinux.org/index.php/GNOME/Keyring
[fuse]: https://en.wikipedia.org/wiki/Filesystem_in_Userspace
[gnome-libsecret]: https://wiki.gnome.org/Projects/Libsecret
[gocryptfs-gh]: https://github.com/rfjakob/gocryptfs
[libfuse]: https://github.com/libfuse/libfuse
[libfuse-sec]: https://github.com/libfuse/libfuse#security-implications
[libfuse-secbug]: https://github.com/libfuse/libfuse/issues/15
[snowblock-pacman]: https://github.com/arcticicestudio/igloo/tree/develop/snowblocks/pacman
