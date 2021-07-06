# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>

# Project:    igloo
# Repository: https://github.com/arcticicestudio/igloo
# License:    MIT

# Displays documentations and help text for the "igloo" prompt theme.
prompt_igloo_help() {
  print -P "
  Arctic Ice Studio's ZSH %F{6}igloo%f prompt theme.
  See https://github.com/arcticicestudio/igloo/tree/master/snowblocks/zsh for more details.

  This prompt theme has been designed for a minimal and uncluttered appearance without an
  unnecessary overhead of information and distractions.
  It is also primarily designed for the usage with the %F{6}Nord%f color palettes,
  They should be provided by the used terminal as the 16 base colors.

  %F{0}█%f %F{1}█%f %F{2}█%f %F{3}█%f %F{4}█%f %F{5}█%f %F{6}█%f %F{7}█%f
  %F{8}█%f %F{9}█%f %F{10}█%f %F{11}█%f %F{12}█%f %F{13}█%f %F{14}█%f %F{15}█%f

  %F{6}Nord%f supports many different terminals and platforms through official port projects.
  See https://www.nordtheme.com for more details.

  %B+--------------+%b
  %B+ Dependencies +%b
  %B+--------------+%b

  In order to include Git information and metadata in the prompt, when the current working
  directory is a Git repository, the theme depends on the official %F{4}git-prompt.sh%f script
  that ships with Git and provides support for prompt styling.
  The prompt tests for the %F{6}__git_ps1%f function in order to check if the script has been
  sourced in the current shell session, otherwise it'll simply hide the Git prompt segments.
  See https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Zsh and
  https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh for more details.

  When the script is not bundled with your current Git installation you can download and source
  the script on your own your use a ZSH \"plugin\" manager like
  \"zplug\" (https://github.com/zplug/zplug) to install and load the script for every shell
  session. See https://github.com/zplug/zplug for more details.

  %B+------------------+%b
  %B+ Segments & Style +%b
  %B+------------------+%b

  The theme consists of multiple dynamic segments, divided into several lines.

  %F{4}A%f %F{8}┌─╼[%F{4}1%f@%F{4}2%F{8}]╾─╼[%F{1}3%F{8}][%F{4}4%F{8}]╾─╼[%F{4}5%F{8}]%f
  %F{4}B%f %F{8}└─╼[%F{4}6%F{8}]%f
  %F{4}C%f  %F{8}╰╼[%F{6}7 8 9 10%F{8}]╾─╼[%F{6}11%F{8}]%f
  %F{4}D%f %F{8}▶%f

  %F{0}%K{4} A %f%k
     This is the metadata line.
     The following segments are rendered by default: %F{4}5%f
     The following segments are rendered conditionally: %F{4}1 2 3 4%f
  %F{4}1.%f The name of the current user.
     This segment is hidden by default and automatically rendered for remote/SSH sessions.
     When the shell is running with privileges, like e.g. logged in as %F{4}root%f,
     the name of the user is rendered with %Bbold font style%b and %F{14}cyan%f foreground
     color to better visualize the current permission state.
     When the %F{6}IGLOO_ZSH_PROMPT_THEME_ALWAYS_SHOW_USER%f environment variable is set
     to %F{6}true%f it will always be rendered independent of the current session type.
  %F{4}2.%f The name of the current host.
     This segment is hidden by default and automatically rendered for remote/SSH sessions.
     When the %F{6}IGLOO_ZSH_PROMPT_THEME_ALWAYS_SHOW_HOST%f environment variable is set
     to %F{6}true%f it will always be rendered independent of the current session type.
  %F{4}3.%f The total number of background jobs.
     This segment is hidden by default and automatically rendered when the number is
     greater than %F{5}0%f.
  %F{4}4.%f The last exit status code.
     This segment is hidden by default and automatically rendered when the number is
     greater than %F{5}0%f.
  %F{4}5.%f The time in %F{4}YYYY-MM-DD%f format.
     When the %F{6}IGLOO_ZSH_PROMPT_THEME_HIDE_TIME%f environment variable is set
     to %F{6}true%f the segment won't be rendered.
     %B%F{0}%K{3}Note%b%f%k that this does not represent the actual time but the last
     time the prompt was rendered and printed which occurs when the last command finished.
  %F{0}%K{4} B %f%k
     This is the main line that is always rendered.
  %F{4}6.%f The path of the current working directory.
     This segment is always rendered and not bound by a condition.
     When the current working directory starts with %F{4}$%f%BHOME%b,
     that part is replaced by a %F{4}~%f.
  %F{0}%K{4} C %f%k
     This is the Git metadata line that is only rendered when the current working directory
     is a Git repository.
     The following segments are rendered by default: %F{4}7%f
     The following segments are rendered conditionally: %F{4}8 9 10 11%f
     %B%F{0}%K{3}Note%b%f%k that this line depends on the official %F{4}git-prompt.sh%f script
     that ships with Git which provides support for prompt styling.
     If the script can not be detected, this line won't be rendered at all.
     See https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Zsh and
     https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh for more details.
  %F{4}7.%f The name of the current Git branch.
     This segment is always rendered and not bound by a condition.
  %F{4}8.%f Indicators for the current Git repository change status.
     This segment only renders characters based on the following conditions:
     - %F{14}*%f for unstaged changes when %F{6}GIT_PS1_SHOWDIRTYSTATE%f is nonempty
     - %F{14}+%f for staged changes when %F{6}GIT_PS1_SHOWDIRTYSTATE%f is nonempty
     - %F{14}$%f for stashed changes when %F{6}GIT_PS1_SHOWSTASHSTATE%f is nonempty
     - %F{14}%%%f for untracked files when %F{6}GIT_PS1_SHOWUNTRACKEDFILES%f is nonempty
     See https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh for more details
     about these indicators and how to configure them.
  %F{4}9.%f Indicators for differences between HEAD and its upstream.
     This segments is only rendered when the current Git branch tracks a upstream branch and
     the %F{6}GIT_PS1_SHOWUPSTREAM%f environment variables is set to %F{2}auto%f.
     - %F{14}<%f when behind the upstream
     - %F{14}>%f when ahead of the upstream
     - %F{14}<>%f when diverged from the upstream
     - %F{14}=%f when no differences to the upstream
     See https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh for more details
     about these indicators and how to configure them.
  %F{4}10.%f The name of the current Git branch upstream including the remote name.
      This segments is only rendered when the current Git branch tracks a upstream branch.
  %F{4}11.%f The ID of the latest commit of the current Git branch.
      %B%F{0}%K{3}Note%b%f%k that the ID is not shown when the Git repository doesn't have any
      commits yet. The \"bracket box\" and \"connector bars\" will always be rendered regardless
      of whether there are commits in the repository.
  %F{0}%K{4} D %f%k
     This is the main line to actually fire and run commands.
     The \"arrow\" character is always rendered and not bound by a condition.

   This is an example of a prompt with all lines rendered...
   - ...in a SSH session
   - ...with an exit status code of 1 from the last command
   - ...with 3 active background jobs
   - ...where the current working directory is a Git Repository...
     - ...with untracked, unstaged, staged and stashed changes
     - ...with 3 commits ahead of the upstream
     - ...with an configured upstream
     - ...with the latest commit ID
 
   %F{8}┌─╼[%F{4}arcticicestudio%f@%F{4}polarbear%F{8}]╾─╼[%F{1}1%f%F{8}][%F{4}3%F{8}]╾─╼[%F{4}12:32:04%F{8}]%f
   %F{8}└─╼[%F{4}~/code/igloo%F{8}]%f
    %F{8}╰╼[%F{6}master *+%%\$ u+3 origin/master%f%F{8}]╾─╼[%F{6}d808e72%F{8}]%f
   %F{8}▶%f

   When the shell is running with privileges, like e.g. logged in as %F{4}root%f,
   the name of the user is rendered with %Bbold font style%b and %F{14}cyan%f foreground
   color to better visualize the current permission state.

   %F{8}┌─╼[%B%F{14}arcticicestudio%b%f@%F{4}polarbear%F{8}]%f

  %B+----------------+%b
  %B+ Configurations +%b
  %B+----------------+%b

  Set the following environment variables to customize the prompt style and behavior.
  
  %F{6}IGLOO_ZSH_PROMPT_THEME_ALWAYS_SHOW_USER%f
    Set to %F{4}true%f to always show the prompt segment that contains the name of the current user.
    By default this is set to %F{4}false%f.
    %B%F{0}%K{3}Note%b%f%k that the prompt segment is always shown when running a remote/SSH session.
  %F{6}IGLOO_ZSH_PROMPT_THEME_ALWAYS_SHOW_HOST%f
    Set to %F{4}true%f to always show the prompt segment that contains the name of the host.
    By default this is set to %F{4}false%f.
    %B%F{0}%K{3}Note%b%f%k that the prompt segment is always shown when running a remote/SSH session.
  %F{6}IGLOO_ZSH_PROMPT_THEME_HIDE_TIME%f
    Set to %F{4}true%f to hide the prompt segment that contains the time.
    By default this is set to %F{4}false%f.

  See zsh.sourceforge.net/Doc/Release/User-Contributions.html#Writing-Themes for more details
  about how to write prompt themes.
"
}

