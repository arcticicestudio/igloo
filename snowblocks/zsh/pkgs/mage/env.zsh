# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>

# Project:    igloo
# Repository: https://github.com/arcticicestudio/igloo
# License:    MIT

# Set the path of the directory for the magefile build cache.
# The default is `$HOME/.magefile`, but there is no need to persist the cache across system restarts.
# See:
#   1. https://magefile.org/environment
export MAGEFILE_CACHE=/tmp/.magefiles
