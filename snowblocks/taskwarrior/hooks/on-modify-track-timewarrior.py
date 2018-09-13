#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Copyright (C) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (C) 2016-present Sven Greb <development@svengreb.de>

# Project:    igloo
# Repository: https://github.com/arcticicestudio/igloo
# License:    MIT
# References:
#   https://taskwarrior.org/docs
#   https://taskwarrior.org/docs/timewarrior
#   timew(1)
#   task(1)

"""A Taskwarrior hook to track the time of a active task with Taskwarrior.

This hook will extract all of the following for use as Timewarrior tags:

* UUID
* Project
* Tags
* Description
* UDAs

Note:
    This hook requires Python 3 and is only compatible with Taskwarrior version greater or equal to 2.4!

This hook is a fork from the `official on-modify.timewarrior hook`_.

.. _`official on-modify.timewarrior hook`:
   https://github.com/GothenburgBitFactory/timewarrior/blob/dev/ext/on-modify.timewarrior
"""

from sys import stdin
from os import system
from json import loads, dumps

# Make no changes to the task, simply observe.
old = loads(stdin.readline())
new = loads(stdin.readline())
print(dumps(new))

# Extract attributes for use as tags.
tags = [new["description"]]

if "project" in new:
    project = new["project"]
    tags.append(project)
    if "." in project:
        tags.extend([tag for tag in project.split(".")])

if "tags" in new:
    tags.extend(new["tags"])

combined = " ".join(["'%s'" % tag for tag in tags]).encode("utf-8").strip()

# Task has been started.
if "start" in new and not "start" in old:
    system("timew start " + combined.decode() + " :yes")

# Task has been stopped.
elif not "start" in new and "start" in old:
    system("timew stop " + combined.decode() + " :yes")

# Any task that is active, with a non-pending status should not be tracked.
elif "start" in new and new["status"] != "pending":
    system("timew stop " + combined.decode() + " :yes")
