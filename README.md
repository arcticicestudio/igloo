<p align="center"><img src="https://cdn.rawgit.com/arcticicestudio/igloo/develop/assets/igloo-logo-banner.svg"/></p>

<p align="center"><img src="https://assets-cdn.github.com/favicon.ico" width=24 height=24/> <a href="https://github.com/arcticicestudio/igloo/releases/latest"><img src="https://img.shields.io/github/release/arcticicestudio/igloo.svg?style=flat-square"/></a> <a href="https://github.com/arcticicestudio/snowsaw/releases/tag/v0.1.1"><img src="https://img.shields.io/badge/snowsaw-v0.1.1-88C0D0.svg?style=flat-square"/></a> <a href="https://www.archlinux.org"><img src="https://img.shields.io/badge/OS-Arch_Linux-1793D1.svg?style=flat-square"/></a></p>

<p align="center">The snowy dotfile home.</p>

<p align="center">Powered by<br><img src="https://cdn.rawgit.com/arcticicestudio/snowsaw/develop/assets/snowsaw-logo-banner.svg"/></p>

---

Igloo is the snowy [dotfile](http://dotfiles.github.io) home of [Arctic Ice Studio](https://github.com/arcticicestudio) powered by [snowsaw][snowsaw], the lightweight, plugin-driven and simple configurable dotfile bootstrapper.

## Getting started
### Installation
Clone the repository and run the `bootstrap` script:
```sh
git clone --recursive https://github.com/arcticicestudio/igloo
cd igloo
./bootstrap
```

## Design Concept
### <img src="https://cdn.rawgit.com/arcticicestudio/snowsaw/develop/assets/icon-snowblocks.svg"/> snowblocks
The design concept is based on topical areas, so-called `snowblocks` which are a named directory that live in the base snowblocks directory and defaults to `<DOTFILE_REPOSITORY_ROOT>/snowblocks`.  
Snowblocks are configured via `snowblock.json` files that that will be processed when the base snowblock directory gets scanned recursively, but it is also possible to only process a single `snowblock`.

This design allows a modular structured dotfile repository where each topic can be represented as a `snowblock` instead of placing all files and folders without any logical division in the repository root.

## Development
[![](https://img.shields.io/badge/Changelog-0.2.0-blue.svg)](https://github.com/arcticicestudio/nord-vim/blob/v0.2.0/CHANGELOG.md) [![](https://img.shields.io/badge/Workflow-gitflow--branching--model-blue.svg)](http://nvie.com/posts/a-successful-git-branching-model) [![](https://img.shields.io/badge/Versioning-ArcVer_0.8.0-blue.svg)](https://github.com/arcticicestudio/arcver)

### Contribution
Please report issues/bugs, feature requests and suggestions for improvements to the [issue tracker](https://github.com/arcticicestudio/nord-vim/issues).

<p align="center"><img src="https://cdn.rawgit.com/arcticicestudio/nord/develop/src/assets/banner-footer-mountains.svg" /></p>

<p align="center"> <img src="http://arcticicestudio.com/favicon.ico" width=16 height=16/> Copyright &copy; 2017 Arctic Ice Studio</p>

<p align="center"><a href="http://www.apache.org/licenses/LICENSE-2.0"><img src="https://img.shields.io/badge/License-Apache_2.0-blue.svg"/></a></p>

[snowsaw]: https://github.com/arcticicestudio/snowsaw
