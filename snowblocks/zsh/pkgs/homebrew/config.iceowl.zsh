# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>

# Project:    igloo
# Repository: https://github.com/arcticicestudio/igloo
# License:    MIT

# Extend the search paths with formula and cask specific paths.
# The paths are "hardcoded" (e.g. `/usr/local/opt`) because `$(brew --prefix <package>) increases the
# start up time to more than 10 seconds!
# It seems like for each execution of the Ruby code a new instance is spawned that also spawns more shell processes.
# This might be caused by some macOS changes of essential logics from "El Capitan" to "High Sierra".
# Using the Homebrew command in subshell calls works fine on "El Capitan" and older versions.
infopath=(/usr/local/share/info $infopath)
manpath=(/usr/local/share/man /usr/local/opt/coreutils/libexec/gnuman $manpath)
path=(
  /usr/local/opt/coreutils/libexec/gnubin
  /usr/local/opt/e2fsprogs/bin
  /usr/local/opt/e2fsprogs/sbin
  /usr/local/opt/icu4c/bin
  /usr/local/opt/icu4c/sbin
  /usr/local/opt/openvpn/sbin
  /usr/local/opt/python/libexec/bin
  /usr/local/opt/sqlite/bin
  /usr/local/opt/git/share/git-core/contrib/diff-highlight
  $HOME/.bin
  $HOME/.bin/vendor
  $path
)
