# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>

# Project:    igloo
# Repository: https://github.com/arcticicestudio/igloo
# License:    MIT

# Configure ZSH feature options.
# See:
#   1. http://zsh.sourceforge.net/Doc/Release/Options.html

# +--- Changing Directories ---+
# See:
#   1. http://zsh.sourceforge.net/Doc/Release/Options.html#Changing-Directories

# If a command is issued that can't be executed as a normal command, and the command is the name of a directory,
# perform the `cd` command to that directory.
setopt AUTO_CD

# Disable beep on an ambiguous completion.
setopt NO_LIST_BEEP

# +--- Expansion and Globbing ---+
# See:
#   1. http://zsh.sourceforge.net/Doc/Release/Options.html#Expansion-and-Globbing

# Treat the `#`, `~` and `^` characters as part of patterns for filename generation.
# Note that an initial unquoted `~` always produces named directory expansion.
setopt EXTENDED_GLOB

# Disable printing of errors if a pattern for filename generation has no matches.
setopt NO_NOMATCH

# Entirely disable error logging if a pattern for filename generation has no matches.
# Pattern that don't match are removed from the argument list instead.
# If no file matches a blank line is printed, with no error.
# Overrides the `NOMATCH` option.
setopt NULL_GLOB

# +--- History ---+
# See:
#   1. http://zsh.sourceforge.net/Doc/Release/Options.html#History

# Each ZSH session appends it's history list to the history file, rather than replacing it.
setopt APPEND_HISTORY

# Save each command's beginning Unix timestamp and the duration in seconds.
setopt EXTENDED_HISTORY

# Remove the oldest history event that has a duplicate first before unique events when reaching the size limit.
setopt HIST_EXPIRE_DUPS_FIRST

# Hide duplicates of previous events when searching for history entries in the line editor.
setopt HIST_FIND_NO_DUPS

# Don't store events if they are duplicates of the previous event.
setopt HIST_IGNORE_DUPS

# Don't store events when the first character on the line is a space or when one of the expanded aliases contains
# a leading space.
# Note that the command is still kept in the internal history until the next command before it vanishes,
# allowing to briefly reuse or edit the line.
setopt HIST_IGNORE_SPACE

# Don't store function definitions.
# Note that the command is still kept in the internal history until the next command before it vanishes,
# allowing to briefly reuse or edit the line.
setopt HIST_NO_FUNCTIONS

# Remove superfluous blanks from events being added to the history list.
# This can also prevent duplicate entries when a previous event would not match in its untidied form.
# Note that the shell is smart enough not to remove blanks which are important, i.e. when quoted.
setopt HIST_REDUCE_BLANKS

# Don't store duplicate event at all, older commands that duplicate newer ones are omitted.
setopt HIST_SAVE_NO_DUPS

# New history lines are added to `HISTFILE` incrementally as soon as they are entered,
# rather than waiting until the shell exits.
setopt INC_APPEND_HISTORY

# Disable beep in ZLE when a widget attempts to access a non-existing history entry.
setopt NO_HIST_BEEP

# +--- Input/Output ---+
# See:
#   1. http://zsh.sourceforge.net/Doc/Release/Options.html#Input_002fOutput

# Allow comments even in interactive shells. 
setopt INTERACTIVE_COMMENTS

# +--- Job Control ---+
# See:
#   1. http://zsh.sourceforge.net/Doc/Release/Options.html#Job-Control

# Run all background jobs with the same priority as foreground tasks.
setopt NO_BG_NICE

# Disable immediately status reporting of background jobs to prevent messing up and reprinting the current line.
setopt NO_NOTIFY

# +--- Prompting ---+
# See:
#   1. http://zsh.sourceforge.net/Doc/Release/Options.html#Prompting

# Interpret percent escape sequences in prompt expansion.
# See:
#   1. http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Prompt-Expansion
setopt PROMPT_PERCENT

# Enable parameter expansion, command substitution and arithmetic expansion in prompts.
# Note that substitutions within prompts do not affect the command status. 
setopt PROMPT_SUBST

# +--- Shell Emulation ---+
# See:
#   1. http://zsh.sourceforge.net/Doc/Release/Options.html#Shell-Emulation

# Split on unquoted parameter expansions.
setopt SH_WORD_SPLIT

# +--- Zle ---+
# See:
#   1. http://zsh.sourceforge.net/Doc/Release/Options.html#Zle

# Disable beep on error in ZLE.
setopt NO_BEEP
