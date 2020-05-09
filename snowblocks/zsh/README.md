<p align="center"><img src="https://raw.githubusercontent.com/arcticicestudio/igloo/master/assets/sb-zsh-banner.svg?sanitize=true" width="320px" /></p>

# Bootstrap Process

When the `ZDOTDIR` environment variable is set [ZSH][] will check for [all the configuration files][archw-zsh#conf_files] using the specified path instead of the default location in the root of the user‘s home directory. This is one of the many great advantages of _ZSH_ because it allows to create a clear well-structured _bootstrap_ process and helps to keep the home directory clean by not cluttering it with more _.dotfiles_.

In order to work across different platforms without the requirement of having the `ZDOTDIR` environment variable already initialized at shell start, e.g. [through `pam_env`][archw-env_vars#pam] or [_systemd_ via _environment.d_][fd-sd-env.d] (both only available on most Linux system), a [minimal entry point script file][gh-blob-main.zsh] is linked to `~/.zshenv`. This file is **always the first user-level file read by _ZSH_** regardless of whether starting as a **login or interactive shell**. It only serves to…

1. …set the `ZDOTDIR` environment variable pointing to the path of the _ZSH_ user-level configuration directory.
2. …source the [actual entry point file `env.zsh`][gh-blob-env.zsh].

_ZSH_ will take care of loading the other startup files that are also symlinked from this _snowblock_ to `$ZDOTDIR`:

1. [`profile.zsh`][gh-blob-profile.zsh] → `$ZDOTDIR/.zprofile` — Currently not used but already created in advance to be prepared for later use when starting as **login shell**.
2. [`rc.zsh`][gh-blob-rc.zsh] → `$ZDOTDIR/.zshrc` — The main script when starting as **interactive shell** that acts as loader to take care of sourcing the actual scripts in this _snowblock_.
3. [`login.zsh`][gh-blob-login.zsh] → `$ZDOTDIR/.zlogin` — Currently not used but already created in advance to be prepared for later use when starting as **login shell**.
4. [`logout.zsh`][gh-blob-logout.zsh] → `$ZDOTDIR/.zlogout` — Currently not used but already created in advance to be prepared for later use when exiting a **login shell**.

Please see the sections below for more information about the implementation details of the [startup/shutdown files][archw-zsh#conf_files].

## `main.zsh`

This is the [minimal entry point script file][gh-blob-main.zsh] that gets symlinked to `~/.zshenv`.
This file is **always the first user-level file read by _ZSH_** regardless of whether starting as a **login or interactive shell**. It only serves to…

1. …set the `ZDOTDIR` environment variable pointing to the path of the _ZSH_ user-level configuration directory.
2. …source the [actual entry point file `env.zsh`][gh-blob-env.zsh] that is documented in the [`env.zsh` section below](#env-zsh).

## `env.zsh`

This is the [actual entry point file][gh-blob-env.zsh] that is sourced by the [minimal `main.zsh` script][gh-blob-main.zsh]. It ensures important environment variables are defined and set by sourcing the [`env.zsh` library file][gh-blob-lib-env.zsh]. These are custom variables, prefixed with `IGLOO_`, that can be used by any file in this _snowblock_ to get data like [XDG base directory][archw-xdg_base_dirs] paths, _ZSH_ related paths like e.g. the _cache_ directory or custom configurations for this _snowblock_ like e.g. the [name of the `promptinit` theme][zsh-docs-contrib#prompt_themes] (`$IGLOO_ZSH_PROMPT_THEME_NAME`) or status of “true color“ terminal support (`$IGLOO_ZSH_NO_TRUE_COLOR`).
Next to custom data is also sets default Unix environment variables like `$LANG`, `$EDITOR` and `$LC_MESSAGES`.

## `profile.zsh`

This is the user profile that provides configurations for **login shell** sessions that is typically used to autostart graphical sessions and to set session-wide environment variables.
There are currently no use cases for this _snowblock_ but is has already been created in advance to be prepared for later use.

## `rc.zsh`

This is the [configuration file for **interactive shell** sessions][gh-blob-rc.zsh] that is symlinked to `$ZDOTDIR/.zshrc` and therefore automatically sourced by _ZSH_ after loading [the `$ZDOTDIR/.zshenv` file](#env-zsh).
It serves to…

1. …initialize arrays, tied to their respective environment variable, like [(binary) executable search `$path`][wiki-path_var], _ZSH_ [autoload function `$fpath`][zsh-docs-func#autoload] and the [manual pages search `$manpath`][man7-linux-manpath].
2. Load custom configurations by sourcing [the `config.zsh` library file][gh-blob-lib-config.zsh].
3. Load package environment variables by scanning and sourcing individual `env.zsh` files that [each package directory][gh-tree-pkgs] might contain. Also see the [section about packages and their structure](#packages) below for more details.
4. Load all [ZSH related configurations][gh-tree-configs] for features like [the completion system][zsh-docs-compl_sys], specific [shell options][zsh-docs-options], special [hook functions][zsh-docs-funcs#hooks] and many more.
5. Load package configurations and aliases by scanning and sourcing individual `config.zsh` and `aliases.zsh` files that [each package directory][gh-tree-pkgs] might contain. Also see the [section about packages and their structure](#packages) below for more details.
6. Autoload all [custom functions][gh-tree-lib-funcs].
7. Load the custom key bindings for the [ZSH line editor][zsh-docs-zle].
8. Load all [plugins][gh-blob-lib-plugins_base] that are managed by [zplug][].

## `login.zsh`

This file is used for executing user commands at ending of initial progress for **login shell** sessions, typically to autostart command line utilities.
There are currently no use cases for this _snowblock_ but is has already been created in advance to be prepared for later use.

### `logout.zsh`

This file is used for executing user commands when a **login shell** sessions ends.
There are currently no use cases for this _snowblock_ but is has already been created in advance to be prepared for later use.

# Packages

In order to allow a clean and simple way to configure applications, this _snowblock_ classifies data like application-scoped environment variables, configurations and aliases into “packages“. Each package is just a folder that can contain any amount of _ZSH_ scripts, but it is tied to the following conditions/naming convention and automation:

- A file named `env.zsh` must only contain environment variable definitions. It is sourced automatically by the [`env.zsh` entry point script][gh-blob-env.zsh] during the [bootstrap process](#bootstrap-process). See the [section about the `env.zsh` file](#env-zsh) above for more details.
- A file named `config.zsh` must only contain configurations scoped to the package. It is sourced automatically by the [`rc.zsh` loader script][gh-blob-rc.zsh] during the [bootstrap process](#bootstrap-process). See the [section about the `rc.zsh` file](#rc-zsh) above for more details.
- A file named `aliases.zsh` must only contain alias definitions scoped to the package. It is sourced automatically by the [`rc.zsh` loader script][gh-blob-rc.zsh] during the [bootstrap process](#bootstrap-process). See the [section about the `rc.zsh` file](#rc-zsh) above for more details.

# Prompt Theme

This _snowblock_ comes with a [custom prompt theme][gh-blob-lib-themes-igloo] for the [_ZSH_ `promptinit` module][zsh-docs-contrib#prompt_themes] named `igloo`. It has been designed for a minimal and uncluttered appearance without an unnecessary overhead of information and distractions.
The theme consists of **eight elements in total**, divided into **fix segments**, where **five of them can be rendered conditionally** or **hidden explicitly through configurations** via environment variables.

<p align="center">Appearance when <strong>all segments</strong> are rendered</p>
<p align="center"><img src="https://raw.githubusercontent.com/arcticicestudio/igloo/master/assets/sb-zsh-prompt-theme-segments-all.png" /></p>

The following sections provide a brief overview of their purpose, style and the ways to configure them.
For a extensive and detailed documentation see the theme help by running `prompt -h igloo`.

<p align="center"><img src="https://raw.githubusercontent.com/arcticicestudio/igloo/master/assets/sb-zsh-prompt-theme-help.png" /></p>

## Line A

This is the metadata line that consists of segments like the name of the current user, the name of the host system, the last exit status code, the amount of active background jobs and the time in _YYYY-MM-DD_ format.

- **Username** — The name of the current user
  It is hidden by default and automatically rendered for remote/SSH sessions.
  When the shell is running with privileges, like e.g. logged in as `root`, the name of the user is rendered with **bold font style** and cyan foreground color to better visualize the current permission state.
  When the `IGLOO_ZSH_PROMPT_THEME_ALWAYS_SHOW_USER` environment variable is set to `true` it will always be rendered independent of the current session type.
  <p align="center"><img src="https://raw.githubusercontent.com/arcticicestudio/igloo/master/assets/sb-zsh-prompt-theme-segment-username.png" /></p>
  <p align="center"><img src="https://raw.githubusercontent.com/arcticicestudio/igloo/master/assets/sb-zsh-prompt-theme-segment-username_host_privileged.png" /></p>
- **Hostname** — The name of the current host.
  It is hidden by default and automatically rendered for remote/SSH sessions.
  When the `IGLOO_ZSH_PROMPT_THEME_ALWAYS_SHOW_HOST` environment variable is set to `true` it will always be rendered independent of the current session type.
  <p align="center"><img src="https://raw.githubusercontent.com/arcticicestudio/igloo/master/assets/sb-zsh-prompt-theme-segment-username_host.png" /></p>
- **Active Background Jobs** — The total number of background jobs.
  It is hidden by default and automatically rendered when the number is greater than `0`.
  <p align="center"><img src="https://raw.githubusercontent.com/arcticicestudio/igloo/master/assets/sb-zsh-prompt-theme-segment-bg_jobs.png" /></p>
- **Last Exit Status Code** — The last exit status code.
  It is hidden by default and automatically rendered when the number is greater than `0`.
  <p align="center"><img src="https://raw.githubusercontent.com/arcticicestudio/igloo/master/assets/sb-zsh-prompt-theme-segment-exist_status_code.png" /></p>
- **Time** — The in _YYYY-MM-DD_ format.
  When the `IGLOO_ZSH_PROMPT_THEME_HIDE_TIME` environment variable is set to `true` the segment won‘t be rendered.
  **Note** that this does not represent the actual time but the last time the prompt was rendered and printed which occurs when the last command finished.

## Line B

This is the main line that is always rendered that consists of the current working directory path.

- **Current Working Directory** — The current working directory.
  It is always rendered and not bound by a condition.
  When the current working directory starts with `$HOME`, that part is replaced by a `~`.
  <p align="center"><img src="https://raw.githubusercontent.com/arcticicestudio/igloo/master/assets/sb-zsh-prompt-theme-segments-default.png" /></p>

## Line C

This is the [Git][] metadata line that is only rendered when the current working directory is a Git repository.
Note that this line depends on [the official `git-prompt.sh` script][git-blob-git_prompt.sh] that ships with Git which provides support for prompt styling. If the script can not be detected, this line won‘t be rendered at all.
See the official Git documentation about [Git in other environments][git-docs-appx-other_envs] and [the `git-prompt.sh` script on GitHub][git-blob-git_prompt.sh] for more details.

- **Git Branch** — The current Git branch.
  It is always rendered and not bound by a condition.
- **Repository Change Status Indicators** —Indicators for the current Git repository change status.
  It only renders characters based on the following conditions:

  - `*` — unstaged changes when `$GIT_PS1_SHOWDIRTYSTATE` is nonempty
  - `+` — staged changes when `$GIT_PS1_SHOWDIRTYSTATE` is nonempty
  - `$` — stashed changes when `$GIT_PS1_SHOWSTASHSTATE` is nonempty
  - `%` — untracked files when `$GIT_PS1_SHOWUNTRACKEDFILES` is nonempty

  See [the `git-prompt.sh` script on GitHub][git-blob-git_prompt.sh] for more details about these indicators and how to configure them.

- **`HEAD` Differences Indicators** — Indicators for differences between `HEAD` and its upstream.
  It is only rendered when the current Git branch tracks a upstream branch and the `GIT_PS1_SHOWUPSTREAM` environment variables is set to `auto`.

  - `<` when behind the upstream
  - `>` when ahead of the upstream
  - `<>` when diverged from the upstream
  - `=` when no differences to the upstream

  See [the `git-prompt.sh` script on GitHub][git-blob-git_prompt.sh] for more details about these indicators and how to configure them.

- **Git Branch Upstream Name** — The name of the current Git branch upstream including the remote name.
  It is only rendered when the current Git branch tracks a upstream branch.
- **Latest Commit ID** — The ID of the latest commit of the current Git branch.
  Note that the ID is not shown when the Git repository doesn‘t have any commits yet. The [] “bracket box“ and ╾─╼ “connector bars“ will always be rendered regardless of whether there are commits in the repository.

<p align="center"><img src="https://raw.githubusercontent.com/arcticicestudio/igloo/master/assets/sb-zsh-prompt-theme-segment-git.png" /></p>

## Line D

This is the main line to actually fire and run commands.
The ▶ “arrow“ character is always rendered and not bound by a condition.

# Colors

This _snowblock_ is designed for the usage with [Nord][] through one of it‘s terminal [port projects][nord-ports].
In order to simplify the usage of the [color palettes][nord-docs-colors] in scripts and commands, the [`igloo-use_nord_colors` function][gh-blob-lib-funcs-nord_colors] can be _autoloaded_. It‘ll create and populate the `IGLOO_ZSH_NORD_COLORS` array with the _Nord_ colors either using the hexadecimal values or the 16 ANSI base colors of the terminal. That depends on whether the [`igloo-has_true_color`][gh-blob-lib-func-true_color] detected that the used [terminal supports “true colors“][gist-true_colors], otherwise it falls back to the ANSI colors `0` to `15`.

# Plugins

All plugins are managed with [zplug][], a next-generation plugin manager for _ZSH_.
They are defined and configured per host / OS in `plugins-*.zsh` files located in the [library directory][gh-tree-lib] while [the `plugins-base.zsh` file][gh-blob-lib-plugins_base] contains cross-platform compatible and independent plugins.

- [fzf][] — a blazingly fast, portable and interactive general-purpose CLI fuzzy finder.
  The [auto completion and key-binding shell scripts][fzf-gh-tree-shell] are loaded from the system-wide installation path of _fzf_ and are therefore dependent on the host / OS.
- [fzf-tab][] — Replaces _ZSH_‘s default completion selection menu with [fzf][].
- [enhancd][] — A next-generation `cd` command with an interactive filter.
- [zsh-autosuggestions][] — Fish-like autosuggestions for commands while typing based on history and completions.
- [zsh-syntax-highlighting][] — Fish-like syntax highlighting for commands whilst they are typed.

# Key Bindings

The [`key_bindings.zsh`][gh-blob-lib-key_bind] creates and populates a `zkbd` compatible hash with [`terminfo(5)`][wiki-terminfo] mappings and defines basic key bindings.
In addition to the custom key bindings the [`zle.zsh`][gh-blob-config-zle] file sets _ZSH line editor_ specific configurations including the `WORDCHARS` environment variable. It contains characters used to determine the next / previous cursor column position when moving back and forth between words based on the defined characters. This allow e.g. to move between different segments of paths or dash-separated words.
See the [official ZSH line editor documentation][zsh-docs-zle] for more details.

## OS & Terminal Configurations

I/O events like keystrokes are always interpreted a little differently by the OS and terminal. Sometimes additional configurations are required in order to make the key bindings work properly.
The following sections provide guides how to set these configurations for OS / applications supported by this _igloo_.

### iTerm2 Profile Keys

The default key preset of [iTerm2][] profiles don't include shortcuts for the left <kbd>⌥</kbd> (_Options_/<kbd>Alt</kbd>) key when used with the <kbd>←</kbd> and <kbd>→</kbd> arrow keys to move between words. Therefore it is required to add both key shortcuts and configure the left <kbd>⌥</kbd> (_Options_/<kbd>Alt</kbd>) key to behave in _escape sequence_ mode “Esc+“:

1. Open the preferences via **iTerm2** → **Preferences** or press the <kbd>⌘</kbd><kbd>,</kbd> shortcut.
2. Switch to the **Profiles** tab, select your profile and change to the **Keys** sub-tab.
3. Select the “Esc+“ option radio box for **Left Option (⌥) Key**.
4. Click on the <kbd>+</kbd> button to add the new key shortcuts using the following values:
   - **Keyboard Shortcut**: `⌥←`
     **Action**: `Send Escape Sequence`
     **Esc+**: `b`
   - **Keyboard Shortcut**: `⌥→`
     **Action**: `Send Escape Sequence`
     **Esc+**: `f`

<p align="center"><img src="https://raw.githubusercontent.com/arcticicestudio/igloo/master/assets/sb-zsh-zle-iterm2-key_shortcuts.png" /></p>

# Resources

## Official ZSH Documentations

- [Documentation Index][zsh-docs]
- [Extensive User Guide][zsh-docs-guide]
- [Startup Files][zsh-docs-startup_files]
- [Variable Index][zsh-docs-var_idx]
- [FAQ][zsh-docs-faq]
- [Shell Grammar][zsh-docs-shell_grammar]

## Arch Linux

- [“ZSH“ Wiki Page][archw-zsh]

[archw-env_vars#pam]: https://wiki.archlinux.org/index.php/Environment_variables#Using_pam_env
[archw-xdg_base_dirs]: https://wiki.archlinux.org/index.php/XDG_Base_Directory
[archw-zsh]: https://wiki.archlinux.org/index.php/zsh
[archw-zsh#conf_files]: https://wiki.archlinux.org/index.php/zsh#Startup/Shutdown_files
[enhancd]: https://github.com/b4b4r07/enhancd
[fd-sd-env.d]: https://www.freedesktop.org/software/systemd/man/environment.d.html
[fzf-gh-tree-shell]: https://github.com/junegunn/fzf/tree/master/shell
[fzf-tab]: https://github.com/Aloxaf/fzf-tab
[fzf]: https://github.com/junegunn/fzf
[gh-blob-config-zle]: https://github.com/arcticicestudio/igloo/blob/master/snowblocks/zsh/config/zle.zsh
[gh-blob-env.zsh]: https://github.com/arcticicestudio/igloo/blob/master/snowblocks/zsh/env.zsh
[gh-blob-lib-config.zsh]: https://github.com/arcticicestudio/igloo/blob/master/snowblocks/zsh/lib/config.zsh
[gh-blob-lib-env.zsh]: https://github.com/arcticicestudio/igloo/blob/master/snowblocks/zsh/lib/env.zsh
[gh-blob-lib-func-true_color]: https://github.com/arcticicestudio/igloo/blob/master/snowblocks/zsh/lib/functions/igloo-has_true_color
[gh-blob-lib-funcs-nord_colors]: https://github.com/arcticicestudio/igloo/blob/master/snowblocks/zsh/lib/functions/igloo-use_nord_colors
[gh-blob-lib-key_bind]: https://github.com/arcticicestudio/igloo/blob/master/snowblocks/zsh/lib/key_bindings.zsh
[gh-blob-lib-plugins_base]: https://github.com/arcticicestudio/igloo/blob/master/snowblocks/zsh/lib/plugins-base.zsh
[gh-blob-lib-themes-igloo]: https://github.com/arcticicestudio/igloo/blob/master/snowblocks/zsh/lib/themes/igloo.zsh
[gh-blob-login.zsh]: https://github.com/arcticicestudio/igloo/blob/master/snowblocks/zsh/login.zsh
[gh-blob-logout.zsh]: https://github.com/arcticicestudio/igloo/blob/master/snowblocks/zsh/logout.zsh
[gh-blob-main.zsh]: https://github.com/arcticicestudio/igloo/blob/master/snowblocks/zsh/main.zsh
[gh-blob-profile.zsh]: https://github.com/arcticicestudio/igloo/blob/master/snowblocks/zsh/profile.zsh
[gh-blob-rc.zsh]: https://github.com/arcticicestudio/igloo/blob/master/snowblocks/zsh/rc.zsh
[gh-tree-configs]: https://github.com/arcticicestudio/igloo/tree/master/snowblocks/zsh/config
[gh-tree-lib-funcs]: https://github.com/arcticicestudio/igloo/tree/master/snowblocks/zsh/lib/functions
[gh-tree-lib]: https://github.com/arcticicestudio/igloo/tree/master/snowblocks/zsh/lib
[gh-tree-pkgs]: https://github.com/arcticicestudio/igloo/tree/master/snowblocks/zsh/pkgs
[gist-true_colors]: https://gist.github.com/XVilka/8346728
[git-blob-git_prompt.sh]: https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
[git-docs-appx-other_envs]: https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Zsh
[git]: https://git-scm.com
[iterm2]: https://www.iterm2.com
[man7-linux-manpath]: http://man7.org/linux/man-pages/man5/manpath.5.html
[nord-docs-colors]: https://www.nordtheme.com/docs/colors-and-palettes
[nord-ports]: https://www.nordtheme.com/ports
[nord]: https://www.nordtheme.com
[wiki-path_var]: https://en.wikipedia.org/wiki/PATH_(variable)
[wiki-terminfo]: https://en.wikipedia.org/wiki/Terminfo
[zplug]: https://github.com/zplug/zplug
[zsh-autosuggestions]: https://github.com/zsh-users/zsh-autosuggestions
[zsh-docs-compl_sys]: http://zsh.sourceforge.net/Doc/Release/Completion-System.html
[zsh-docs-contrib#prompt_themes]: http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Prompt-Themes
[zsh-docs-faq]: http://zsh.sourceforge.net/faq/zshfaq.html
[zsh-docs-func#autoload]: http://zsh.sourceforge.net/Doc/Release/Functions.html#Autoloading-Functions
[zsh-docs-funcs#hooks]: http://zsh.sourceforge.net/Doc/Release/Functions.html#Hook-Functions
[zsh-docs-guide]: http://zsh.sourceforge.net/Guide/zshguide.html
[zsh-docs-options]: http://zsh.sourceforge.net/Doc/Release/Options.html
[zsh-docs-shell_grammar]: http://zsh.sourceforge.net/Doc/Release/Shell-Grammar.html
[zsh-docs-startup_files]: http://zsh.sourceforge.net/Intro/intro_3.html
[zsh-docs-var_idx]: http://zsh.sourceforge.net/Doc/Release/Variables-Index.html
[zsh-docs-zle]: http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html
[zsh-docs]: http://zsh.sourceforge.net/Doc
[zsh-syntax-highlighting]: https://github.com/zsh-users/zsh-syntax-highlighting
[zsh]: http://zsh.sourceforge.net
