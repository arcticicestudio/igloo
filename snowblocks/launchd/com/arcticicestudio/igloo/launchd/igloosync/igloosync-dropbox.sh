#!/usr/bin/env bash

# Copyright (C) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (C) 2016-present Sven Greb <development@svengreb.de>

# Project:    igloo
# Repository: https://github.com/arcticicestudio/igloo
# License:    MIT
# References:
#   https://github.com/rfjakob/gocryptfs
#   security(1)

set -eo pipefail

cleanup() {
  unset -f mount
}

mount() {
  local brew="/usr/local/bin/brew"
  local gocryptfs="$($brew --prefix gocryptfs)/bin/gocryptfs"
  local container="$HOME/cloud/.dropbox/Dropbox/sync"
  local mountpoint="$HOME/cloud/dropbox"
  local extpass_command="security find-generic-password -l igloosync-dropbox -w"

   if [ ! -f $brew ]; then
    echo "Homebrew is not installed or available in PATH!"
    exit 1
  fi

  if [ -f $gocryptfs ]; then
    $($gocryptfs -allow_other -q -extpass="$extpass_command" "$container" "$mountpoint")
  else
    echo "gocryptfs is not installed or available in PATH!"
    exit 1
  fi
}

trap 'printf "User aborted.\n" && exit 1' SIGINT SIGTERM
trap cleanup EXIT

mount $@
exit 0
