#!/usr/bin/env bash

# Copyright (C) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (C) 2016-present Sven Greb <development@svengreb.de>

# Project:    igloo
# Repository: https://github.com/arcticicestudio/igloo
# License:    MIT
# References:
#   https://taskwarrior.org/docs
#   https://taskwarrior.org/docs/terminology.html#regex
#   taskrc(5)
#   task(1)
#   https://en.wikibooks.org/wiki/Regular_Expressions/POSIX-Extended_Regular_Expressions

set -e

cleanup() {
  unset -f log_error validate_parameter get_task_uuid open_notes
}

log_error() {
  printf "\e[31m%s\e[0m\n" "✖ $*" 1>&2
}

validate_parameter() {
  if [ $# -eq 0 ]; then
    log_error "No task IDs specified!"
    exit 1
  fi

  local VALID_NUMBER_REGEX="^[0-9]+$"
  if ! [[ $1 =~ $VALID_NUMBER_REGEX ]]; then
    log_error "Invalid parameter '$1': parameters must be of type number!"
    exit 1
  fi
}

get_task_uuid() {
  local task_id=$1
  local uuid="$(task _get $task_id.uuid)"
  if [ -z $uuid ]; then
    log_error "No task found with for specified ID '$task_id'!"
    exit 1
  fi
  printf "$uuid"
}

open_notes() {
  declare -a local task_uuids
  local task_uuid
  local note_path="~/.task/notes"
  local editor_cmd="code --add"
  local note_file_ext="md"

  for task_id in $@; do
    validate_parameter $task_id
    task_uuid="$(get_task_uuid $task_id)"
    if ! [ -z $task_uuid ]; then
      $editor_cmd "$note_path/$task_uuid.$note_file_ext"
    fi
  done
}

trap 'printf "User aborted.\n" && exit 1' SIGINT SIGTERM
trap cleanup EXIT

open_notes $@
exit 0
