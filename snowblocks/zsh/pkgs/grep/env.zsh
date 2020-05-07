# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>

# Project:    igloo
# Repository: https://github.com/arcticicestudio/igloo
# License:    MIT

# Set the terminfo capability substrings for the color environment variable interpreted by the
# "termcap" compatibility application interface.
#
# fn - File names prefixing any content line.
# ln - Line numbers prefixing any content line.
# mt - Matching non-empty text in any matching line.
# se - Separators that are inserted between selected line fields (`:`), context line fields (`-`) and
#      groups of adjacent lines when nonzero context is specified (`--`)
# See:
#   1. http://www.gnu.org/software/grep/manual/grep.html
#   2. terminfo(5)
export GREP_COLORS="fn=34:ln=01;30:mt=01;34:se=30"
