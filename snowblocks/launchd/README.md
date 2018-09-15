# launchd

> In computing, [launchd][], a unified service-management framework, starts, stops and manages daemons, applications, processes, and scripts in macOS.

## igloosync-dropbox setup on macOS

This snowblock includes a user agent defining a job to auto-mount the `sync` [gocryptfs][] volume/container located in the [Dropbox][] folder receiving the password stored in the [macOS Keychain][apple-doc-keychain] via the macOS builtin system CLI tool `security`.
It requires the [gocryptfs][brew-gocryptfs] forumla and [dropbox][brew-cask-dropbox] cask to be installed.

### macOS Keychain setup

Store the gocryptfs volume/container password in the macOS [Keychain][apple-doc-keychain] app:

```sh
security add-generic-password -a sgreb -l igloosync-dropbox -s igloosync -T $(brew --prefix gocryptfs)/bin/gocryptfs -w
# Example: security add-generic-password -a sgreb -l igloosync-dropbox -s igloosync -T $(brew --prefix gocryptfs)/bin/gocryptfs -w
```

* `-a` - Specifies the account name
* `-l` - Specifies the label (if omitted, service name is used as default label)
* `-s` - Specifies the service name
* `-T` - Specifies the application which may have access to this item
* `-w` - Show an interactive prompt to pass the password to be added

See `security help add-generic-password` and security(1) for a detailed documentation of the available commands and options.

The password can then be received by running

```sh
security find-generic-password -l igloosync-dropbox -w
```

where the `-w` flag prints only the password to stdout.

### launchd service/agent and script

> For launchd tutorials, documentations and cookbooks see [launchd.info][launchd.info] and and manpages `launchd(1)` and `launchd.plist(5)`.

Create the service task as shell script and corresponding launchd service and place it in the folder for user agents:

```sh
mkdir -p ~/Library/LaunchAgents
cp <SERVICE>.plist ~/Library/LaunchAgents
```


[apple-doc-keychain]: https://support.apple.com/guide/keychain-access/welcome/mac
[brew-cask-dropbox]: https://github.com/Homebrew/homebrew-cask/blob/master/Casks/dropbox.rb
[brew-gocryptfs]: https://formulae.brew.sh/formula/gocryptfs
[gocryptfs]: https://github.com/rfjakob/gocryptfs
[launchd]: https://wiki.freebsd.org/launchd
[launchd.info]: http://www.launchd.info
