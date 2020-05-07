# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>

# Project:    igloo
# Repository: https://github.com/arcticicestudio/igloo
# License:    MIT

# Load the ZSH completion system using a custom path for the compiled cache file.
# See:
#   1. http://zsh.sourceforge.net/Doc/Release/Completion-System.html#Use-of-compinit
autoload -Uz compinit
compinit -d $IGLOO_ZSH_PATH_CACHE/.zcompdump-$HOSTNAME-${ZSH_PATCHLEVEL:-$ZSH_VERSION}
