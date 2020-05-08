# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>

# Project:    igloo
# Repository: https://github.com/arcticicestudio/igloo
# License:    MIT

# Populate the database with color output configurations for file types and extensions.
# See.
#   1. https://www.gnu.org/software/coreutils/manual/html_node/dircolors-invocation.html
#   2. dircolors(1)
#   3. dir_colors(5)
if type dircolors > /dev/null && [[ -f $IGLOO_PATH_USER_CONFIG/dircolors/dir_colors ]]; then
  eval $(dircolors $IGLOO_PATH_USER_CONFIG/dircolors/dir_colors)
fi
