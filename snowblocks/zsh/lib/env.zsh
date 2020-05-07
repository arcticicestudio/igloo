# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>

# Project:    igloo
# Repository: https://github.com/arcticicestudio/igloo
# License:    MIT

# Custom variables for XDG base directories to support OS that don't adhere to the specifications like macOS.
export IGLOO_PATH_USER_CACHE="${IGLOO_PATH_USER_CACHE:-$HOME/.cache}"
export IGLOO_PATH_USER_CONFIG="${IGLOO_PATH_USER_CONFIG:-$HOME/.config}"
export IGLOO_PATH_USER_DATA="${IGLOO_PATH_USER_DATA:-$HOME/.local/share}"
export IGLOO_PATH_USER_BIN=$HOME/.local/bin
export IGLOO_PATH_USER_INFO="${IGLOO_PATH_USER_INFO:-$IGLOO_PATH_USER_DATA/info}"
export IGLOO_PATH_USER_MAN="${IGLOO_PATH_USER_MAN:-$IGLOO_PATH_USER_DATA/man}"

# Custom variables for XDG user directories to support OS that don't adhere to the specifications like macOS.
export IGLOO_PATH_USER_DESKTOP="${IGLOO_PATH_USER_DESKTOP:-${XDG_DESKTOP_DIR:-HOME/desktop}}"
export IGLOO_PATH_USER_DOCUMENTS="${IGLOO_PATH_USER_DOCUMENTS:-${XDG_DOCUMENTS_DIR:-HOME/documents}}"
export IGLOO_PATH_USER_DOWNLOADS="${IGLOO_PATH_USER_DOWNLOADS:-${XDG_DOWNLOAD_DIR:-HOME/downloads}}"
export IGLOO_PATH_USER_MUSIC="${IGLOO_PATH_USER_MUSIC:-${XDG_MUSIC_DIR:-HOME/music}}"
export IGLOO_PATH_USER_IMAGES="${IGLOO_PATH_USER_IMAGES:-${XDG_PICTURES_DIR:-HOME/images}}"
export IGLOO_PATH_USER_TEMPLATES="${IGLOO_PATH_USER_TEMPLATES:-${XDG_TEMPLATES_DIR:-HOME/code/snippetbox/gists}}"
export IGLOO_PATH_USER_VIDEOS="${IGLOO_PATH_USER_VIDEOS:-${XDG_VIDEOS_DIR:-HOME/videos}}"

# The custom path for the ZSH cache directory.
export IGLOO_ZSH_PATH_CACHE=$IGLOO_PATH_USER_CACHE/zsh

# The name of the ZSH prompt theme.
export IGLOO_ZSH_PROMPT_THEME_NAME="${IGLOO_ZSH_PROMPT_THEME_NAME:-igloo}"

# Allows to disable support for 24-bit colors ("true color").
# This variable is read for different configurations in order to disable the usage of HEX triplets
# when specifying colors for prompts and line editor highlighting.
export IGLOO_ZSH_NO_TRUE_COLOR="${IGLOO_ZSH_NO_TRUE_COLOR:-false}"

# Set basic configurations for Unix core applications and commands.
export LANG=${LANG:-en_US.UTF-8}
export LC_MESSAGES=${LC_MESSAGES:-POSIX}
if type vim > /dev/null; then
  export EDITOR="vim"
  export MANPAGER="vim -R +MANPAGER -"
  export VISUAL="vim"
fi
