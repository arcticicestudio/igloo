# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>

# Project:    igloo
# Repository: https://github.com/arcticicestudio/igloo
# License:    MIT

# Configurations for the ZSH line editor.
# See:  
#   1. http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html

# Remove the slash, period, angle brackets and dash characters from the default list.
# This allows to move backward and forward between words include these characters or when
# trying to only delete until the next character, e.g. for paths or dash-separated words.
export WORDCHARS='*?_[]~=&;!#$%^(){}'
