# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>

# Project:    igloo
# Repository: https://github.com/arcticicestudio/igloo
# License:    MIT

# Pass options by default to...
# - only display ANSI "color" escape sequences in "raw" form (`-R`, `--RAW-CONTROL-CHARS`)
# - automatically exit if the entire file can be displayed on the first screen (`-F`, `--quit-if-one-screen`)
# - disable sending the termcap (de)initialization strings to the terminal to avoid unnecessary operations like
#   clearing the screen (`-X`, `--no-init`)
# - use two tab stops (`-x2`, `--tabs=n`)
export LESS="-RFXx2"

export LESSCHARSET=utf-8

# Set the terminfo variables of the "termcap" compatibility application interface.
# Provides colored output for the `man` command.
#
# Escape Sequences Comparison Table
# ==================================
# termcap  terminfo  function
# -------  --------  --------
# ks       smkx      Send commands via keypad
# ke       rmkx      Send digits via keypad
# vb       flash     Emit visual bell
# mb       blink     Start blink
# md       bold      Start bold
# me       sgr0      Turn off bold, blink and underline
# so       smso      Start standout (reverse video)
# se       rmso      Stop standout
# us       smul      Start underline
# ue       rmul      Stop underline
#
# See:
#   1. https://www.gnu.org/software/less
#   2. terminfo(5)
# +--- Blink ---+
export LESS_TERMCAP_mb=$'\e[01;34m'
# +--- Keywords ---+
export LESS_TERMCAP_md=$'\e[01;34m'
# +--- Mode Stop ---+
export LESS_TERMCAP_me=$'\e[0m'
# +--- Standout-Mode (Info Box) ---+
export LESS_TERMCAP_so=$'\e[01;30m'
export LESS_TERMCAP_se=$'\e[0m'
# +--- Constants ---+
export LESS_TERMCAP_us=$'\e[01;34m'
export LESS_TERMCAP_ue=$'\e[0m'
