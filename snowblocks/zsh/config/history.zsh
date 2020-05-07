# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>

# Project:    igloo
# Repository: https://github.com/arcticicestudio/igloo
# License:    MIT

# ZSH history configurations.
# See:
#   1. http://zsh.sourceforge.net/Doc/Release/Zsh-Modules.html#index-history-2

# The path to the history file.
# See:
#   1. http://zsh.sourceforge.net/Doc/Release/Parameters.html#index-HISTFILE
export HISTFILE=$IGLOO_ZSH_PATH_CACHE/history

# The maximum number of stored events.
# See:
#   1. http://zsh.sourceforge.net/Doc/Release/Parameters.html#index-HISTSIZE
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
