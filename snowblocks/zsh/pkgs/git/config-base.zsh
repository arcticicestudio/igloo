# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>

# Project:    igloo
# Repository: https://github.com/arcticicestudio/igloo
# License:    MIT

# Loads configurations for Git's prompt support when the script has been loaded in the current shell session.
# See:
#   1. https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Zsh
#   2. https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
if [[ "${+functions[__git_ps1]}" ]]; then
  # Show more information about the identity of commits checked out as a detached HEAD.
  # Control the behavior by setting one of these values:
  #   contains  Relative to newer annotated tag (v1.6.3.2~35)
  #   branch    Relative to newer tag or branch (master~4)
  #   describe  Relative to older annotated tag (v1.6.3.1-13-gdd42c2f)
  #   tag       Relative to any older tag (v1.6.3.1-13-gdd42c2f)
  #   default   Exactly matching tag
  export GIT_PS1_DESCRIBE_STYLE=describe

  # Disable __git_ps1 output when the current working directory is set up to be ignored by git.
  # Also configurable per repository via `bash.hideIfPwdIgnored`.
  export GIT_PS1_HIDE_IF_PWD_IGNORED=

  # Show colored hints about the current dirty state.
  # The colors are based on the colored output of `git status -sb`.
  # NOTE: Only available when using __git_ps1 via ZSH's `precmd` hook function!
  export GIT_PS1_SHOWCOLORHINTS=

  # Show unstaged (*) and staged (+) changes.
  # Also configurable per repository via `bash.showDirtyState`.
  export GIT_PS1_SHOWDIRTYSTATE=true

  # Show currently stashed ($) changes.
  export GIT_PS1_SHOWSTASHSTATE=

  # Show untracked (%) changes.
  # Also configurable per repository via `bash.showUntrackedFiles`.
  export GIT_PS1_SHOWUNTRACKEDFILES=true

  # Show indicator for difference between HEAD and its upstream.
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
  #   legacy   Do not use the `--count` option available in recent versions of git-rev-list
  #   git      Always compare HEAD to `@{upstream}`
  #   svn      Always compare HEAD to your SVN upstream
  #
  # By default, `__git_ps1` will compare HEAD to SVN upstream (`@{upstream}` if not available).
  # Also configurable per repository via `bash.showUpstream`.
  export GIT_PS1_SHOWUPSTREAM=(auto name verbose)
fi
