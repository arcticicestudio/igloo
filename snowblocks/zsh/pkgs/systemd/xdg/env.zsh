# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>

# Project:    igloo
# Repository: https://github.com/arcticicestudio/igloo
# License:    MIT

# XDG base directories specification.
# See:
#   1. https://wiki.archlinux.org/index.php/XDG_Base_Directory
#   2. https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html#variables
#   3. https://www.freedesktop.org/software/systemd/man/pam_systemd.html#Environment
export XDG_CACHE_HOME="${IGLOO_PATH_USER_CACHE:-${XDG_CACHE_HOME:-$HOME/.cache}}"
export XDG_CONFIG_HOME="${IGLOO_PATH_USER_CONFIG:-${XDG_CONFIG_HOME:-$HOME/.config}}"
export XDG_DATA_HOME="${IGLOO_PATH_USER_DATA:-${XDG_DATA_HOME:-$HOME/.local/share}}"
# See:
#   1. https://www.freedesktop.org/software/systemd/man/file-hierarchy.html#RuntimeData
#   2. https://www.freedesktop.org/software/systemd/man/file-hierarchy.html#Unprivileged%20Write%20Access
#   3. https://github.com/systemd/systemd/blob/f36a9d5909019845d131e0c6c61f22b1d1956ca1/src/login/pam_systemd.c#L673-L682
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$UID}"
# User directories.
export XDG_DESKTOP_DIR=$IGLOO_PATH_USER_DESKTOP
export XDG_DOCUMENTS_DIR=$IGLOO_PATH_USER_DOCUMENTS
export XDG_DOWNLOAD_DIR=$IGLOO_PATH_USER_DOWNLOADS
export XDG_MUSIC_DIR=$IGLOO_PATH_USER_MUSIC
export XDG_PICTURES_DIR=$IGLOO_PATH_USER_IMAGES
export XDG_TEMPLATES_DIR=$IGLOO_PATH_USER_TEMPLATES
export XDG_VIDEOS_DIR=$IGLOO_PATH_USER_VIDEOS
