# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>

# Project:    igloo
# Repository: https://github.com/arcticicestudio/igloo
# License:    MIT

alias date='command date "$TIME_STYLE"'

# Add "safety net" for basic but irreversible file system operations by using
# verbose and interactive command modes. 
alias cp='command cp -vi'
alias mv='command mv -vi'
alias rm='command rm -vi'

# Enable colorized long listing with human-readable size- and ISO-8601 date formats.
# The time style is inherited from the TIME_STYLE environment variable.
alias ll='command ls -Alh --color=auto --group-directories-first'
alias ls='command ls -AGgh --color=auto --group-directories-first --time-style="+"'

# Print permission bits in octal (%a) and file type in human readable form (%A) 
# and quote file name with dereference for symbolic links (%N).
alias lsp='command stat -c "%A %a %N"'
