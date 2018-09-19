#!/bin/sh

# Copyright (C) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (C) 2016-present Sven Greb <development@svengreb.de>

# Project:    igloo
# Repository: https://github.com/arcticicestudio/igloo
# License:    MIT

case $1 in
  pre|suspend|hibernate) grep 'XHC1[[:space:]]\+S[1-5][[:space:]]\+\*disabled' /proc/acpi/wakeup || echo XHC1 > /proc/acpi/wakeup ;;
  *) exit $NA ;;
esac
exit 0