# Displays a simulated version of the "igloo" theme with all lines rendered...
# - ...in a SSH session
# - ...with an exit status code of 1 from the last command
# - ...with 3 active background jobs
# - ...where the current working directory is a Git Repository...
#   - ...with untracked, unstaged, staged and stashed changes
#   - ...with 3 commits ahead of the upstream
#   - ...with an configured upstream
#   - ...with the latest commit ID
prompt_igloo_preview() {
  print -P "%F{8}┌─╼[%F{4}%n%f@%F{4}%m%F{8}]╾─╼[%F{1}1%f%F{8}][%F{4}3%F{8}]╾─╼[%F{4}%D{%H:%M:%S}%F{8}]%f
%F{8}└─╼[%F{4}%~%F{8}]%f
 %F{8}╰╼[%F{6}master *+%%\$ u+3 origin/master%f%F{8}]╾─╼[%F{6}d808e72%F{8}]%f
%F{8}▶%f command arg1 arg2 ... argn"
}

# Initializes and configures the "igloo" prompt theme.
prompt_igloo_setup() {
  # +------------------------------+
  # + ZSH Options & Configurations +
  # +------------------------------+
  # Enable command substitution and arithmetic expansion in prompts.
  # See:
  #   1. http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
  setopt LOCAL_OPTIONS PROMPT_SUBST

  # Enable support for color name mapping to (and from) the ANSI standard eight-color terminal codes.
  # See:
  #   1. http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Descriptions
  autoload -Uz colors && colors

  # Allow to add functions to ZSH's hook functions.
  # Added this function in order to always run it when the prompt gets rendered to update included data.
  # See:
  #   1. http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Manipulating-Hook-Functions
  #   2. http://zsh.sourceforge.net/Doc/Release/Functions.html#Hook-Functions
  autoload -Uz add-zsh-hook
  add-zsh-hook precmd prompt_igloo_setup

  # +------------------------+
  # + Git Prompt Integration +
  # +------------------------+
  # The following variables are options to configure Git's prompt support script.
  # See:
  #   1. https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh

  # Show more information about the identity of commits checked out as a detached HEAD.
  # Control the behavior by setting one of these values:
  #   contains  Relative to newer annotated tag (v1.6.3.2~35)
  #   branch    Relative to newer tag or branch (master~4)
  #   describe  Relative to older annotated tag (v1.6.3.1-13-gdd42c2f)
  #   tag       Relative to any older tag (v1.6.3.1-13-gdd42c2f)
  #   default   Exactly matching tag
  GIT_PS1_DESCRIBE_STYLE=${GIT_PS1_DESCRIBE_STYLE:-describe}

  # Disable `__git_ps1` output when the current working directory is set up to be ignored by Git.
  # Also configurable per repository via `git config bash.hideIfPwdIgnored`.

  GIT_PS1_HIDE_IF_PWD_IGNORED=${GIT_PS1_HIDE_IF_PWD_IGNORED:-}
  # Show colored hints about the current dirty state.
  # The colors are based on the colored output of `git status -sb`.
  # NOTE: Only available when using `__git_ps1` via ZSH's `precmd` hook function!
  GIT_PS1_SHOWCOLORHINTS=${GIT_PS1_SHOWCOLORHINTS:-}

  # Show unstaged (*) and staged (+) changes.
  # Also configurable per repository via `git config bash.showDirtyState`.
  GIT_PS1_SHOWDIRTYSTATE=${GIT_PS1_SHOWDIRTYSTATE:-true}

  # Show currently stashed ($) changes.
  GIT_PS1_SHOWSTASHSTATE=${GIT_PS1_SHOWSTASHSTATE:-true}

  # Show untracked (%) changes.
  # Also configurable per repository via `git config bash.showUntrackedFiles`.
  GIT_PS1_SHOWUNTRACKEDFILES=${GIT_PS1_SHOWUNTRACKEDFILES:-true}

  # Show indicators for difference between HEAD and its upstream.
  #
  # <  Behind upstream
  # >  Ahead upstream
  # <> Diverged upstream
  # =  Equal upstream
  #
  # Control behavior by setting to a space-separated list of values:
  #   auto     Automatically show indicators
  #   verbose  Show number of commits ahead/behind (+/-) upstream
  #   name     If verbose, then also show the upstream abbrev name
  #   legacy   Do not use the '--count' option available in recent versions of git-rev-list
  #   git      Always compare HEAD to @{upstream}
  #   svn      Always compare HEAD to your SVN upstream
  #
  # By default, `__git_ps1` will compare HEAD to SVN upstream (`@{upstream}` if not available).
  # Also configurable per repository via `git config bash.showUpstream`.
  GIT_PS1_SHOWUPSTREAM=${GIT_PS1_SHOWUPSTREAM:="auto name verbose"}

  # +--------------------------------+
  # + Theme Options & Configurations +
  # +--------------------------------+
  # By default the name of the host is only shown for remote/SSH sessions.
  # When set to `true` the name will always be shown independent of the current session type.
  IGLOO_ZSH_PROMPT_THEME_ALWAYS_SHOW_HOST=${IGLOO_ZSH_PROMPT_THEME_ALWAYS_SHOW_HOST:-false}

  # By default the name of the user is only shown for remote/SSH sessions.
  # When set to `true` the name will always be shown independent of the current session type.
  IGLOO_ZSH_PROMPT_THEME_ALWAYS_SHOW_USER=${IGLOO_ZSH_PROMPT_THEME_ALWAYS_SHOW_USER:-false}

  # By default the time is always shown.
  # When set to `true` the segment won't be rendered.
  IGLOO_ZSH_PROMPT_THEME_HIDE_TIME=${IGLOO_ZSH_PROMPT_THEME_HIDE_TIME:-false}

  # +-----------------+
  # + Style Constants +
  # +-----------------+
  local ARROW="▶"             # \u25B6
  local CONNECTBAR_DOWN="┌─╼" # \u250C\u2500\u257C
  local CONNECTBAR_UP="└─╼"   # \u2514\u2500\u257C
  local SPLITBAR_GIT="╰╼"     # \u2570\u257C
  local SPLITBAR="╾─╼"        # \u257E\u2500\u257C
  local c_reset="%b%f%k"
  local newline=$'\n'
  local nord3="%F{8}"
  local nord7="%F{14}"
  local nord8="%F{6}"
  local nord9="%F{4}"
  local nord11="%F{1}"

  # +----------+
  # + Segments +
  # +----------+
  local seg_arrow="${nord3}${ARROW} ${c_reset}"
  local seg_connect_bar_down="${newline}${nord3}${CONNECTBAR_DOWN}${c_reset}"
  local seg_exit_status="%(?..${nord3}[%(?.${nord9}.${nord11})%?${nord3}]${SPLITBAR}${c_reset})"
  local seg_jobs="%(1j.${nord3}[${nord9}%j${nord3}]${c_reset}%(?.${nord3}${SPLITBAR}${c_reset}.).)"
  local seg_working_dir="${nord3}[${nord9}%~${nord3}]${newline}${c_reset}"

  local seg_time="${nord3}[${nord9}%D{%H:%M:%S}${nord3}]${newline}${CONNECTBAR_UP}${c_reset}"
  if [[ $IGLOO_ZSH_PROMPT_THEME_HIDE_TIME == true ]]; then
    seg_time=
  fi

  local is_remote_ssh seg_frag_host seg_frag_user seg_user_host
  [[ -n "$SSH_CLIENT" || -n "$SSH_CONNECTION" || -n "$SSH_TTY" ]] && is_remote_ssh=true
  if [[ $IGLOO_ZSH_PROMPT_THEME_ALWAYS_SHOW_USER == true || $is_remote_ssh == true ]]; then
    seg_frag_user="%(!.%B${nord7}.${nord9})%n${c_reset}"
  fi
  if [[ $IGLOO_ZSH_PROMPT_THEME_ALWAYS_SHOW_HOST == true || $is_remote_ssh == true ]]; then
    seg_frag_host="%f@${nord9}%m${c_reset}"
  fi
  if [[ -n $seg_frag_user || -n $seg_frag_host ]]; then
    seg_user_host="${nord3}[${seg_frag_user}${seg_frag_host}${nord3}]${SPLITBAR}${c_reset}"
  fi

  local seg_git
  # Only render the Git segment when the bundled prompt support script has been sourced and the current working
  # directory is actually a Git repository.
  if [[ $(typeset -f __git_ps1) && $(command git rev-parse --is-inside-work-tree 2>/dev/null) == true ]]; then
    local git_commit_short="$(command git rev-parse --short HEAD 2> /dev/null)"
    seg_git=" ${nord3}${SPLITBAR_GIT}[${nord8}$(__git_ps1 "%s")${nord3}]${SPLITBAR}[${nord8}${git_commit_short}${nord3}]${c_reset}${newline}"
  fi

  PROMPT="${seg_connect_bar_down}${seg_user_host}${seg_jobs}${seg_exit_status}${seg_time}${seg_working_dir}${seg_git}${seg_arrow}"
}

prompt_igloo_setup "$@"
