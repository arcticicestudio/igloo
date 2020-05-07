# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>

# Project:    igloo
# Repository: https://github.com/arcticicestudio/igloo
# License:    MIT

# ZSH plugins managed by zplug.
# See:
#   1. https://github.com/zplug/zplug
[[ -f $ZDOTDIR/lib/plugins-base.zsh ]] && source $ZDOTDIR/lib/plugins-base.zsh

zplug "usr/share/fzf", \
  from:local, \
  if:"type fzf > /dev/null && [[ -d usr/share/fzf ]]", \
  use:"{completion,key-bindings}.zsh"

# Load all plugins and add commands to the executable search path.
zplug load
