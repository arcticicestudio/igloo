# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>

# Project:    igloo
# Repository: https://github.com/arcticicestudio/igloo
# License:    MIT

# The zshzle(1) (ZSH line editor) key bindings (widgets).
# Simply run `bindkey` without any parameter and options to get a list of currently active widgets.
# See:
#   1. http://zsh.sourceforge.net/Guide/zshguide04.html
#   2. http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Zle-Builtins
#   3. http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Standard-Widgets
#   4. https://wiki.archlinux.org/index.php/zsh#Key_bindings
#   5. https://sgeb.io/posts/2014/04/zsh-zle-custom-widgets/

# Use the default Emacs mode/keymap.
# This also links the `emacs` keymap to `main` so that it is selected by default next time the editor starts.
# See:
#   1. http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#index-bindkey
bindkey -e

# Make sure the terminal is in application mode when the ZSH line editor zle is active.
# otherwise values from `$terminfo` are not valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
  autoload -Uz add-zle-hook-widget
  function zle_application_mode_start { echoti smkx }
  function zle_application_mode_stop { echoti rmkx }
  add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
  add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# Create and populate a zkbd compatible hash with terminfo(5) mappings.
# xterm-compatible terminals can use extended key-definitions from user_caps(5).
# Those are combinations of [⇧ Shift], [⎇ Alt], [Ctrl] and [Meta] together with
# [↑ Up], [↓ Down], [← Left], [→ Right], [Page Up], [Page Down], [⇱ Home],
# [⇲ End] or [Del].
# See:
#   1. [← Left]/[→ Right]/[↑ Up]/[↓ Down] U+2190/U+2192/U+2191/U+2193 (https://en.wikipedia.org/wiki/Arrow_keys)
#   2. [↵ Enter] U+21B5 (https://en.wikipedia.org/wiki/Enter_key)
#   3. [↹ Tab] U+21B9 (https://en.wikipedia.org/wiki/Tab_key)
#   4. [⇧ Shift] U+21E7 (https://en.wikipedia.org/wiki/Shift_key)
#   5. [⇱ Home] U+21F1 (https://en.wikipedia.org/wiki/Home_key)
#   6. [⇲ End] U+21F2 (https://en.wikipedia.org/wiki/End_key)
#   7. [⌘ Command] U+2318 (https://en.wikipedia.org/wiki/Command_key)
#   8. [⌥ Option] U+2325 (https://en.wikipedia.org/wiki/Option_key)
#   9. [⌫ Backspace] U+232B (https://en.wikipedia.org/wiki/Backspace)
#   10. [⎇ Alt] U+2387 (https://en.wikipedia.org/wiki/Alt_key)
#   11. [^ Ctrl]/[Control] (https://en.wikipedia.org/wiki/Control_key)
#   12. [Del] (https://en.wikipedia.org/wiki/Delete_key)
#   13. [Meta] (https://en.wikipedia.org/wiki/Meta_key)
#   14. [Page Up]/[Page Down] (https://en.wikipedia.org/wiki/Page_Up_and_Page_Down_keys)
typeset -g -A key
key[Backspace]="${terminfo[kbs]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[Shift-Tab]="${terminfo[kcbt]}"
key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"

# Autoload required widgets.
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}" backward-delete-char
[[ -n "${key[Up]}" ]] && bindkey -- "${key[Up]}" up-line-or-history
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-history
[[ -n "${key[Left]}" ]] && bindkey -- "${key[Left]}" backward-char
[[ -n "${key[Right]}" ]] && bindkey -- "${key[Right]}" forward-char
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}" reverse-menu-complete
# Allow to only show the past history events matching the current line up to the current
# cursor position will be shown when ↑ or ↓ keys are pressed.
[[ -n "${key[Up]}" ]] && bindkey -- "${key[Up]}" up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search
# Allow to use ^← to move to the beginning of the previous word and ^→ to move to
# the beginning of the next word.
[[ -n "${key[Control-Left]}" ]] && bindkey -- "${key[Control-Left]}" backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word
