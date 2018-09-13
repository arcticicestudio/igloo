#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Copyright (C) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (C) 2016-present Sven Greb <development@svengreb.de>

# Project:    igloo
# Repository: https://github.com/arcticicestudio/igloo
# License:    MIT
# References:
#   https://taskwarrior.org/docs
#   task(1)

"""A Taskwarrior hook to track the total active time of a task.

The tracked time is stored in a UDA task duration attribute named ``totalactivetime`` of type ``duration`` holding the total number of seconds the task was
active. The tracked time can then be included in any report by adding the ``totalactivetime`` column.

By default, this plugin allows to have one task active at a time. This can be changed by setting ``max_active_tasks`` in ``.taskrc`` to a value greater than
``1``.

Note:
    This hook requires Python 3 and the `taskw`_ package to be installed which provides the python bindings for Taskwarrior!
    Also note that this hook is only compatible with Taskwarrior version greater or equal to 2.4!

This hook is a fork from `kostajh/taskwarrior-time-tracking-hook`_

.. _taskw:
   https://pypi.python.org/pypi/taskw
.. _kostajh/taskwarrior-time-tracking-hook:
   https://github.com/kostajh/taskwarrior-time-tracking-hook
"""

import datetime
import json
import re
import sys
import subprocess
from taskw import TaskWarrior
from typing import TypeVar

TIME_FORMAT = "%Y%m%dT%H%M%SZ"
UDA_KEY = "totalactivetime"

w = TaskWarrior()
config = w.load_config()
if "max_active_tasks" in config:
    MAX_ACTIVE = int(config["max_active_tasks"])
else:
    MAX_ACTIVE = 1

"""Compiled regular expression for the duration as ISO-8601 formatted string."""
ISO8601DURATION = re.compile("P((\d*)Y)?((\d*)M)?((\d*)D)?T((\d*)H)?((\d*)M)?((\d*)S)?")

"""The duration type either as integer (in seconds), as ISO-8601 formatted string ("PT1H10M31S") or the seconds suffixed with "seconds"."""
DurationType = TypeVar("DurationType", str, int)


def duration_str_to_time_delta(duration_str: DurationType) -> datetime.timedelta:
    """Converts duration string into a timedelta object.

    :param duration_str: The duration
    :return: The duration as timedelta object
    """
    if duration_str.startswith("P"):
        match = ISO8601DURATION.match(duration_str)
        if match:
            year = match.group(2)
            month = match.group(4)
            day = match.group(6)
            hour = match.group(8)
            minute = match.group(10)
            second = match.group(12)
            value = 0
            if second:
                value += int(second)
            if minute:
                value += int(minute) * 60
            if hour:
                value += int(hour) * 3600
            if day:
                value += int(day) * 3600 * 24
            if month:
                # Assume a month is 30 days for now.
                value += int(month) * 3600 * 24 * 30
            if year:
                # Assume a year is 365 days for now.
                value += int(year) * 3600 * 24 * 365
        else:
            value = int(duration_str)
    elif duration_str.endswith("seconds"):
        value = int(duration_str.rstrip("seconds"))
    else:
        value = int(duration_str)
    return datetime.timedelta(seconds=value)


def main():
    original = json.loads(sys.stdin.readline())
    modified = json.loads(sys.stdin.readline())

    # An active task has just been started.
    if "start" in modified and "start" not in original:
        # Prevent this task from starting if "task +ACTIVE count" is greater than "MAX_ACTIVE".
        p = subprocess.Popen(["task", "+ACTIVE", "status:pending", "count", "rc.verbose:off"], stdout=subprocess.PIPE)
        out, err = p.communicate()
        count = int(out.rstrip())
        if count >= MAX_ACTIVE:
            print("Only %d task(s) can be active at a time. "
                  "See 'max_active_tasks' in .taskrc." % MAX_ACTIVE)
            sys.exit(1)

    # An active task has just been stopped.
    if "start" in original and "start" not in modified:
        # Calculate the elapsed time.
        start = datetime.datetime.strptime(original["start"], TIME_FORMAT)
        end = datetime.datetime.utcnow()

        if UDA_KEY not in modified:
            modified[UDA_KEY] = 0

        this_duration = (end - start)
        total_duration = (this_duration + duration_str_to_time_delta(str(modified[UDA_KEY])))
        print("Total Time Tracked: %s (%s in this instance)" % (total_duration, this_duration))
        modified[UDA_KEY] = str(int(total_duration.days * (60 * 60 * 24) + total_duration.seconds)) + "seconds"

    return json.dumps(modified, separators=(",", ":"))


def cmdline():
    sys.stdout.write(main())


if __name__ == "__main__":
    cmdline()
