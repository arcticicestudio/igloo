# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>

# Project:    igloo
# Repository: https://github.com/arcticicestudio/igloo
# License:    MIT

# Load the VTE shell profile configuration to enable inheritance of the current working directory
# when opening a new terminal tab or splitting the current one.
# The script is necessary since some Linux distributions like Arch Linux only execute scripts in
# `/etc/profile.d` for login shells while not for non-login based shells which results in the state
# that the current directory is nve reported by VTE. This means when splitting terminals in Tilix
# instead of inheriting the directory from the current terminal the split terminal always opens in
# the home path of the current user.
# See:
#   1. https://gnunn1.github.io/tilix-web/manual/vteconfig
[[ -n $TILIX_ID || -n $VTE_VERSION && -f /etc/profile.d/vte.sh ]] && source /etc/profile.d/vte.sh
