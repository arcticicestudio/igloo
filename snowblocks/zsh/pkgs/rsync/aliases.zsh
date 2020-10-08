# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>

# Project:    igloo
# Repository: https://github.com/arcticicestudio/igloo
# License:    MIT

# rsync based file system operations with detailed process and status information.
alias cpr='rsync --archive --executability -hh --partial --info=name2 --info=progress2 --info=stats1 --modify-window=1'
alias mvr='cpr --remove-source-files'
