# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>

# Project:    igloo
# Repository: https://github.com/arcticicestudio/igloo
# License:    MIT

# "Nord" color theme for the available highlighters of the zsh-users/zsh-syntax-highlighting plugin.
# See:
#   1. https://www.nordtheme.com
#   2. https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
#   3. https://github.com/zsh-users/zsh-syntax-highlighting/tree/master/docs/highlighters
autoload -Uz igloo-use_nord_colors && igloo-use_nord_colors

# Configurations for the `brackets` highlighter that highlights brackets and parentheses, and matches them.
# See:
#   1. https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/brackets.md
ZSH_HIGHLIGHT_STYLES[bracket-error]="fg=$IGLOO_ZSH_NORD_COLORS[11],bold"
ZSH_HIGHLIGHT_STYLES[bracket-level-1]="fg=$IGLOO_ZSH_NORD_COLORS[6]"
ZSH_HIGHLIGHT_STYLES[bracket-level-2]="fg=$IGLOO_ZSH_NORD_COLORS[6]"
ZSH_HIGHLIGHT_STYLES[bracket-level-3]="fg=$IGLOO_ZSH_NORD_COLORS[6]"
ZSH_HIGHLIGHT_STYLES[bracket-level-4]="fg=$IGLOO_ZSH_NORD_COLORS[6]"
ZSH_HIGHLIGHT_STYLES[bracket-level-5]="fg=$IGLOO_ZSH_NORD_COLORS[6]"
ZSH_HIGHLIGHT_STYLES[bracket-level-6]="fg=$IGLOO_ZSH_NORD_COLORS[6]"
ZSH_HIGHLIGHT_STYLES[bracket-level-7]="fg=$IGLOO_ZSH_NORD_COLORS[6]"
ZSH_HIGHLIGHT_STYLES[bracket-level-8]="fg=$IGLOO_ZSH_NORD_COLORS[6]"
ZSH_HIGHLIGHT_STYLES[bracket-level-9]="fg=$IGLOO_ZSH_NORD_COLORS[6]"
ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]="bg=$IGLOO_ZSH_NORD_COLORS[3],fg=$IGLOO_ZSH_NORD_COLORS[8]"

# Configurations for the `cursor` highlighter that highlights the cursor.
# See:
#   1. https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/cursor.md
ZSH_HIGHLIGHT_STYLES[cursor]="none"

# Configurations for the `main` highlighter (actived by default) that highlights
# - Commands
# - Options
# - Arguments
# - Paths
# - Strings
#
# See:
#   1. https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md
ZSH_HIGHLIGHT_STYLES[alias]="fg=$IGLOO_ZSH_NORD_COLORS[8]"
ZSH_HIGHLIGHT_STYLES[arg0]="fg=$IGLOO_ZSH_NORD_COLORS[8]"
ZSH_HIGHLIGHT_STYLES[assign]="none"
ZSH_HIGHLIGHT_STYLES[autodirectory]="fg=$IGLOO_ZSH_NORD_COLORS[9],bold"
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]="fg=$IGLOO_ZSH_NORD_COLORS[13]"
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]="fg=$IGLOO_ZSH_NORD_COLORS[13]"
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]="fg=$IGLOO_ZSH_NORD_COLORS[10],bold"
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]="none"
ZSH_HIGHLIGHT_STYLES[builtin]="fg=$IGLOO_ZSH_NORD_COLORS[7]"
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]="fg=$IGLOO_ZSH_NORD_COLORS[10],bold"
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]="fg=$IGLOO_ZSH_NORD_COLORS[10]"
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]="fg=$IGLOO_ZSH_NORD_COLORS[10]"
ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]="none"
ZSH_HIGHLIGHT_STYLES[command-substitution]="none"
ZSH_HIGHLIGHT_STYLES[command]="fg=$IGLOO_ZSH_NORD_COLORS[8]"
ZSH_HIGHLIGHT_STYLES[commandseparator]="fg=$IGLOO_ZSH_NORD_COLORS[9]"
ZSH_HIGHLIGHT_STYLES[comment]="fg=$IGLOO_ZSH_NORD_COLORS[comment]"
ZSH_HIGHLIGHT_STYLES[default]="none"
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]="fg=$IGLOO_ZSH_NORD_COLORS[4],bold"
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]="fg=$IGLOO_ZSH_NORD_COLORS[14]"
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]="none"
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]="fg=$IGLOO_ZSH_NORD_COLORS[14]"
ZSH_HIGHLIGHT_STYLES[function]="fg=$IGLOO_ZSH_NORD_COLORS[8]"
ZSH_HIGHLIGHT_STYLES[global-alias]="fg=$IGLOO_ZSH_NORD_COLORS[8],bold,underline"
ZSH_HIGHLIGHT_STYLES[globbing]="fg=$IGLOO_ZSH_NORD_COLORS[9]"
ZSH_HIGHLIGHT_STYLES[hashed-command]="fg=$IGLOO_ZSH_NORD_COLORS[8]"
ZSH_HIGHLIGHT_STYLES[history-expansion]="fg=$IGLOO_ZSH_NORD_COLORS[9],underline"
ZSH_HIGHLIGHT_STYLES[named-fd]="none"
ZSH_HIGHLIGHT_STYLES[numeric-fd]="fg=$IGLOO_ZSH_NORD_COLORS[15]"
ZSH_HIGHLIGHT_STYLES[path_prefix]="none"
ZSH_HIGHLIGHT_STYLES[path]="none"
ZSH_HIGHLIGHT_STYLES[precommand]="fg=$IGLOO_ZSH_NORD_COLORS[7]"
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]="fg=$IGLOO_ZSH_NORD_COLORS[10],bold"
ZSH_HIGHLIGHT_STYLES[process-substitution]="none"
ZSH_HIGHLIGHT_STYLES[rc-quote]="fg=$IGLOO_ZSH_NORD_COLORS[13]"
ZSH_HIGHLIGHT_STYLES[redirection]="fg=$IGLOO_ZSH_NORD_COLORS[9]"
ZSH_HIGHLIGHT_STYLES[reserved-word]="fg=$IGLOO_ZSH_NORD_COLORS[9]"
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]="none"
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]="fg=$IGLOO_ZSH_NORD_COLORS[14]"
ZSH_HIGHLIGHT_STYLES[suffix-alias]="fg=$IGLOO_ZSH_NORD_COLORS[8],underline"
ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=$IGLOO_ZSH_NORD_COLORS[11],bold"

# Configurations for the `pattern` highlighter that highlights user-defined patterns.
# See:
#   1. https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/pattern.md
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf \*' "bg=$IGLOO_ZSH_NORD_COLORS[11],fg=$IGLOO_ZSH_NORD_COLORS[6],bold")
