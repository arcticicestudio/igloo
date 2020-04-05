# Homebrew

> [Homebrew][] - The missing package manager for macOS

## Usage

### Install from an `Brewfile`

[Homebrew Bundle][homebrew-bundle] allows to bootstrap all formulas, casks and taps via an `Brewfile`.

```sh
brew bundle path/to/Brewfile
```

## Configurations

### Replace outdated login shell bundled with macOS

To use the latest [bash][brew-bash] formula as login shell instead of the outdated version bundled with macOS it must be added to the list of allowed shells and subsequently set as default login shell for the current user:

```sh
if ! fgrep -q "/usr/local/bin/bash" /etc/shells; then
  echo "/usr/local/bin/bash" | sudo tee -a /etc/shells
  chsh -s /usr/local/bin/bash
fi;
```

[brew-bash]: https://formulae.brew.sh/formula/bash
[homebrew]: https://brew.sh
[homebrew-bundle]: https://github.com/Homebrew/homebrew-bundle
