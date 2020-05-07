# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>

# Project:    igloo
# Repository: https://github.com/arcticicestudio/igloo
# License:    MIT

# Configurations for fzf via environment variables.
# See:
#   1. https://github.com/junegunn/fzf
#   2. https://github.com/junegunn/fzf.vim
#   3. https://github.com/sharkdp/fd#using-fd-with-fzf
autoload -Uz igloo-use_nord_colors && igloo-use_nord_colors

FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS
# Use fzf in fullscreen mode with command line at the bottom, allow to cycle through results when moving out
# of range at the bottom or start and always use 2 spaces for tab stops.
FZF_DEFAULT_OPTS+="
  --no-height
  --no-reverse
  --cycle
  --tabstop=2"
# Set the path to the search history file and use the same maximum number of entires like for the ZSH
# command history. 
FZF_DEFAULT_OPTS+="
  --history=$IGLOO_PATH_USER_CACHE/fzf/history
  --history-size=1000000000"
# Adjust the colors to match the "Nord" theme.
# See:
#   1. https://www.nordtheme.com
FZF_DEFAULT_OPTS+="
  --color bg:$IGLOO_ZSH_NORD_COLORS[0],bg+:$IGLOO_ZSH_NORD_COLORS[3],fg:$IGLOO_ZSH_NORD_COLORS[5]
  --color fg+:$IGLOO_ZSH_NORD_COLORS[6],hl:$IGLOO_ZSH_NORD_COLORS[8],hl+:$IGLOO_ZSH_NORD_COLORS[9]
  --color preview-bg:$IGLOO_ZSH_NORD_COLORS[0],preview-fg:$IGLOO_ZSH_NORD_COLORS[5]
  --color border:$IGLOO_ZSH_NORD_COLORS[3],gutter:$IGLOO_ZSH_NORD_COLORS[1],header:$IGLOO_ZSH_NORD_COLORS[8]
  --color info:$IGLOO_ZSH_NORD_COLORS[8],marker:$IGLOO_ZSH_NORD_COLORS[8],pointer:$IGLOO_ZSH_NORD_COLORS[9]
  --color prompt:$IGLOO_ZSH_NORD_COLORS[8],spinner:$IGLOO_ZSH_NORD_COLORS[8]"
export FZF_DEFAULT_OPTS

if type fd > /dev/null; then
  # Use fd as the default source for fzf.
  # Always follow symbolic links and include hidden files, but exclude VCS data like the .git folder.
  export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
  # Apply the default command to the ^T key binding.
  export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
fi
