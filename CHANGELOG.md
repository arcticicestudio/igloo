<p align="center"><img src="https://raw.githubusercontent.com/arcticicestudio/igloo/develop/assets/igloo-logo-banner.svg?sanitize=true"/></p>

# 0.1.0

![Release Date: 2020-04-05](https://img.shields.io/badge/Release_Date-2020--04--05-88C0D0.svg?style=flat-square) [![Project Board](https://img.shields.io/badge/Project_Board-0.1.0-88C0D0.svg?style=flat-square)](https://github.com/arcticicestudio/igloo/projects/2) [![Milestone](https://img.shields.io/badge/Milestone-0.1.0-88C0D0.svg?style=flat-square)](https://github.com/arcticicestudio/igloo/milestone/1)

## Historical Background

Back on January 7 2017, this repository was created in order to open source my _dotfiles_ that were stored and managed in a private repository on my server back then. The intention was to allow other to learn and use these files or even contribute back even though most of the time preferences and configurations are shaped for personal use. I also liked the great idea of the [“GitHub does dotfiles“][gh-dotfiles] project and the fact that a public repository makes it way easier for me to setup and bootstrap a new system without the requirement to configure and connect to my VPN before being able to clone and use my _dotfiles_.

Since then this repository changed a lot regarding the structure and data, forming my “digital source-of-truth“ for my systems. The main targets hosts were `illuvigaq` (later on [renamed to `igloo`][gh-10]) and `archbook` where the later was [replaced with `iceowl`][gh-143] later on by switching from _Arch Linux_ running on a _MacBook Pro 11,2 (2016)_ to [_macOS_ on a new _MacBook Pro 15,2 (2018)_][gh-131].
Even though updates are documented and merged through an organized workflow, the repository was more like a constantly changing and moving kind of cache to keep the _dotfiles_ reasonably maintainable and in sync between the systems.

The goal was to use the files in daily business, improve up on these usage experiences and finally persist the configurations into this repository. This is the way this repository was used for almost over 3 years and it worked reasonably well, but there are plans for a refactoring of the structure and workflow. In order to clarify this goal release version 0.1.0 is going to set a imaginary marker line in the repository history to persist and document the current repository state.

The following sections provide detailed documentations about all the _snowblocks_, _snowflakes_ and everything else that has been done to build up the current _dotfile_ state.

## Repository Structure

**Bootstrap script** — #1 (⊶ b516e30a)

↠ Implemented the `bootstrap` shell script to run [snowsaw][] with the following configurations:

- `SNOWSAW_DIR=.snowsaw` — Path to the _snowsaw_ submodule.
- `SNOWSAW_BIN=.bin/snowsaw` — Path to the _snowsaw_ binary.
- `SNOWBLOCKS_BASE_DIR_NAME=snowblocks` — Name of the base `snowblock` directory.
- `SNOWBLOCKSDIR=.` — Relative path of the current working directory the `bootstrap` script runs in.

The actual execution command `"${SNOWSAW_DIR}/${SNOWSAW_BIN}" -s "${SNOWBLOCKSDIR}"` allows to add additional options by passing parameters through via `"${@}"`.

**MIT license migration** — #59 ⇄ #60 (⊶ 11c003ec)

↠ Before the project code was licensed under the [Apache 2.0][apache-license] license. This often causes problems when developers want to use the project or code parts of it in another project licensed under a less restricted license.
The project migrated to the [MIT license][choosealicense-mit] which is more open, unrestricted and the most used license for open source projects like [React][] which has also recently been [re-licensed][fb-code-blog-react_relicense].

**Updated copyright comment header** — #123 (⊶ 2e4d6946)

↠ Before some files still used a “hard-coded“ copyright year that has now been changed to use the `<YEAR_OF_BIRTH>-present` pattern in order to prevent unnecessary overhead on each year change.
Also the copyright email for „Sven Greb“ was invalid and has been updated to the valid address.

## _Snowblocks_

### Git — #2 (⊶ fd43bdac)

↠ Initially `snwoblocks/git` for [Git][] provided the following files & directories linked to their destination:

- `gitconfig` → `~/.git-commit-msg`
- `gitignore` → `~/.gitignore`
- `gitconfig_auth` → `~/.gitconfig_auth` (initially **not** tracked by Git but only created and linked locally)
- `git-commit-msg` → `~/.git-commit-msg`

Over the time the `git` _snowblock_ evolved through the following changes:

1. **Conditional configuration inclusion** #23 ⇄ #27 (⊶ 427e6cb5)
   ↠ The new [conditional configuration `includes`][git-docs-config#incl] Git feature was introduced in version [2.13][gh-blog-git-2.13] provides a comfortable way to automatically load different configurations based on the current path of the repository.
   Many path specific projects have been added to to allow to split the main- and job authentication configurations.
   Also see the following related changes:

   - **Conditional configuration includes for "gitlab" and "incubator"** #97 ⇄ #101 (⊶ eca02520)
     ↠ Added [conditional configuration `includes`][gh-blog-git-2.13#cond_incl] for the `gitlab` and `incubator` directories using the default main Git configuration.
   - **New conditional authentication configuration `include`** #120 (⊶ 36970049)
     ↠ Ensured all _communikey_ projects are configured to use the `svengreb` Git user a new conditional include for the `~/code/github/repositories/communicode/` path(s).
   - **New conditional authentication config `include`** #171 (⊶ 631ab5f1)
     ↠ Ensured all projects by [@svengreb][gh-user-svengreb] are committed with the correct Git credentials a new conditional `include` for the `~/yggdrasil/svengreb/` path has been added.

2. **Simplified branch printing aliases** #25 ⇄ #28 (⊶ 427e6cb5)
   ↠ The branch printing aliases `b` and the extended aliases `bum` and `bm` have been simplified by removing unnecessary flags:

   - The `--list` flag is used to list branches matching a specific pattern.
   - Removed `-v`/`-vv`/`--verbose` which shows the commit SHA1 and subject line after each branch.

3. **Improved logging alias formats** #24 ⇄ #29 (⊶ a316d775)
   ↠ The defined ASCII colors codes for the output have been changed to adapt to the terminal colors theme/scheme.
   The format has also been simplified and minimized/reduced to relevant information except the extended `ll` and `llf` aliases.
   Added the new shorthand aliases `lf` and `llf` were added for a flattened output without topic commits from merges and adapted the style to the existing `lnew` and `lch` aliases. The `lr` alias is now superfluous and has been removed due to the new `ll` and `llf` aliases which include the relative date of a commit.

4. **Long GPG `keyid` format for Git configuration** #50 ⇄ #54 (⊶ a4065f5d)
   ↠ The GPG [`keyid-format`][gpg-docs-conf_opts] has been changed from `short` to `long`.

5. **Adapted Git commit message template to style guide** #51 ⇄ #55 (⊶ 272d1bff)
   ↠ The Git commit message template content was outdated and has been updated to adapt to the new [Git Style Guide][arcticicestudio/styleguide-git].

6. **Transparent Git encryption using GPG** #64 ⇄ #69 (⊶ 32c24ceb)
   → **Replaced by #113 ⇄ #114 later on!**
   ↠ Added a global `.gitattributes` file and configured the global `.gitconfig` file to apply a transparent git encryption with `smudge` and `clean` filters using [GPG].
   In the `.gitattributes` file, a filter for all `*.igloocrypt` file extensions was set. The `.gitconfig` now includes the filter configuration by using `gpg` for the encryption and decryption, processing files just before they‘re checked out and just before they’re staged. Also see GitHub _Gist_ [“Transparent Git encryption with `smudge` & `clean` filters using GPG“][gist-git_smudge_clean] for more details.
   ![](https://git-scm.com/book/en/v2/images/smudge.png)
   ![](https://git-scm.com/book/en/v2/images/clean.png)
   6.1 **Migration to `git-crypt`** #113 ⇄ #114 (⊶ 4bb0d48e)
   ↠ In #64 the concept was described as a simpler and cleaner solution instead of adding a using a tool like [git-crypt][] with the reason that this would make the encryption usage dependent on an external tool and also commits additional files to the repository like the `.git-crypt` folder in the root of the repository. It was also documented that such tools are really useful and necessary when the repository is used by many collaborator, but only adds overhead for personal _dotfile_ repositories.
   Anyway, the transparent Git encryption introduced to [GPG] encrypt specific files using the `smudge` and `clean` filters only worked reasonably well with various problems, e.g. caused files to be flagged as „dirty“ (modified) after checkout even if there have been no changes. The pure Git builtin solution with filters was chosen to prevent dependence to external tools, but the latest release versions of Git causing more and more problems due to changes in the behavior e.g. [how `git diff` works][git-docs-diff] (also causing `diff-so-fancy` to be broken).
   Therefore the previously implemented solution has been removed again and, against contrary to the opinion in #64, migrated to use [git-crypt][] instead. Even if this added additional files to the repository as well as the external dependency to the tool itself, `git-crypt` is a stable and production proven concept that works safely and allows to really use a transparent encryption.
   After playing around and testing `git-crypt` locally the resulting migration steps were as follows:

   - **1** Deleted the custom [`git-diff-igloocrypt`](https://github.com/arcticicestudio/igloo/blob/8e47b174e586694bf4e882575b1931bbd27013d7/snowblocks/git/git-diff-igloocrypt) script.
   - **2** Removed the custom [`[diff "igloocrypt"]`](https://github.com/arcticicestudio/igloo/blob/8e47b174e586694bf4e882575b1931bbd27013d7/snowblocks/git/gitconfig#L57-L58) section from the `gitconfig` file.
   - **3** Removed the custom filter [`"igloocrypt"`](https://github.com/arcticicestudio/igloo/blob/8e47b174e586694bf4e882575b1931bbd27013d7/snowblocks/git/gitconfig#L73-L75) from the `gitconfig` file.
   - **4** Updated the `filter` and `diff` custom global Git attributes handler for all `*.igloocrypt` files to the new `git-crypt` setup.
   - **5** Decrypted all `*.igloocrypt` files and backup them up outside the repository.
   - **6** Deleted all `*.igloocrypt` files within the repository.
   - **7** Initialized `git-crypt` for the repository: `git-crypt init` (default key).
   - **8** Added the main Arctic Ice Studio GPG key: `git-crypt add-gpg-user -n <ID>` (`-n` flag prevents automatic commit of generated files).
   - **9** Committed the newly generated `.git-crypt` folder.
   - **10** Unlocked the repository: `git-crypt unlock`.
   - **11** Added all backed up `*.igloocrypt` files back into the repository.
   - **12** Ensured all `*.igloocrypt` are tracked to be encrypted: `git-crypt status`.
   - **13** Committed all `*.igloocrypt` files.
   - **14** Validated the encryption works by locking the repository again: `git-crypt lock`.

7. **Revised commit message template** #26 (⊶ 8eee3520)
   ↠ The Git commit message template contained an deprecated format and have been rewritten from scratch to match the new Arctic Ice Studio [Git Style Guide][arcticicestudio/styleguide-git].

8. **`diff-so-fancy` compatible `format-patch` alias** #84 ⇄ #87 (⊶ b9437b57)
   ↠ Added a new `fp` ("_format patch_") alias to fix a output problem when using [diff-so-fancy][] with the the `format-patch` command which also prints the ANSI color sequences. This is now prevented by using the `--no-color` option of `git diff`.
   The alias now also contains the `--patch-with-stat` option to add additional patch stats like the total amount of changed/removed lines.

9. **`diff-so-fancy` for `git add` interactive/patch mode** #63 ⇄ #91 (⊶ 82d8cfd9)
   ↠ Git [2.14.0][git-rln-2.14.0] includes a restructuring of `diff-highlight` (_contrib/_) for a easier reuse by [diff-so-fancy][]. `diff-so-fancy` for the `git add` interactive/patch mode is now used for the `interactive.diffFilter` configuration. Also the [so-fancy/diff-so-fancy#35 (comment)][so-fancy/diff-so-fancy#35-c] for more details.
   Also see the following related changes:

   - **Temporary replace `diff-so-fancy` with bundled `diff-highlight`** #125 (⊶ 535cb0a6)
     → See [so-fancy/diff-so-fancy#35][] and [so-fancy/diff-so-fancy#296][] for more details.
     ↠ The reason are incompatibility problems of [diff-so-fancy][] with the latest Git versions caused by changes in the diff logic.

   ```raw
   fatal: mismatched output from interactive.diffFilter
   hint: Your filter must maintain a one-to-one correspondence
   hint: between its input and output lines.
   ```

   **NOTE**: Downgrading to a compatible Git version is not an option because [versions <2.17.1 are effected by _CVE-2018-11233_ and and _11235_][git-rln-2.17.1#cve].
   To fix this problem for [interactive patch mode](https://github.com/arcticicestudio/igloo/blob/bb19634544f91c26d66e1f7f53a6bf06210fbaaf/snowblocks/git/gitconfig#L214-L220) the filter was temporary changed to the official [diff-highlight][] tool bundled with Git.

   ```diff
   [interactive]
   -  diffFilter = diff-so-fancy
   +  diffFilter = diff-highlight
   ```

10. **Host specific and encrypted user configurations** #93 ⇄ #94 (⊶ 1b564fc5)
    ↠ The [`gitconfig_auth`](https://github.com/arcticicestudio/igloo/blob/develop/snowblocks/git/gitconfig_auth) file was previously linked for all hosts and were limited to the hosts `igloo` and `archbook`. Also the `gitconfig_auth_job` file [was ignored](https://github.com/arcticicestudio/igloo/blob/develop/.gitignore#L8) and has been added in encrypted `.igloocrypt` format to the _snowblock_.
    Also see the following related changes:

    - **Fixed invalid file symlink targets for Git authentication configurations** #116 (⊶ 6cb11653)
      ↠ The Git authentication configurations were updated to be encrypted, but the targets for the symlinks configured within the `snowblock.json` have not been updated to match this change.

11. **Autocorrect command typos** #150⇄ #157 (⊶ 19a89e2a)
    ↠ The [`help.autocorrect`][git-docs-conf#autocorr] configuration allows to run auto-corrected commands with a specified delay time (seconds) after the info message has been shown. This has been added and set to a value of `10` (1 second).

12. **Git alias to list commits ahead/behind tracking branch** #180 (⊶ 545df096)
    ↠ Before only the `lnew` alias was available to list commits behind [`ORIG_HEAD`][git-docs-revs] which only worked after a solved merge conflict. This was not very useful and has been replaced by two new aliases:

    - `lahead` — Lists all commits the current branch is ahead of the tracked origin branch that have not been pushed yet.
    - `lbehind` — Lists all ahead commits of the tracked origin branch that are not merged into the current branch yet.

13. **Fixed invalid exit code handling for IntelliJ `mergetool`** #206 (⊶ 81734203)
    ↠ When using IntelliJ as `mergetool` and setting `mergetool.intellij.trustExitCode` to `true`, the `mergetool.intellij.cmd` gets called for all files immediately. After IntelliJ gets closed for the first processed file, all other calls will error because the temporary files passed to `idea merge` as parameters are not valid anymore causing the app to exit.
    The problem was that Git is not able to interpret or track started IntelliJ process and fails to listen for the exit code, causing the calls to be fired immediately. This problem was narrowed down to macOS while it works fine for Linux systems. See the [official Git documentation about the `mergetool` command][git-docs-mergetool] for more details.
    To fix the problem the `mergetool.intellij.trustExitCode` option was set to `false` and `mergetool.intellij.prompt` to `true` to force Git to wait for the user to confirm the merge is completed and the app window has been closed before continuing with the next queued file.
    The only impact is that it requires to press `y` or `n` after solving a conflict instead of only closing the app window and waiting for it to reopen again for the next file. This is also limited to macOS so the impact is very small compared to the broken state when not applying the fix.
    In order to dynamically apply the configurations only for macOS systems a `[include]` block is used and set the path to a additional file that will only be linked by _snowsaw_ for macOS based hosts.
    Note that the `include` statement/block **must be placed at the bottom** of the main Git configuration file in order to override the initial/default block!

14. **Git alias for _squash_ merging** #208 (⊶ 78ccf4c7)
    ↠ Before only the `m` alias was available to merge the specified branch in non-fast-forward mode. To do a ["squash" merge][ghh-prs#squash] a new `ms` alias has been added using the default fast-forward mode.

15. **Replaced/Updated `archbook` with new `iceowl` host** #143, #131 (⊶ c08ca24c)
    ↠ There were [various _snowblock_/_snowflake_ configurations that contained the `archbook` host](https://github.com/search?l=&q=archbook+repo%3Aarcticicestudio%2Figloo+created%3A%3E2018-09-18&type=Code) which doesn't exist anymore and has been replaced in most cases with the new `iceowl` host. In cases where the _snowblock_/_snowflake_ is only targeted for Linux the `archbook` host has been removed to make it independent from the host. They can be updated when a new Linux host might be introduced.

### Vim — #3 (⊶ 3e5b053c)

↠ Initially `snwoblocks/vim` for [Vim][] provided the following files & directories linked to their destination:

- `vimrc` → `~/.vimrc`

Over the time the `vim` _snowblock_ evolved through the following changes:

1. **Paste toggle key mapping** #16 (⊶ 57e84f59)
   ↠ Added `<F3>` key as toggle for the [`pastetoggle`][vimdoc-opts#pastetoggle] option.

2. **Automatically wrap left and right** #22 ⇄ #30 (⊶ 60895adc)
   ↠ Allowed to move the cursor to the previous/next line after reaching first/last character in the line using the the left <kbd><</kbd> and <kbd>></kbd> arrow keys in normal-, insert- (`<,>`) and visual mode (`[,]`) or the <kbd>h</kbd> and <kbd>l</kbd> keys. This is configured through the `whichwrap` variable. See `:help whichwrap` for more details.

3. **Key mapping to move current line and selected block** #21 ⇄ #31 (⊶ ed36f3b9)
   ↠ Added a key mapping that allows to easily move the current line or selected block(s) using the <kbd>Ctrl</kbd> and the _up_ <kbd>⇧</kbd> and _down_ <kbd>⇩</kbd> keys. The moved line/block adapts to the new indentation and is available in the `NORMAL`, `INSERT` and `VISUAL` modes.

4. **Auto toggle sign column** #32 ⇄ #33 (⊶ e08a7767)
   ↠ Vim 8 introduced a new option to configure the state of the sign column to be always visible (`yes`), always hidden (`no`) or to automatically toggle (`auto`) when signs are available to display.
   This improvement is related to the warning message added to [airblade/vim-gitgutter@dc73a81][] which also advises to remove the custom option `g:gitgutter_sign_column_always = 1` and use `set signcolumn = auto` instead, described by the plugin owner in [airblade/vim-gitgutter#431 (comment)][airblade/vim-gitgutter#431-c-sigcol]. Also see `:help signcolumn` for more details.

5. **Remap syntax highlighting function** #36 ⇄ #39 (⊶ 474b9b90)
   ↠ The `<C-S-P>` mapping for the function to show the syntax highlighting groups for the current cursor position collided with the AUR package [plotinus-git][aur-plotinus-git] which provides a searchable command palette in every modern GTK+ application. Is uses the commonly known <kbd>Control</kbd> + <kbd>Shift</kbd> + <kbd>P</kbd> key mapping. The terminal emulator [Tilix][] is a GTK3 application so the command bar is available and has a higher priority as the mapping for the function.
   The key mapping for the function was changed to use the <kbd>K</kbd> key instead of <kbd>P</kbd>.

6. **Enable 24bit true color support** #37 ⇄ #40 (⊶ 54c35959)
   ↠ The `termguicolors` option has been added to enable support for [24bit true colors][gist-term_colors]. This is necessary to use the Nord Vim _Custom Comment Brightness_ theme feature which makes use of HEX defined colors.**NOTE**: This change has been made obsolete later due to the deprecation of the _comment contrast_ option in _Nord Vim_ through the following change: **Comment Color Brightness** [arcticicestudio/nord-vim#145][] ⇄ [arcticicestudio/nord-vim#146][] (⊶ [arcticicestudio/nord-vim@9e0249ca][])

7. **Markdown plugin `plasticboy/vim-markdown`** #38 ⇄ #41 (⊶ c2d9cb4a)
   ↠ The [plasticboy/vim-markdown][] plugin extends the syntax highlighting support and provides additional features compared to the default syntax definitions.
   Also see the following related changes:

   - **Remove Markdown plugin plasticboy/vim-markdown"** #129 (⊶ ff85c3d0)
     ↠ Removed the [plasticboy/vim-markdown][plasticboy/vim-markdown] plugin (added in #38) again. The default Markdown syntax has been updated and now also supports many (non-standard) Markdown extensions while the plugin causes some compatibility problems.

8. **Replace unmaintained vim-coloresque plugin** #42 ⇄ #46 (⊶ c70a440a)
   ↠ The [gko/vim-coloresque][] was not actively developed anymore and conflicted with other plugins and has therefore been replaced with the active fork [ap/vim-css-color][].

9. **Add `vim-livedown` plugin** #45 ⇄ #47 (⊶ 39480637)
   ↠ The [shime/vim-livedown][] plugin adds support for [Livedown][] (Live Markdown Previews) for Vim.
   It requires the [`livedown`][npm-livedown] NPM package to be **globally** available!

10. **JSX syntax highlighting and indentation plugin** #44 ⇄ #48 (⊶ e940c244)
    ↠ The [mxw/vim-jsx][] plugin adds syntax highlighting and indenting support for JSX. It is **not a standalone JavaScript plugin** and must be used with a base JS highlighter and integrates with the currently used and recommended [pangloss/vim-javascript][] plugin (vim-jsx's "official" dependency).
    The `g:jsx_ext_required` configuration has been set to `0` to also enable JSX syntax highlighting in `.js` files.

11. **Remove default enabled "list" option** #72 ⇄ #73 (⊶ 6c823718)
    ↠ Before the `list` option was enabled by default, but has been disabled due to problems when using copy & paste within _Vim_ with OS- or terminal emulator specific functionalities.

12. **"NERD Commenter" plugin** #71 ⇄ #75 (⊶ 4ab5c4be)
    ↠ Added the [NERD Commenter][nerdcommenter] plugin that configures hotkeys to dynamically comment with language syntax awareness.
    The `NERDSpaceDelims` config has been enabled to automatically add spaces after comment delimiters.

13. **macOS compatibility for line- and block movement keymappings** #172 (⊶ 59a5cc50)
    ↠ The key mappings implemented in #31 worked fine on Linux systems, but conflicted with a global (non-modifiable) system key mapping on macOS. Therefore a condition check for the currently running environment is now used to set other specific key mappings for macOS and Linux.

### Bash — #4 (⊶ 0b664c78)

↠ Initially `snwoblocks/bash` for [Bash][] provided the following files & directories linked to their destination:

- `bootstrap` → `~/.bash_profile`
- `bootstrap` → `~/.bashrc`

Over the time the `bash` _snowblock_ evolved through the following changes:

1. **Fixed invalid logging directory creation** #5 (⊶ 374f7b7b)
   ↠ Removed the remaining code fragment from the old bash framework version causing a `/.log directory can not be created: Permission denied` error message during the bootstrap process.
   The `__snowblock_bash::setup_history()` function now also only creates the `.log` directory if it does not exists yet to avoid possible errors.

2. **`dircolors` color theme** #6 (⊶ 6ab88b9d)
   ↠ Added a `dircolors` package configuration to load the `~/.dir_colors` color theme on initialization.

3. **Fix invalid filename for local `igloo` environment configuration** #7 (⊶ 250bb72e)
   ↠ The local untracked environment configuration file `igloo.local` was not sourced caused by the wrong filename [`igloo.env.local`](https://github.com/arcticicestudio/igloo/commit/802258472da1afc0089cdef2a0bd22d9b51718a4#diff-76276899e039b7f3458a2bd0590d2ec8R27) in the [`igloo`](https://github.com/arcticicestudio/igloo/blob/develop/snowblocks/bash/config/env/igloo#L27#L28) environment configuration file.

4. **Java package specific environment variable `_JAVA_AWT_WM_NONREPARENTING`** #8 (⊶ ccdf6144)
   ↠ The environment variable `_JAVA_AWT_WM_NONREPARENTING` has been placed in the specific [`java`](https://github.com/arcticicestudio/igloo/blob/develop/snowblocks/bash/config/pkg/java) package configuration instead of the main [`igloo`](https://github.com/arcticicestudio/igloo/blob/develop/snowblocks/bash/config/env/igloo#L22) environment configuration file.

5. **Optimized base dir- and module name detection functions** #9 (⊶ c3e9a792)
   ↠ The functions to initialize the `$SNOWBLOCK_BASH_BASE_DIR` environment variable and to get the name of the currently running module were unnecessary complicated, unstable and contained duplicated code.

6. **Renamed environment `illuvigaq` to `igloo`** #10 (⊶ f0856f32)
   ↠ The `illuvigaq` environment has been finally renamed to `igloo`. The env configuration [`illuvigaq`](https://github.com/arcticicestudio/igloo/blob/develop/snowblocks/bash/config/env/illuvigaq) symlinked to [`igloo`](https://github.com/arcticicestudio/igloo/blob/develop/snowblocks/bash/config/env/igloo) is not used anymore.

7. **`sudo` package configuration** #12 (⊶ d605816d)
   ↠ Added a package configuration for [`sudo`](https://www.sudo.ws). The `SUDO_PROMPT` environment variable has been set to highlight the word "sudo" with a light background and a dark front followed by `$USER@$HOSTNAME` colorized with bluish _Nord_ colors.
   Also see the following related changes:

   - **Core alias `sudo` for alias expansion** #15 (⊶ dad96f29)
     ↠ Added a new `sudo` core alias to fix alias expansion when running a user alias via `sudo`.
     _bash_ only checks the first word of a command for an alias, any words after that are not checked. That means in a command like `sudo pacman`, only the first word (`sudo`) is checked by _bash_ for an alias while `pacman` is ignored. This can be changed by adding a space to the end of the alias value so _bash_ checks the next word after the alias.
     Snippet of the official [bash manual][bash-docs-alias]:

     > The first word of each simple command, if unquoted, is checked to see if it has an alias. If so, that word is replaced by the text of the alias.
     > If the last character of the alias value is _blank_, then the next command word following the alias is also checked for alias expansion

     More information and this alias can also be found in the [Arch Linux Wiki for `sudo`][archw-sudo].

8. **Core alias for _Spring Boot Remote Debugging_ via Maven** #13 (⊶ 0aecbe39)
   ↠ Added a new `sbrd` core alias to remote debug Spring Boot applications.
   **JDK 5** or higher should use the`-agentlib` option instead of `-Xdebug -Xrunjdwp` (Java Debug Wire Protocol): `-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=9999"`
   Arguments can be appended via `-Drun.jvmArguments` and commands for Maven to run the Spring Boot Application via `mvn spring-boot:run`: `mvn spring-boot:run -Drun.jvmArguments="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=9999"`

9. **Auto-detect installed _Ruby_ version for `PATH` concatenation** #17 (⊶ 6b0f8e2b)
   ↠ Before all _Ruby_ gem paths (`~/.gem/ruby/*/bin`) for each version had to be added to the `$PATH_RUBY_GEMS` variable in the [`igloo`](https://github.com/arcticicestudio/igloo/blob/develop/snowblocks/bash/config/env/igloo) env config manually.
   This has been changed to detect installed versions, add it to an array and append it to the `$PATH_RUBY_GEMS` variable separated with a colon (`:`).

10. **`gulp` package configuration** #18 (⊶ 6b0f856f)
    ↠ Added a package configuration for [gulp](http://gulpjs.com) to enable shell completions [provided by `gulp`][gulp-cli#compl].
    Also see the following related changes:

    - **Removed `gulp` package configuration** #145 (⊶ 83bbc253)
      ↠ [Gulp][] was not used anymore and has therefore been replaced with [Webpack][] or by simply using scripts or [npm scripts][npm-docs-scripts]. Therefore the [gulp](https://github.com/arcticicestudio/igloo/blob/c1fdba9e6554a4c1cdff32618ddafd700bc1a4cc/snowblocks/bash/config/pkg/gulp) package configuration has been removed. This also improves the shell startup time since the auto-completion script of `gulp` is not sourced anymore.

11. **Cleaned up _Java_ package config docs** #19 (⊶ 2696ed05)
    ↠ Updated references, remove unnecessary double quotes and cleaned up indentations.

12. **Removed local Ruby and NPM modules from `PATH`** #52 ⇄ #56 (⊶ 900a6b2e)
    ↠ Global _Ruby_- and _NPM_ packages should be installed to the default paths instead of customized paths to increase the overall compatibility and adapt to general conventions.
    The `PATH_NPM_PACKAGES` and `PATH_RUBY_GEMS` variables were therefore obsolete and have been removed from `PATH`.

13. **Add `GRADLE_OPTS`** #86 ⇄ #89 (⊶ bffaf260)
    ↠ Created a package configuration for [Gradle][] to set and export global default options using the [`GRADLE_OPTS`][gradle-docs-env#opts] environment variable. It includes

    - `org.gradle.daemon=true` - Enable to always use the Gradle daemon to run builds.
      Since Gradle 3.0, the daemon is [enabled by default][gradle-docs-rln-3.0#daemon] and is recommended for running Gradle.
    - `org.gradle.console=rich` - Always colorize console output.

14. **Alias for file/directory mode bits (attributes) in octal notation format** #86 ⇄ #88 (⊶ d20e4d20)
    ↠ Added a new `lsm` ("_list modes_") alias for the `stat` command to show [file/directory mode bits (attributes)][wiki-fs_perms] in the octal notation format.

15. **Using `diff-so-fancy` without _Git_** #61 ⇄ #90 (⊶ 08cbbc4c)
    ↠ [diff-so-fancy][] has been designed to work within Git controlled directories. To allow to use it to compare files that are not controlled by Git the `--no-index` option of `git-diff` can be used.
    The implemented script pipes the output to `less` using the options

    - `-R, --RAW-CONTROL-CHARS` to only display ANSI "color" escape sequences in "raw" form.
    - `-F, --quit-if-one-screen` to automatically exit if the entire file can be displayed on the first screen.
    - `-X, --no-init` to disable sending the _termcap_ (de)initialization strings to the terminal to avoid unnecessary operations like clearing the screen.
    - `-x2, --tabs=n` to use two tab stops.
      Also see [so-fancy/diff-so-fancy#220 (comment)](https://github.com/so-fancy/diff-so-fancy/issues/220#issuecomment-282530252) for more details.

16. **Removed custom `ATOM_HOME` path** #98 ⇄ #102 (⊶ 78042d83)
    ↠ The [`ATOM_HOME` environment variable][atom-docs-custom#home_path_env] was assigned to a custom path for the configuration folder of _Atom_ instead of using the default `~/.atom`. The reason was that the folder was located in a kind of "global application configuration collection folder" on another drive mounted on system start. This has now been deprecated and changed to use the default paths of the installed applications. The `~/.atom` folder is now used for _Atom_ which is located on the main SSD drive instead of using a symlink to the external drive.
    This change also comes with a great performance boost as the read/write capacity of the external drive HDD was of course way slower than the SSD.

17. **Source local `~/.bin` for binaries** #99 ⇄ #103 (⊶ 13d4ec36)
    ↠ If a local `~/.bin` folder exists it is now added to `PATH` to make all included binaries (executable scripts) available.

18. **Shortcut alias for `trash-cli`** #100 ⇄ #104 (⊶ eb5dedb8)
    ↠ Added a new `t` shortcut alias for [trash-cli][trash-cli] to quickly move files and folders into the trash.

19. **Alias for `taskwarrior`** #126 (⊶ 12dc9609)
    ↠ Renamed the previously used `t` alias of [trash-cli][trash-cli] to `trm` to use it for [taskwarrior][] instead.

20. **Alias for `timewarrior`** #127 (⊶ 0cdb1dd2)
    ↠ Added new shortcut aliases for [timewarrior][]:

    - `tw` = `tw summary` - Shortcut to show the summary.
    - `tws` = `timew :ids` - Shortcut to show IDs by default (depends on `alias.tw`).

21. **Package configuration and alias for _Buku_** #128 (⊶ 68e0289a)
    ↠ [Buku][buku] provides the `BUKU_COLORS` environment variable to allow users to define a custom color scheme. It follows the same principle like the `LSCOLORS` environment variables of the BSD `ls` command.
    The five letters represent the colors in ordered form of

    - index
    - title
    - url
    - description/comment/note
    - tag
      See the GitHub repository wiki page about [how to customize colors][buku-wiki-colors] for more details about available letters and their meaning.
      Next to this a shortcut alias `bk` has been added to simplify the command usage.

22. **Environment and auto-completion for `iceowl` host (macOS support)** #146, #131 (⊶ ac9f7bf7)
    ↠ Added a new [environment configuration](https://github.com/arcticicestudio/igloo/tree/83bbc2530dbb21f7e734aaa9e33898d7c4c67d50/snowblocks/bash/config/env) for the new `iceowl` host. Also imported the auto-completion scripts bundled with the Homebrew [git][brew-git] and [bash][brew-bash] forumlas.

23. **Alias for _IINA_** #147 (⊶ 17158a75)
    ↠ Added a new _macOS_ specific `iina` alias for [IINA][] to ensure the [MPV][] specific flags [`--mpv-config-dir`][mpv-doc-config-dir] and `--mpv-watch-later-directory` are always used which contain the paths to the [MPV configuration files][mpv-doc-config-files] and the [_watch-later_ folder][mpv-doc-config-folder-wl] of the [`--save-position-on-quit` feature][mpv-doc-save-pos]. This ensures the _watch-later_ state/position files are always synced with `igloosync` to ensure consitency with other synced hosts like `igloo`.

24. **Shorthand script to open files, paths or URLs** #169 (⊶ dedfd67b)
    ↠ Most OS provide builtin tools to open a file, path or URL with the associated application based on the MIME type. To use a uniform command for it a new script `open` has been implemented.
    When running on Linux it'll use the XDG compliant tool `xdg-open` from [xdg-utils][] while it'll pass through the parameters to the builtin application also called `open` when run on macOS.

25. **Basic _Go_ environment setup** #181 (⊶ ef8c84d4)
    ↠ I started to use [Go][] as my main programming language almost 3 years for everything from CLIs, high performant and lightweight backends/microservices with performance and intercompatibility in mind as well as for daily tools.
    _Go_ comes with a fantastic toolchain that also doesn't require a lot of necessary setups, therefore this basic setup is enough to work efficiently in combination with the awesome [IntelliJ Go plugin][jb-plg-go], a minimal setup for [Vim with the `govim` plugin][govim] and a basic integration for [Go in VS Code][vscode-docs-go].
    I've used the following basic setup:
    - Defined the `GOPATH` environment variable to point to the custom location at `$HOME/.go`. Even though I only use [Go Modules][go-ghwiki-mods] this is required for backwards compatibility, the toolchain as well as the resulting binaries in `$GOPATH/bin`
    - Added `$GOPATH/bin` to `$PATH` for all hosts.

<div align="center"><img src="https://magefile.org/images/gary.svg" width="140" /></div>

26. **Mage package configuration** #192 (⊶ 39069bef)
    ↠ Added a package configuration for [Mage][], a make/rake-like build tool using Go allowing to write plain-old go functions that'll automatically be used as Makefile-like runnable targets. See the [official documentation about environment variables][mage-docs-env] for more information.

    - `MAGEFILE_CACHE` — Changed the path of the directory for the magefile build cache from the default location `$HOME/.magefile` to `/tmp/.magefiles` since there is no need to persist the cache across system restarts.

27. **Fixed determing the exit status of last shell command** #207 (⊶ 6f483af3) by [@xulongwu4][gh-user-xulongwu4]
    ↠ The exit status of the last shell command was not determined at the very beginning of the `compile_prompt` function which caused a wrong code output.

### pacman — #14 (⊶ fa6909c8)

↠ Initially `snwoblocks/pacman` for [pacman][] provided the following files & directories linked to their destination:

- `makepkg.conf` → `~/.makepkg.conf`
- `pacman.conf.igloo`, `pacman.conf.archbook` → `~/.pacman.conf`

The initial implementation also included

- a package configuration for `pacaur` to set the `AURDEST` environment variable.
- the new `STORE_PKGS` environment variable added to the `igloo` and `archbook` environment configurations.
- the shorthand `pacman --config <PATH_TO_CONFIG>` shell alias.
- _pacman_ configurations for the hosts `igloo` and `archbook`.

Over the time the `pacman` _snowblock_ evolved through the following changes:

1. **Everyone loves candies!** #34 ⇄ #35 (⊶ be4d52e0)
   ↠ Enabled [pacman][]'s _candy eating mode_ for progress bars via `ILoveCandy` config boolean. See [`conf.c`](https://git.archlinux.org/pacman.git/tree/src/pacman/conf.c#n483) in _pacman_'s source code for more details.

2. **Replaced/Updated `archbook` with new `iceowl` host** #143, #131 (⊶ c08ca24c)
   ↠ There were [various _snowblock_/_snowflake_ configurations that contained the `archbook` host](https://github.com/search?l=&q=archbook+repo%3Aarcticicestudio%2Figloo+created%3A%3E2018-09-18&type=Code) which doesn't exist anymore and has been replaced in most cases with the new `iceowl` host. In cases where the _snowblock_/_snowflake_ is only targeted for Linux the `archbook` host has been removed to make it independent from the host. They can be updated when a new Linux host might be introduced.

<div align="center"><img src="https://user-images.githubusercontent.com/7836623/29265613-f4300e72-80e1-11e7-986b-8f45b1958c9a.png" width="800" /></div>

3. **Removed ignored pacman packages** #49 ⇄ #53 (⊶ b853ec8c)
   ↠ Before the `harfbuzz`, `harfbuzz-icu` and `gdk-pixbuf2` packages were added to the _pacman_ ignore list to [fix the harfbuzz + _Infinality_ issue](https://gist.github.com/cryzed/e002e7057435f02cc7894b9e748c5671) which caused broken font rendering & boot failures on most systems due to incompatibility with the updated `freetype2` package, which superseded the `infinality-bundle`.
   These packages have now been removed from the ignore list against since the issues have already been fixed some days after the issue occurred.
   Also see the following related changes:
   - **Removed ignored pacman packages for `archbook` host** #53 (⊶ 880b3fac)
     ↠ #53 only removed the ignored packages for the `igloo` host which has now also been ported for `archbook`.

### systemd — #58 (⊶ ab4513b0)

↠ Initially `snwoblocks/systemd` for [systemd][] provided user [service][freedesktop-systemd-srv] and [units][freedesktop-systemd-unit] to

- automount the `sync` [gocryptfs][] volume located in the [Dropbox][] folder receiving the password stored in the [GNOME keyring][archw-gnome-keyring] via `secret-tool` ([`libsecret`][libsec]). The service unit is named `igloosync-dropbox`.
- automatically run a instance of the [`ssh-agent`][archw-ssh_ag] using `$SSH_AUTH_SOCK` and let _systemd_ manage the `$SSH_AGENT_PID` environment variable.

This includes a documentation to describe the requirements for the `igloosync-dropbox.service` file providing information

- about how to create the required `gocryptfs` password stored- and received via `secret-tool`.
- about how to configure [wiki-fuse][] ([libfuse][]) with the `/etc/fuse.conf` file to allow non-root users to specify the `allow_other` or `allow_root` mount options which overrides the security measure restricting file access to the filesystem owner, so that all users (including root) can access the files. This is necessary to access the files of the mounted `gocryptfs` volume with applications that are run via `sudo`. It is used in the `pacman` _snowblock_ for the local package repository to prevent a _Permission Denied_ exception when running `pacman` (e.g. `sudo pacman -Sy`) if the `gocryptfs` volume is not mounted with the `-allow_other` option. Please note that `libfuse` has a **[unresolved security bug][libfuse/libfuse#15]** when using the `allow_other` mount option as [described in the official documentation][libfuse-sec], but is of **little concern if the filesystem is accessible only to the mounting user** which is the case since these are **dotfiles for a personal system**:

> No other user (including root) can access the contents of the mounted filesystem (though this can be relaxed by allowing the use of the `allow_other` and `allow_root` mount options in `/etc/fuse.conf`)
>
> If you intend to use the allow_other mount options, be aware that FUSE has an unresolved [security bug][libfuse/libfuse#15]: if the `default_permissions` mount option is not used, the results of the first permission check performed by the file system for a directory entry will be re-used for subsequent accesses as long as the inode of the accessed entry is present in the kernel cache - even if the permissions have since changed, and even if the subsequent access is made by a different user. This is of little concern if the filesystem is accessible only to the mounting user (which has full access to the filesystem anyway), but becomes a security issue when other users are allowed to access the filesystem (since they can exploit this to perform operations on the filesystem that they do not actually have permissions for).
>
> This bug needs to be fixed in the Linux kernel and has been known since 2006 but unfortunately no fix has been applied yet. If you depend on correct permission handling for FUSE file systems, the only workaround is to use `default_permissions` (which does not currently support ACLs), or to completely disable caching of directory entry attributes.

The target paths `~/.config/systemd/user` for all unit files will be created by _snowsaw_ if they doesn't exist yet.

The `igloosync-dropbox.service` unit file is only linked for the `igloo` and `archbook` hosts while the `ssh-agent.service` file will be linked by default.

Over the time the `system` _snowblock_ evolved through the following changes:

1. **Replaced/Updated `archbook` with new `iceowl` host** #143, #131 (⊶ c08ca24c)
   ↠ There were [various _snowblock_/_snowflake_ configurations that contained the `archbook` host](https://github.com/search?l=&q=archbook+repo%3Aarcticicestudio%2Figloo+created%3A%3E2018-09-18&type=Code) which doesn't exist anymore and has been replaced in most cases with the new `iceowl` host. In cases where the _snowblock_/_snowflake_ is only targeted for Linux the `archbook` host has been removed to make it independent from the host. They can be updated when a new Linux host might be introduced.

### XDG — #74 ⇄ #78 (⊶ 89b68775)

↠ Initially `snwoblocks/xdg` for _XDG_/[freedesktop.org][] specifications provided the following files & directories linked to their destination:

- `user-dirs.conf` → `~/.config/user-dirs.conf`
- `user-dirs.dirs` → `~/.config/user-dirs.dirs`
- `user-dirs.locale` → `~/.config/user-dirs.locale`
- `bookmarks` → `~/.config/gtk-3.0/bookmarks`
- `applications/atom.desktop` → `~/.local/share/applications/atom.desktop`
- `applications/evolution.desktop` → `~/.local/share/applications/evolution.desktop`
- `applications/gpick.desktop` → `~/.local/share/applications/gpick.desktop`
- `applications/gtkhash.desktop` → `~/.local/share/applications/gtkhash.desktop`
- `applications/intellij-idea-ce.desktop` → `~/.local/share/applications/intellij-idea-ce.desktop`
- `applications/intellij-idea-u.desktop` → `~/.local/share/applications/intellij-idea-u.desktop`
- `applications/minecraft.desktop` → `~/.local/share/applications/minecraft.desktop`
- `applications/org.gnome.gedit.desktop` → `~/.local/share/applications/org.gnome.gedit.desktop`
- `applications/org.gnome.Nautilus.desktop` → `~/.local/share/applications/org.gnome.Nautilus.desktop`
- `applications/org.gnome.Screenshot.desktop` → `~/.local/share/applications/org.gnome.Screenshot.desktop`
- `applications/pycharm-community.desktop` → `~/.local/share/applications/pycharm-community.desktop`
- `applications/shotwell-viewer.desktop` → `~/.local/share/applications/shotwell-viewer.desktop`
- `applications/webstorm.desktop` → `~/.local/share/applications/webstorm.desktop`
- `autostart/dropbox.desktop` → `~/.local/share/autostart/dropbox.desktop`
- `autostart/plank.desktop` → `~/.local/share/autostart/plank.desktop`
- `settings.ini` → `~/.config/gtk-3.0/settings.ini`

This includes [freedesktop][]'s _xdg_ specifications for

- user-specific [`.desktop` application files][archw-dfile].
- user-specific [autostart `.desktop` files][freedesktop-autostart].
- [XDG user directories][archw-ud] configurations and document templates.
- [XDG bookmarks][fd-bookmarks]

Over the time the `xdg` _snowblock_ evolved through the following changes:

1. **Removed GNOME Nautilus `.desktop` file** #105 (⊶ 7125312e)
   ↠ The custom `org.gnome.Nautilus.desktop` file isn't necessary anymore since the the missing MIME type handler has been added in the upstream which is necessary to open Nautilus from within other applications to e.g. show a project folder in the file system.

   <div align="center"><img src="https://upload.wikimedia.org/wikipedia/commons/d/d5/IntelliJ_IDEA_Logo.svg?sanitize=true" width="20%" /> <img src="https://upload.wikimedia.org/wikipedia/commons/a/a1/PyCharm_Logo.svg?sanitize=true" width="20%" /> <img src="https://confluence.jetbrains.com/download/thumbnails/51964300/WebStorm_400x400_Twitter_logo_white.png" width="22%" /></div>

2. **Updated and removed obsolete application desktop files** #118 (⊶ f2dffb76)
   ↠ Some XDG application `.desktop` files were not required anymore because the latest upstream versions have been adapted and improved to match the custom configurations:

   - [JetBrains IntelliJ IDEA Ultimate Edition][arch-jb-idea-u] binary `/opt/intellij-idea-ultimate-edition/bin/idea.sh` is now linked to `/usr/bin/idea` and `/usr/bin/intellij-idea-ultimate-edition`. The desktop file is now uniformly named `/usr/share/applications/jetbrains-idea.desktop`.
   - [JetBrains IntelliJ IDEA Community Edition][arch-jb-idea-ce] binary `/opt/intellij-idea-community-edition/bin/idea.sh` is now linked to `/usr/bin/idea`. The desktop file is now named uniform `/usr/share/applications/jetbrains-idea.desktop`.
   - [JetBrains Webstorm][aur-jb-ws] binary `/opt/webstorm/bin/webstorm.sh` is now linked to `/usr/bin/webstorm` and the desktop file is now named uniform `/usr/share/applications/jetbrains-webstorm.desktop`.
   - [JetBrains Pycharm Community Edition][arch-jb-py-ce] binary `/opt/pycharm-community-edition/bin/pycharm.sh` is now linked to `/usr/bin/pycharm`, but the desktop file is still named `/usr/share/applications/pycharm.desktop`.
   - [Atom 1.28][atom-blog-1.28] included an upgrade to Electron 2.0 and now ships with an standalone launcher(`/usr/lib/atom/atom`) instead of using the Electron binary (`electron <BINARY_PATH>`).

3. **Custom _JetBrains IntelliJ IDEA Ultimate_ editor desktop launcher** #203 (⊶ d4f474eb)
   ↠ _IntelliJ IDEA_ version 2019.1.3 came with a new “hardcoded“ icon so the `.desktop` launcher required a customization to use the correct icon theme name.

4. **Custom _KeePassXC_ desktop launcher** #204 (⊶ 6d86a967)
   ↠ [KeePassXC][] supports GTK3 out-of-the-box, but unfortunately doesn't adapted to the current system theme and icon them making the UI looking really unpleasant and outdated.
   To use a modern style the app now starts with the [`QT_QPA_PLATFORMTHEME` environment variable set to `gtk2`][archw-qt#fail_update] to [ensure the app respects the Qt5 style overrides][keepassxreboot/keepassxc#1931].

5. **Replaced/Updated `archbook` with new `iceowl` host** #143, #131 (⊶ c08ca24c)
   ↠ There were [various _snowblock_/_snowflake_ configurations that contained the `archbook` host](https://github.com/search?l=&q=archbook+repo%3Aarcticicestudio%2Figloo+created%3A%3E2018-09-18&type=Code) which doesn't exist anymore and has been replaced in most cases with the new `iceowl` host. In cases where the _snowblock_/_snowflake_ is only targeted for Linux the `archbook` host has been removed to make it independent from the host. They can be updated when a new Linux host might be introduced.

### cower — #65 ⇄ #79 (⊶ 503561de)

↠ Initially `snwoblocks/cower` for _cower_ (rewritten as [auracle][]) provided the following files & directories linked to their destination:

- `config` → `~/.config/cower/config`

### htop — #68 ⇄ #80 (⊶ 952d502b)

↠ Initially `snwoblocks/htop` for [htop][] provided the following files & directories linked to their destination:

- `htoprc` → `~/.config/htop/htoprc`

### plank — #81 ⇄ #82 (⊶ 97e2182b)

↠ Initially `snwoblocks/plank` for [plank][archw-plank] provided the following files & directories linked to their destination:

- `igloo/launchers` → `~/.config/plank/igloo/launchers`
- `archbook/launchers` → `~/.config/plank/archbook/launchers`
- `themes` → `~/.config/plank/themes/igloo`

This includes application launchers for the host specific `igloo` and `archbook` profiles and a minimal, non-obstructive theme called `igloo` with a transparent background and no shadow- and glow effects.

Over the time the `plank` _snowblock_ evolved through the following changes:

1. **Removed GNOME Nautilus `.desktop` file** #118 (⊶ 7125312e)
   ↠ See the changelog section of _XDG_ for more details.

2. **Custom _JetBrains IntelliJ IDEA Ultimate_ editor desktop launcher** #203 (⊶ d4f474eb)
   ↠ See the changelog section of _XDG_ for more details.

3. **Removed _Google Chrome_ from desktop app launcher** #205 (⊶ 1c969ff9)
   ↠ Since the re-switch to Firefox in #139, _Google Chrome_ is only used for compatibility tests for projects like web apps and websites (_React_, _Gatsby.js_ etc.) as well as private session when using web apps especially build for Google Chrome's APIs/web capabilities.

4. **Replaced/Updated `archbook` with new `iceowl` host** #143, #131 (⊶ c08ca24c)
   ↠ There were [various _snowblock_/_snowflake_ configurations that contained the `archbook` host](https://github.com/search?l=&q=archbook+repo%3Aarcticicestudio%2Figloo+created%3A%3E2018-09-18&type=Code) which doesn't exist anymore and has been replaced in most cases with the new `iceowl` host. In cases where the _snowblock_/_snowflake_ is only targeted for Linux the `archbook` host has been removed to make it independent from the host. They can be updated when a new Linux host might be introduced.

### tilix — #70 ⇄ #83 (⊶ 5c12e6cd)

↠ Initially `snwoblocks/tilix` for [Tilix][] provided the following files & directories linked to their destination:

- `bookmarks.json.igloocrypt` → `~/.config/tilix/bookmarks.json`

Also includes a [dconf][] dump of the current system configurations. See [gnunn1/tilix#571][gnunn1/tilix#571] for more details.

Over the time the `tilix` _snowblock_ evolved through the following changes:

1. **Updated and extended bookmarks** #119 (⊶ 962bc284)
   ↠ Updated some paths of bookmarks that were not up-to-date and added some that were missing.

2. **Replaced/Updated `archbook` with new `iceowl` host** #143, #131 (⊶ c08ca24c)
   ↠ There were [various _snowblock_/_snowflake_ configurations that contained the `archbook` host](https://github.com/search?l=&q=archbook+repo%3Aarcticicestudio%2Figloo+created%3A%3E2018-09-18&type=Code) which doesn't exist anymore and has been replaced in most cases with the new `iceowl` host. In cases where the _snowblock_/_snowflake_ is only targeted for Linux the `archbook` host has been removed to make it independent from the host. They can be updated when a new Linux host might be introduced.

### tmux — #66 ⇄ #92 (⊶ 56595bde)

↠ Initially `snwoblocks/tmux` for [tmux][] provided the following files & directories linked to their destination:

- `tmux.conf` → `~/.tmux.conf`

If the _tmux_ plugin manager [tpm][] doesn't exist it will be [downloaded automatically][tmux-docs-autodown].
Also see the [“tmux“ Arch Linux Wiki page][archw-tmux] for more details.

### NPM — #95 ⇄ #96 (⊶ a916aa17)

↠ Initially `snwoblocks/npm` for [NPM][] provided the following files & directories including

- the [`.npmrc` configuration file][npm-docs-rc] to define the [`npm init`][npm-docs-config] options
  - `init-author-name`
  - `init-author-email`
  - `init-author-url`
  - `init-version`
  - `init-license`
- the `package-lock` option with `false` to disable the generation of the [`package-lock.json`][npm-docs-pkg-lock] file.
- the `save-exact` option to always save the exact dependency versions in the [`package.json`][npm-docs-pkg].

Over the time the `npm` _snowblock_ evolved through the following changes:

1. **Enable NPM's package-lock feature** #142 (⊶ 22635a83)
   ↠ The [`package-lock.json`][npm-docs-pkg-lock] file was disabled in the global [`npmrc`][npm-docs-rc] file since it hasn't been used due to a various problems regarding merge conflicts and unintended transitive dependency updates on each `npm install`. These problems have been fixed in later NPM release versions. This allows to use this feature again to ensure stable and reproducible builds.

2. **Replaced/Updated `archbook` with new `iceowl` host** #143, #131 (⊶ c08ca24c)
   ↠ There were [various _snowblock_/_snowflake_ configurations that contained the `archbook` host](https://github.com/search?l=&q=archbook+repo%3Aarcticicestudio%2Figloo+created%3A%3E2018-09-18&type=Code) which doesn't exist anymore and has been replaced in most cases with the new `iceowl` host. In cases where the _snowblock_/_snowflake_ is only targeted for Linux the `archbook` host has been removed to make it independent from the host. They can be updated when a new Linux host might be introduced.

### atom — #106 (⊶ 528383c5)

↠ Initially `snwoblocks/atom` for [Atom][] provided the following files & directories linked to their destination:

- `config.cson` → `~/.atom/config.cson`
- `keymap.cson` → `~/.atom/keymap.cson`
- `project-folder.cson` → `~/.atom/project-folder.cson`
- `packages.cson` → `~/.atom/packages.cson`

This includes

- the main [CSON based condifuration][atom-docs-custom#cson_conf] file
- the [keymapping configuration][atom-docs-keymap] file

Support for the [package-sync][atom-pkg-package-sync] package is provided through the `packages.cson` file including all installed packages. The `project-folder.cson` configuration file for the [project-folder][atom-pkg-project-folder] package contains all necessary group entries.

Over the time the `atom` _snowblock_ evolved through the following changes:

1. **Color Profile** #115 (⊶ dc4d22d6)
   ↠ Atom 1.28 introduced [support for custom ICC color profiles][atom-blog-rln-1.28#color_profile] based on the upgrade to Electron 2.x which in turn is based on the latest Chrome version. This version includes changes to the color rendering and now respects the color profile configured in the OS settings.
   Due to this change for many users the [colors appear to be pale][atom/atom#17356]. To bring back the previous (more stronger) color rendering Atoms _Core_ → „Color Profile“ has been changed from „Use color profile configured in the operating system“ to „Use sRGB color profile“.

   <div align="center"><strong>With OS color profile</strong><br><img src="https://user-images.githubusercontent.com/7836623/45257088-b05fae80-b3a0-11e8-903e-2ad4a41489a4.png" /></div>
   <div align="center"><strong>With sRGB color profile</strong><br><img src="https://user-images.githubusercontent.com/7836623/45257095-d1c09a80-b3a0-11e8-9fc9-7ec0494386ff.png" /></div>

<div align="center"><img src="https://www.rust-lang.org/logos/rust-logo-blk.svg?sanitize=true" /></div>

2. **Rust support: `language-rust` package** #121 (⊶ 11ca4319)
   ↠ Added support for [Rust][] via the [language-rust][atom-pkg-language-rust] community package.

3. **New project paths** #122 (⊶ bb196345)
   ↠ Added groups for the new project paths:

   - **communikey**: `~/code/github/repositories/communicode/*`
   - **NPM**: `~/yggdrasil/npm/*`
   - **snowsaw**: `~/yggdrasil/snowsaw`

4. **Include default package configuration keys** #124 (⊶ 7554efce)
   ↠ Before the configuration keys were initialized with the default value were not added to user's `~/.atom/config.cson`. To ensure the same Atom setup even when some default values are changed these have been included in the `config.cson`. This also includes keys for all core and community packages.

5. **Atom IDE** #151 ⇄ #158 (⊶ 39707355)
   ↠ Added the [Atom IDE][atom-ide] base package [atom-ide-ui][atom-pkg-atom-ide-ui] and the [ide-typescript][atom-pkg-ide-typescript] package for JavaScript (Babel, ES6, React etc.) and Typescript.

6. **Atom IDE - Don't show debugger when setting breakpoints** #166 (⊶ 360f7140)
   ↠ By default, when [setting a breakpoint][nuclide-docs-bp] the [debugger][nuclide-docs-db] was shown automatically. Sometimes this was not the desired goal (e.g. by accidentally setting a breakpoint) and has been disabled.

7. **Keymap to move caret to the end/start of the current line** #167 (⊶ 360fb8b1)
   ↠ To simply move the caret to the end/start of the current line instead of using the <kbd>end</kbd> and <kbd>pos</kbd> keys a new mapping has been added for Linux based OS:
   - **Move to the end of the current line**: <kbd>Ctrl</kbd> (super) + <kbd>alt</kbd> + <kbd>→</kbd>
   - **Move to the start of the current line**: <kbd>Ctrl</kbd> (super) + <kbd>alt</kbd> + <kbd>←</kbd>
     The default mappings <kbd>⌘</kbd> + <kbd>⌥</kbd> + <kbd>←</kbd> / <kbd>→</kbd> for macOS are already provided by default.

### taskwarrior — #107 (⊶ c6534e63)

↠ Initially `snwoblocks/taskwarrior` for [Taskwarrior][] provided the following files & directories linked to their destination:

- `taskrc` → `~/.taskrc`
- `nord.theme` → `~/.task/nord.theme`

This includes the _key=value_ based [`.taskrc` configuration][taskwarrior-docs-conf] file and a [Nord][] based color theme to be included in `.taskrc`.

- **Context** — The [context][taskwarrior-docs-cx] feature is used to separate all public projects and private/job related tasks.
- **UDA (User Defined Attributes)** — The [UDA][taskwarrior-docs-uda] feature is used to create custom attributes to add a assignee, a estimation value and the GitHub issue ID to a task.
- **Reports** — The [reports][taskwarrior-docs-r] feature is used to extend and optimize the task output. The custom report should be set to `default.command` to replace the default `next` report.
- **Aliases** — The config contains aliases to align with the alias workflow of other _snowblocks_ like _bash_ and _Git_. This improves the usability, because there are several commands that start with the same characters making it slower to be used with the auto completion:
  - `a` :arrow_right: `add`
  - `bd` :arrow_right: `burndown.daily`
  - `cx` :arrow_right: `context`
  - `e` :arrow_right: `edit`
  - `ls` :arrow_right: `list`
  - `mod` :arrow_right: `modify`
- **Alternative workflows** — The _Taskwarrior_ workflow is changed later on to use multiple databases per use-case like e.g. one database per project to make better use of the features like _projects_, _tags_ and _context_ with finer grained filters.

Over the time the `taskwarrior` _snowblock_ evolved through the following changes:

1. **Time tracking hooks** #108 (⊶ 2e541f5e)
   ↠ Created two hooks to track the duration a task was active. Both hooks are written in Python 3 and require a Taskwarrior version `>=2.4`.

   - **With `totalactivetime` UDA** — The first hook makes use of a new UDA called `totalactivetime` of type `duration` which stores the total time in seconds. Every time a task gets stopped the value gets added to the old value. To simplify the communication with the [Taskwarrior Hook v2 API][taskwarrior-docs-hooks2] the hook uses the [taskw][pypi-taskw] Python package which provides the bindings for Python.
     **Note: This requires [taskw][pypi-taskw] as a direct dependency and must be installed on the target system!** The package is [available from the AUR][aur-python-taskw].
   - **Taskwarrior integration** — The second hook is a fork from the [official Taskwarrior `on-modify.taskwarrior` hook][timewarrior-hook-on-modify]. It comes bundled with _Taskwarrior_, but can not be used via symlink, because the file is owned by the `root` user which prevents the script from being executed when symlinked.
     The usage of the hook is also [documented in the official Timewarrior docs][taskwarrior-docs-tw_int].

2. **taskopen integration** #110 (⊶ 759fdc69)
   ↠ Integrated [taskopen][] by adding the main [`.taskopenrc` configuration][taskopen#conf] file and aliases to simply adding notes (`an`) and open (`o`) task notes/annotations.

3. **More than one active task** #117 (⊶ 8d013adc)
   ↠ The default _Taskwarrior_ limit of active tasks is one. However, there are many use cases where multiple active tasks must be used, e.g. when working on an GitHub issue and the associated PR which are both handled in separate tasks or when working on tasks that are dependent on other tasks.
   The limited has therefore been increased to allow to use _Taskwarrior_ for such use cases without having to deal with limitation errors.

4. **taskopen workaround support for macOS** #134,#131,#110 (⊶ 47af7adc)
   ↠ The management of installed [Perl modules][cpan-doc-modules] on macOS is not as simple and well thought through like the concept of package managers on Linux systems, e.g. via [pacman][] on [Arch Linux][archlinux]. There are problems when is comes to configuring the runtime path the modules have been installed to even when using the most popular module manager called [cpanminus][]. This causes the [Taskwarrior][] plugin [taskopen][] fail to load because the Perl core module `JSON` can't be found and loaded.
   As a workaround a custom script has been implemented to create and open a attached note of an task:

   1. Use the [`_get`][taskwarrior-doc-api-_get] function of the [Taskwarrior DOM API][taskwarrior-doc-dom-api] to extract any stored piece of information of an task. This allows to receive the [UUID of an task][taskwarrior-doc-ids].
   2. Create a custom `on` (open note) [Taskwarrior alias][taskwarrior-doc-alias] to run the implemented custom script via the `execute` command.

   The logic of the script follows the same like taskopen uses for default notes:

   - Use the [UUID of an task][taskwarrior-doc-ids] as the note filename.
   - Simply pass the file to an editor (in this case [Atom][]) which will…
   - …create a new file if it doesn't exist yet.
   - …open the file if it already exists.

   Note that **this script is not limited to macOS** but can also be used for any other Linux host! It is only necessary to use it on macOS due to the problems described above.

5. **Link whole Taskwarrior "hooks" and "scripts" folders** #201 (⊶ 961293ba)
   ↠ Instead of linking single files from the `hooks` and `scripts` Taskwarrior folders both folders are now linked directly.

6. **Use single VS Code instance to open task notes** #202 (⊶ e9c04c6f)
   ↠ When opening a task note, it is now made sure to add it to the already opened VS Code instance instead of opening a new one by using VS Code's `reuse-window` CLI flag.

7. **Replaced/Updated `archbook` with new `iceowl` host** #143, #131 (⊶ c08ca24c)
   ↠ There were [various _snowblock_/_snowflake_ configurations that contained the `archbook` host](https://github.com/search?l=&q=archbook+repo%3Aarcticicestudio%2Figloo+created%3A%3E2018-09-18&type=Code) which doesn't exist anymore and has been replaced in most cases with the new `iceowl` host. In cases where the _snowblock_/_snowflake_ is only targeted for Linux the `archbook` host has been removed to make it independent from the host. They can be updated when a new Linux host might be introduced.

### timewarrior — #109 (⊶ 15688f30)

↠ Initially `snwoblocks/timewarrior` for [Timewarrior][] provided the following files & directories linked to their destination:

- `timewarrior.cfg.archbook`, `timewarrior.cfg.igloo` → `~/.timewarrior/timewarrior.cfg`
- `nord.theme` → `~/.timewarrior/nord.theme`

This includes the [`timewarrior.cfg` configuration][timewarrior-docs-conf] files for the `igloo` and `archbook` hosts as well as a [Nord][] based [color theme][timewarrior-docs-themes] that is imported imported in the `timewarrior.cfg` file.
The default `day` reports should include the month name and week number.

Over the time the `timewarrior` _snowblock_ evolved through the following changes:

1. **Timewarrior config for iceowl (macOS support)** #144,#131 (⊶ c1fdba9e)
   ↠ Created a new configuration for the new `iceowl` host due to the usage of absolute paths in the configuration previous files of [Timewarrior][]. This requires a configuration per host, e.g. for different paths to the used color theme.

2. **Replaced/Updated `archbook` with new `iceowl` host** #143, #131 (⊶ c08ca24c)
   ↠ There were [various _snowblock_/_snowflake_ configurations that contained the `archbook` host](https://github.com/search?l=&q=archbook+repo%3Aarcticicestudio%2Figloo+created%3A%3E2018-09-18&type=Code) which doesn't exist anymore and has been replaced in most cases with the new `iceowl` host. In cases where the _snowblock_/_snowflake_ is only targeted for Linux the `archbook` host has been removed to make it independent from the host. They can be updated when a new Linux host might be introduced.

### GPG — #130 (⊶ 1f3815e7)

↠ Initially `snwoblocks/gpg` for [GPG][] provided the following files & directories linked to their destination:

- `gpg.conf` → `~/.gnupg/gpg.conf`

This includes the [`gpg.conf`][gpg-doc-conf] configuration file and the [`gpg-agent.conf`][gpg-doc-conf-agent] file for the _gpg-agent_.

### launchd — #133, #131, #58 (⊶ 6cf24792)

↠ Initially `snwoblocks/launchd` for [launchd][] ([FreeBSD Wiki][freebsd-wiki-launchd]) provided the following files & directories linked to their destination:

- `com/arcticicestudio/igloo/launchd/igloosync/com.arcticicestudio.igloo.launchd.igloosync-dropbox.plist` → `~/Library/LaunchAgents/com.arcticicestudio.igloo.launchd.igloosync-dropbox.plist`
- `com/arcticicestudio/igloo/launchd/igloosync/igloosync-dropbox.sh` → `~/Library/LaunchAgents/igloosync-dropbox.sh`

This includes a user agent defining a job to auto-mount the `sync` [gocryptfs][] volume located in the [Dropbox][] folder receiving the password stored in the [macOS Keychain][apple-docs-keychain] via the macOS builtin system CLI tool `security`.
The documentation describes the requirements for the `com.arcticicestudio.igloo.launchd.igloosync` agent. It contains information about dependencies and how to create the required `gocryptfs` password stored- and received via the macOS builtin system CLI tool `security`.

Note that this is a _macOS_ specific _snowblock_ and therefore the `com.arcticicestudio.igloo.launchd.igloosync-dropbox.plist` agent file is only linked for the currently only _macOS_ host `iceowl`.

See the knowledge base at [launchd.info][] for more details as well as the available _man_ pages `launchd(1)`, `launchd.plist(5)` and `security(1)`.

### Docker — #136, #131 (⊶ 0876c2c9)

↠ Initially `snwoblocks/docker` for [Docker][] provided the following files & directories linked to their destination:

- `config.iceowl.json` → `~/.docker/config.json`

This includes `config-<HOST>.json` configuration files where `<HOST>` is the name of the target host. The `iceowl` host has the `credsStore` field with the `osxkeychain` value to ensure the _macOS Keychain_ is used to store tokens instead of saving them as plain text into the config file.

### pip — #141, #131 (⊶ f5d6ff48)

↠ Initially `snwoblocks/pip` for [pip][] provided the following files & directories linked to their destination:

- `pip.conf` → `~/.config/pip/pip.conf`
- `requirements.iceowl.txt` → `~/.config/pip/requirements.txt`

This includes the [`requirements.txt`][pip-docs-requirements] file to track [installed packages][python-docs-install-reqs] and their versions and the [`pip.conf`][pip-docs-config-file] file for user specific configurations.
See the documentation about the [requirements.txt file format][pip-docs-req-file-format] for more details.

### Firefox — #139 (⊶ 505e3407)

↠ Initially `snwoblocks/firefox` for [Firefox][] and [Firefox Developer Edition][firefox-dev-edition] provided the following files & directories linked to their destination:

- `chrome` → `~/.mozilla/firefox/igloo/chrome`, `~/Library/Application Support/Firefox/Profiles/igloo/chrome`
- `containers.json` → `~/.mozilla/firefox/igloo/containers.json`, `~/Library/Application Support/Firefox/Profiles/igloo/containers.json`
- `ignore-dev-edition-profile` → `~/.mozilla/firefox/ignore-dev-edition-profile`, `~/Library/Application Support/Firefox/ignore-dev-edition-profile`
- `profiles.iceowl.ini` → `~/Library/Application Support/Firefox/profiles.ini`
- `profiles.igloo.ini` → `~/.mozilla/firefox/profiles.ini`
- `user.js` → `~/.mozilla/firefox/igloo/user.js`, `~/Library/Application Support/Firefox/igloo/user.js`

This includes…

- …the [`user.js`][mozkb-user.js] file to define and persist almost all preferences for a profile.
- …the [`profiles.ini`][mozkb-profiles.ini] file to configure the name and path of the main profile `igloo`.
- …the `ignore-dev-edition-profile` file to fix [Bugzilla bug 1098986][bugzilla-1098986] that causes Firefox Developer Edition to use the internal default profile regardless of whether another customized profile has been set as default. The problem can be fixed by creating the file within the Firefox application data folder.

- …the `chrome` folder with the [`userChrome.css`][mozkb-userchrome.css] and [`userContent.css`][mozkb-usercontent.css] files to change the Firefox's UI components design and elements within the content.
- …the `containers.json` file of the [Firefox Multi-Account Containers][firefox-addon-multi-acc-cont] to persist the configured containers.
- …the documentation about the setup, tips & tricks and various configurations.

See [pyllyukko/user.js][pyllyukko/user.js] for another _Firefox_ `user.js` configuration file designed to harden browser settings and make it more secure as well as [ghacks-user.js][] which is an ongoing comprehensive `user.js` template for configuring and hardening Firefox privacy, security and anti-fingerprinting.

Over the time the `firefox` _snowblock_ evolved through the following changes:

1. **Disable third-party APIs for more privacy** #153 ⇄ #160 (⊶ e622889b)
   ↠ To improve the privacy some more third-party APIs have been disabled:

   - Set `browser.aboutHomeSnippets.updateUrl` to `""` — Disables third-party API requests on new tab page for snippets widget.
   - Set `browser.newtabpage.directory.source` to `""` — Also improves the privacy by removing requests against third-party APIs.

2. **Fixed tabs not rendered in titlebar** #154 ⇄ #161 (⊶ 9c6a97d1)
   ↠ The `browser.tabs.drawInTitlebar` key is set to `false` which caused the tabs to being rendered in the titlebar.

3. **Disabled fullscreen warning popup** #155 ⇄ #162 (⊶ 924d4953)
   ↠ The fullscreen warning popup has been disabled by setting the `full-screen-api.warning.timeout` key to `0`.

4. **Disabled fullscreen warning popup** #156 ⇄ #163 (⊶ c7c1f898)
   ↠ Moved the badge of the [test pilot][firefox-testpilot-exp-color] addon [Firefox Color][firefox-color] into the overflow menu.

5. **Disabled “Find As You Type“** #164 (⊶ e82e8821)
   ↠ The [“Find As You Type“][mozkb-accesb-typeaheadfind] feature (UI path: _Preferences_ → _General_ → _Browsing_ → _Search for text when you start typing_) has been disabled. It allows to search the current site as soon as a key is pressed instead of requiring to press <kbd>Ctrl</kbd>/<kbd>⌘</kbd> + <kbd>f</kbd>. This is a great accessibility improvement, but unfortunately this often collides with page features like hotkeys e.g. when pressing <kbd>r</kbd> on [Octobox][] to sync the latest notifications or any other site using such features.

6. **Always open bookmarks in a new tab in the background** #165 (⊶ 6826f9cb)
   ↠ By default, opening a bookmark from the sidebar uses the current active tab. The `browser.tabs.loadBookmarksInTabs` has been set to `true` to always open bookmarks in a new tab in the background.

7. **Fixed invalid path for Firefox `user.js` file on macOS** #175 (⊶ eb222438)
   ↠ The path for the custom Firefox [`user.js` file][mozkb-user.js] file was invalid for macOS hosts. It did not contain the `Profiles` directory causing a symlink to a path where the file won't be read by _Firefox_.

8. **“light“ as default UI theme** #224 (⊶ a02a48a1)
   ↠ The builtin “light“ UI theme is now used by default with the “normal“ density. The theme is provided by the bundled `firefox-compact-light@mozilla.org` extension.

9. **Disable automatic crash report sending** #217 ⇄ #229 (⊶ 82bee46a)
   ↠ To improve the privacy and security the automatic sending of crash reports has been disabled by setting `browser.tabs.crashReporting.sendReport` to `false`.

10. **"Standard" option for "Enhanced Tracking Protection" browser privacy preferences** #218 ⇄ #230 (⊶ 379c9659)
    ↠ The _Standard_ option for the [Enhanced Tracking Protection][mozs-enhc_track_protc] (stats are available at `about:protections`) preference comes with good defaults configuration and is therefore used instead of the _Custom_ option to also prevent sites from breaking due to cookie blocking.

11. **“Simple Tab Groups“ add-on** #219 ⇄ #231 (⊶ b279caa1)
    ↠ The [Simple Tab Groups][firefox-addon-stg] add-on allows to „create, modify, and quickly change tab groups” and is a port of one of the best Firefox extensions that were available before _Firefox Quantum_.
    To adapt it the add-on icon has been added to the top bar for quick access and the add-on preferences adjusted.

12. **Enabled more `about:debugging` options by default** #220 ⇄ #232 (⊶ 3f92ab9f)
    ↠ The [`about:debugging` page][mdm-about-debugging] allows to debug processes, tabs and local add-ons. These options are disabled by default and has therefore been enabled in order to extend the ways to debug features.

13. **Automatic page reload for touch simulation in responsive design mode** #222 ⇄ #234 (⊶ 95655f18)
    ↠ When using the [Responsive Design Mode][mdn-tools-resp_design_mode] and the _touch simulation_ gets activated it requires the page to reload in order to work properly. Firefox provides an option to automatically run this task and has now been enabled by default.

14. **Disable automatic execution pause on script exceptions** #221 ⇄ #233 (⊶ 7e0d3175)
    ↠ When the _DevTools_ are opened and an exceptions occurs in any running script, the debugger will be opened and the execution paused. This is kind of annoying for third-party scripts or when the actual goal is not to debug scripts at all and has therefore been disabled.

15. **Show CSS grid line numbers** #223 ⇄ #235 (⊶ 25e05122)
    ↠ To allow to better design and debug [CSS grids][css-tricks-grid_guide] the Firefox _DevTools_ can [visually show the grid line numbers][mdm-inspect-grid#line_num]. This option is disabled by default and has therefore been enabled.

16. **“Inter“ as base sans-serif typeface** #225 ⇄ #236 (⊶ 8ea0ef06)
    ↠ It is currently [required to manually configure the sans-serif typeface based on the running OS](https://github.com/arcticicestudio/igloo/tree/eb222438e6cd93b19c222043570bb7c627ea3e3b/snowblocks/firefox#typeface) due to licensing and the availability of specific font families on different operating systems. Since I use the fantastic [Inter][] typeface family for almost all UI, text and designs it has now also been set as default sans-serif typeface. Inter is open source and therefore system independent and is installed in all of my systems/habitats.

17. **“Soft“ and USB WebAuthn development options** #226 ⇄ #237 (⊶ 87e6b1d0)
    ↠ In order to allow and simplify the development and testing of [WebAuthn][] based apps and websites, the security [options must be set to allow “soft tokens“][webauthn.bin.coffee-ff58].
    Also see the section about [requirements for testing][mozw-sec-webauthn#test_req] of the Mozilla “Security/QA/TestPlans/Web Authentication“ wiki page for more details.

18. **Disable password generation suggestion for password fields** #227 ⇄ #238 (⊶ d8905100)
    ↠ _Firefox_ comes with generally great security features like [Firefox Lockwise][firefox-lockwise], but the [suggestion to generate a new random password when focusing a password field][mozw-toolkit-passman-gen] is kind of annoying and not necessary due to the usage of a password manager that includes a password generator. It has therefore been disabled.

19. **Enable “legacy“ user profile customizations** #228 ⇄ #239 (⊶ d664ea09)
    ↠ [As of Firefox version 69, the `userChrome.css` and `userContent.css` files are not loaded by default anymore][moz-ff-rln-69.0#chrome] in order to improve the performance during browser startup. Also see the documentation about [Firefox breaking changes of `userChrome.css`][userchrome-ff_changes_chrome].
    To achieve the previous behavior, the option to load such “legacy“ files has been enabled again.

### Jetbrains — #137 (⊶ 2fa3d1d5)

↠ Initially `snwoblocks/jetbrains` for [JetBrains][] IDEs and products provided the following files & directories linked to their destination:

- `codestyles/arctic-codestyle.xml` → `~/.IntelliJIdea2018.2/codestyles/arctic-codestyle.xml`, `~/Library/Preferences/IntelliJIdea2018.2/codestyles/arctic-codestyle.xml`
- `inspection/arctic-inspections.xml` → `~/.IntelliJIdea2018.2/inspection/arctic-inspections.xml`, `~/Library/Preferences/IntelliJIdea2018.2/inspection/arctic-inspections.xml`
- `keymaps/arctic-keymap.macos.xml` → `~/.IntelliJIdea2018.2/keymaps/arctic-inspections.xml`, `~/Library/Preferences/IntelliJIdea2018.2/keymaps/arctic-keymap.macos.xml`
- `options/code.style.schemes.xml` → `~/.IntelliJIdea2018.2/options/code.style.schemes.xml`, `~/Library/Preferences/IntelliJIdea2018.2/options/code.style.schemes.xml`
- `options/colors.scheme.xml` → `~/.IntelliJIdea2018.2/options/colors.scheme.xml`, `~/Library/Preferences/IntelliJIdea2018.2/options/colors.scheme.xml`
- `options/customization.xml` → `~/.IntelliJIdea2018.2/options/customization.xml`, `~/Library/Preferences/IntelliJIdea2018.2/options/customization.xml`
- `options/editor.codeinsight.xml` → `~/.IntelliJIdea2018.2/options/editor.codeinsight.xml`, `~/Library/Preferences/IntelliJIdea2018.2/options/editor.codeinsight.xml`
- `options/editor.xml` → `~/.IntelliJIdea2018.2/options/editor.xml`, `~/Library/Preferences/IntelliJIdea2018.2/options/editor.xml`
- `options/ide.general.xml` → `~/.IntelliJIdea2018.2/options/ide.general.xml`, `~/Library/Preferences/IntelliJIdea2018.2/options/ide.general.xml`
- `options/keymap.xml` → `~/.IntelliJIdea2018.2/options/keymap.xml`, `~/Library/Preferences/IntelliJIdea2018.2/options/keymap.xml`
- `options/laf.xml` → `~/.IntelliJIdea2018.2/options/laf.xml`, `~/Library/Preferences/IntelliJIdea2018.2/options/laf.xml`
- `options/options.xml` → `~/.IntelliJIdea2018.2/options/options.xml`, `~/Library/Preferences/IntelliJIdea2018.2/options/options.xml`
- `options/project.default.xml` → `~/.IntelliJIdea2018.2/options/project.default.xml`, `~/Library/Preferences/IntelliJIdea2018.2/options/project.default.xml`
- `options/ui.lnf.xml` → `~/.IntelliJIdea2018.2/options/ui.lnf.xml`, `~/Library/Preferences/IntelliJIdea2018.2/options/ui.lnf.xml`
- `disabled_plugins.txt` → `~/.IntelliJIdea2018.2/disabled_plugins.txt`, `~/Library/Preferences/IntelliJIdea2018.2/disabled_plugins.txt`

These are important configurations for all used _JetBrains_ IDEs and products which are currently [IntelliJ][] (Ultimate Edition) and [GoLand][]. For details about the paths see the documentation about [directories used by the IDE to store settings, caches, plugins and logs][jb-docs-settings_paths].

It includes…

- …the [code style][jb-docs-code-style] XMl configuration file stored in the `codestyles` folder.
- …the [inspections][jb-docs-inspections] XMl configuration file stored in the `inspections` folder.
- …the [keymaps][jb-docs-keymap] XMl configuration files for Linux and macOS stored in the `keymaps` folder.
  See the [keymap reference][jb-docs-keymap_refs] for a visual presentation of the default mappings.
- …the [preferences][jb-docs-prefs] XMl configuration files stored in the `options` folder:
  - `code.style.schemes.xml` - settings of the currently used code style.
  - `colors.scheme.xml` - settings of the currently used color scheme.
  - `customization.xml` and `project.default.xml` - settings of the customized [menus and toolbars][jb-docs-menu_toolbar].
  - `editor.codeinsight.xml` - settings of various automatic code transformations.
  - `keymap.xml` - the currently used keymap.
  - `laf.xml` and `ui.lnf.yml` - settings of the currently used UI theme.
  - all other customized preferences defined in the various categories: `editor.xml`, `ide.general.xml` and `options.xml`
- …the list of [disabled plugins][jb-docs-plugins] stored in the `disabled_plugins.txt` file.

Since _JetBrains_ uses a naming scheme for user configuration folders based on the product major/minor version it is necessary to update the _snowblock_ as soon as the product gets updated to adapt to the new version string.
Due to this naming scheme for the target path of previous targets should be kept for the `clean` and `link` tasks to ensure these are cleaned up after updating to a new product version.

Over the time the `jetbrains` _snowblock_ evolved through the following changes:

1. **IntelliJ 2018.3.5** #182 (⊶ 7e270eb0)
   ↠ Before the target version was _IntelliJ 2018.2_ which has been updated to the latest version _IntelliJ 2018.3.5_. This includes new configurations as well as the obligatory adjustment for the correct target paths `~/.IntelliJIdea2018.3` (Linux) and `~/Library/Preferences/IntelliJIdea2018.3` (macOS).

2. **IntelliJ IDEA 2019.1** #193 (⊶ d5ac5d06)
   ↠ Updated the previously used target version _IntelliJ 2018.3_ to the latest version [IntelliJ 2019.1][jb-blog-intellij_2019.1]. This includes the obligatory adjustment for the correct target paths `~/.IntelliJIdea2018.3` (Linux) and `~/Library/Preferences/IntelliJIdea2018.3` (macOS).
   Also removed the disabled [CVS][] and [TFS][wiki-tfs] plugins since they are [no longer officially supported and not bundled with IntelliJ IDEA anymore][jb-blog-unbundle_tfs_cvs_plug].

3. **No _Go_ package clipboard detection** #194 (⊶ a3d062a5)
   ↠ Disabled the detection of _Go_ packages fom the clipbaord, e.g. GitHub URLs, to avoid the noise of notifications/popups that asks to install the package as well as improving privacy during the usage of _JetBrains_ products. There is absolute no need to `go get` since Go 1.11+ is used with [_Go Modules_][go-ghwiki-mods].

4. **`goimports` for _Go_ import auto formatting** #195 (⊶ 8a02ae76)
   ↠ To improve the formatting and adhere to _Arctic Ice Studio_'s _Go_ code style [`goimports][godoc-x-tools-cmd-goimports] is now used to automatically format imports:

   - Only use one import declaration.
   - Use of the `-local` flag to put imports local imports after 3rd-party packages.
   - Move all stdlib imports into one group.
   - Sort all imports.

5. **IntelliJ IDEA 2019.2** #211 (⊶ 007a3c8c)
   ↠ Updated the previously used target version _IntelliJ 2019.1_ to the latest version [IntelliJ 2019.2][jb-blog-rln-2019.2]. This includes the obligatory adjustment for the correct target paths `~/.IntelliJIdea2019.1` (Linux) and `~/Library/Preferences/IntelliJIdea2019.1` (macOS).
   Also see _JetBrains_ [“What's New“][jb-new-2019.2] page for a summary of the largest changes and features.

6. **Fixed invalid JetBrains symlink target parent paths on Linux hosts** #212 (⊶ 86a06411)
   ↠ On macOS the _JetBrains_ configuration files are placed right into the main `IntelliJIdea2019.2` directory while on Linux based systems the folder consists of the sub-folders `cache`, `config` and `system` that can also be configured in the `idea64.properties` file.
   Before the target path was also the main `~/.IntellihJIdea2019.2` directory, but files must be linked into the nested `config` folder instead.

7. **IntelliJ IDEA 2019.3** #216 (⊶ 2623363e)
   ↠ Updated the previously used target version _IntelliJ 2019.2_ to the latest version [IntelliJ 2019.3][jb-blog-rln-2019.3]. This includes the obligatory adjustment for the correct target paths `~/.IntelliJIdea2019.2` (Linux) and `~/Library/Preferences/IntelliJIdea2019.2` (macOS).
   Also see _JetBrains_ [“What's New“][jb-new-2019.3] page for a summary of the largest changes and features.

### Visual Studio Code — #179 (⊶ 8cebb084)

↠ Initially `snowblocks/visual-studio-code` for [Visual Studio Code][vscode] provided the following files & directories linked to their destination:

- `css` → `~/.vscode/css`
- `workspaces` → `~/.vscode/workspaces`
- `keybindings.json` → `~/.config/Code/User/keybindings.json`, `~/Library/Application Support/Code/User/keybindings.json`
- `locale.json` → `~/.config/Code/User/locale.json`, `~/Library/Application Support/Code/User/locale.json`
- `projects.json` → `~/.vscode/projects.json`
- `settings.json` → `~/.config/Code/User/settings.json`, `~/Library/Application Support/Code/User/settings.json`

<div align="center">
  <img src="https://user-images.githubusercontent.com/7836623/53287052-28ffcf00-3777-11e9-8f32-b8c71257560c.png" width="40%" />
</div>

#179 documents the migration from [Atom][] to [Visual Studio Code][vscode].
I've used Atom since it came out some years ago and it has always been a great editor and IDE for web development as well as main editor for documents, but _Visual Studio Code_ evolved a lot during the last year.

Compared to Atom there are many features and improvements that I've really liked to see for Atom. Even though it can be extended and modified a lot there are limitations due to Atom's core in aspects like performance, stability and overall development features like auto-completion and language-awareness.

_Visual Studio Code_ feels more “language-native“ when it comes to e.g. intelligent auto-completion, the integration of linters and language specific tools. It comes with support for a lot of languages out-of-the-box™ like _JavaScript_/_TypeScript_, _CSS_/_HTML_ and has basic support for native languages like _Go_ or _Rust_.

The change was not easy for me since I've customized and developed Atom to fit all of development needs, but after some testing time I had to admit that the UX of _Visual Studio Code_ feels way better now.

I made sure that all my beloved Atom packages are also available as _Visual Studio Code_ extensions (same code base) or an equivalent alternative before actually started the migration.

Therefore the initial setup now includes…

- …core and extension settings.
- …custom keybindings.
- …locale configurations.
- …a list of all installed extensions.
- …CSS stylesheets to customize some that'll be loaded by the [“Custom CSS and JS Loader“][vscode-ext-be5invis.custom-css] extension.
- …workspace files.

The initial setup comes with the following extensions:

- [Nord](https://marketplace.visualstudio.com/items?itemName=arcticicestudio.nord-visual-studio-code)
- [file-icons](https://marketplace.visualstudio.com/items?itemName=file-icons.file-icons)
- [Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
- [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)
- [Markdown Preview Enhanced](https://marketplace.visualstudio.com/items?itemName=shd101wyy.markdown-preview-enhanced)
- [Babel JavaScript](https://marketplace.visualstudio.com/items?itemName=mgmcdermott.vscode-language-babel)
- [vscode-styled-components](https://marketplace.visualstudio.com/items?itemName=jpoissonnier.vscode-styled-components)
- [Path Intellisense](https://marketplace.visualstudio.com/items?itemName=christian-kohler.path-intellisense)
- [Go](https://marketplace.visualstudio.com/items?itemName=ms-vscode.Go)
- [Docker](https://marketplace.visualstudio.com/items?itemName=PeterJausovec.vscode-docker)
- [YAML](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml)
- [EditorConfig](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig)
- [Projects+](https://marketplace.visualstudio.com/items?itemName=fabiospampinato.vscode-projects-plus)
- [Polacode](https://marketplace.visualstudio.com/items?itemName=pnp.polacode)
- [Custom CSS and JS Loader](https://marketplace.visualstudio.com/items?itemName=be5invis.vscode-custom-css)
- [Rust (rls)](https://marketplace.visualstudio.com/items?itemName=rust-lang.rust)
- [GraphQL](https://marketplace.visualstudio.com/items?itemName=Prisma.vscode-graphql)

Over the time the `visual-studio-code` _snowblock_ evolved through the following changes:

1. **“Code Spell Checker“ extension** #183 (⊶ 898aa45d)
   ↠ The [Code Spell Checker][vscode-ext-code-streetsidesoftware.spell-checker] extension checks for errors and also allows to include user-defined dictionaries.
   The initial commit added custom dictionaries with some common words as well as project and identity related words.

   <div align="center">
   <img src="https://dunstontc.gallerycdn.vsassets.io/extensions/dunstontc/viml/0.1.7/1527861710810/Microsoft.VisualStudio.Services.Icons.Default" width="80" />
   </div>

2. **_Vim_ script syntax highlighting** #184 (⊶ 2bf7227a)
   ↠ Added the [vscode-viml-syntax][vscode-ext-dunstontc.viml] extension for syntax highlighting in all _Vim_ script files.

3. **“Soft“ word wrap for _Markdown_ and _MDX_ documents** #185 (⊶ 4e990f15)
   ↠ Enabled “soft“ word wrapping to improve the readability of long sentences and paragraphs in _Markdown_ and _MDX_ documents.

4. **File associations for `Brewfile`** ##186 (⊶ 140a7476)
   ↠ The [`Brewfile`][homebrew/homebrew-bundle] of [Homebrew][] was not detected as _Ruby_ syntax so a association has therefore been added to map it to the `ruby` syntax type.

5. **File associations for `vimrc`** #191 (⊶ 330357d6)
   ↠ The [`vimrc`][vimdoc-start#rc] of [Vim][] was not detected as _Vim_ script syntax so a association has therefore been added to map it to the `viml` syntax type provided by the [vscode-viml-syntax][vscode-ext-dunstontc.viml] extension that was added in #184.

6. **_Prettier_ plugin as default formatter** #197 (⊶ b4546935)
   ↠ As of _Visual Studio Code_ version 1.33.x a notification is shown when there are multiple formatter found for the file type in the currently active editor. Since [Prettier][] supports most languages and is the de-factor standard tool the [Prettier plugin][vscode-ext-esbenp.prettier-vscode] has been set as editor default.
   When there are unsupported languages or languages like _Go_ which come with their own toolchain (`gofmt`, `goimports` etc.) the default formatter can be overridden through the languages-specific settings scopes.

7. **Reset zoom level back to 1** #198 (⊶ 259537d5)
   ↠ The UI window zoom level (`window.zoomLevel`) was set to `0.5` due to some configurations changes made to the global system resolution (4k rendering), but has now been changed back to the default value (`1`).

8. **_MDX_ extension** #199 (⊶ 9a0ac072)
   ↠ Added support for many [MDX][] features, syntax highlighting and bracket matching through the [_MDX_ extension][vscode-ext-silvenon.mdx] by _Matija Marohnić_.

9. **Switched icon theme** #196 (⊶ f0682871)
   ↠ Before the [Material Icon Theme][vscode-ext-equinusocio.vsc-material-theme-icons] by _Mattia Astorino_ was used because it provided slick folder icons with customizeable colors and a large set of file type icons with a flat style and pale/contrast-lowered colors making it a great match to my [Nord][vscode-ext-arcticicestudio.nord] theme.
   With the latest update the icons were changed to use bright contrast colors while the folder icons changed in a bad way too.
   Therefore I've decided to give the popular [Material Icon Theme][vscode-ext-pkief.material-icon-theme] by _Philipp Kief_ another try (last time it had the same style like the current theme after the latest update and way less customization options). It turned out the theme is more advanced in almost all points and provided a good UX and style:

   - Even larger amount of supported file types.
   - Multiple theme style accents.
   - **Customizable folder and file icon colors** through the `material-icon-theme.saturation` option to reduce the file color contrast and the `material-icon-theme.folders.color` & `material-icon-theme.folders.theme` options for the folders!
   - Arrows of folders can be hidden.
     Overall the theme full fills all my requirements and is therefore now used as default theme.

10. **Hide action buttons of sidebar panel headers** #200 (⊶ f77869b5)
    ↠ In #179 the [“Custom CSS and JS Loader“][vscode-ext-be5invis.vscode-custom-css] extension was introduced to use custom CSS stylesheets including styles to hide menu buttons from the editor.
    To hide the button of sidebar panel headers another selector has been added.

11. **Disabled breadcrumb navigation** #209 (⊶ 21f8c343)
    ↠ As of _Visual Studio Code_ version 1.35 the [breadcrumb navigation is enabled by default][vscode-rln-1.35#breadcrumbs]. They have been disabled again to unclutter the UI.

12. **Disabled indent guides in tree widget (Explorer)** #210 (⊶ 5cecacc2)
    ↠ As of _Visual Studio Code_ version 1.36 the [tree widget support visual indent guide lines][vscode-rln-1.36#tree_indent_guides] are enabled by default. They have been disabled again to unclutter the UI.

13. **Render whitespace characters only for selected text** #213 (⊶ d8a81414)
    ↠ Updated to the new `selection` value for the `editor.renderWhitespace` field introduced in _Visual Studio Code_ [1.37][vscode-rln-1.37#whitespace_select] that allows to only render whitespace characters on selected text.

    <div align="center"><img src="https://code.visualstudio.com/assets/updates/1_37/render-whitespace-on-selection.png" /></div>

14. **Hide _NPM Scripts Explorer_** #214 (⊶ 673e844e)
    ↠ Previously the builtin _NPM Script Explorer_ was hidden by default, but is visible by default as of _Visual Studio Code_ [1.37][vscode-rln-1.37#npm_script_expl] which was justified by the fact that it was „difficult to discover“.

    <div align="center"><img src="https://code.visualstudio.com/assets/updates/1_37/npm-scripts-explorer.png" /></div>

15. **Incremental naming of copied files/folders** #215 (⊶ a5093282)
    ↠ As of _Visual Stusio Code_ [1.37][vscode-rln-1.37] the automatic incremental naming for copied files that include numbers has been (silently) removed, but than added back as [_explorer improvement_ in version 1.38][vscode-rln-1.38#explo_impr] with two configuration options to either add a `copy` suffix or use a `smart` strategy. The second one adds a number at the end and if some number is already part of the name, it tries to increase that number. This reflects the behavior from VS Code versions `<1.38` and has therefore been set.

## _Snowflakes_

### systemd — #76 ⇄ #77 (⊶ 1eb5ffc9)

↠ Created the new [systemd][] _snowflake_ that includes

- documentations about [how to fix the instantaneous MacBook Pro (11,x) suspend wakeup problem after the lid has been closed][archw-mbp-11x#suspend].
- documentation about [how to configure the lid close behavior][archw-gnome-lid-behavior].
- a [custom suspend service][archw-suspend-service] implementation and documentation.
- a [`system-sleep` hook][archw-system-sleep-hook] implementation and documentation.

See [systemd.special(7)][freedesktop-systemd.special] and [systemd.sleep(8)][freedesktop-systemd.sleep] for more details.

Over the time the `systemd` _snowflake_ evolved through the following changes:

1. **Replaced/Updated `archbook` with new `iceowl` host** #143, #131 (⊶ c08ca24c)
   ↠ There were [various _snowblock_/_snowflake_ configurations that contained the `archbook` host](https://github.com/search?l=&q=archbook+repo%3Aarcticicestudio%2Figloo+created%3A%3E2018-09-18&type=Code) which doesn't exist anymore and has been replaced in most cases with the new `iceowl` host. In cases where the _snowblock_/_snowflake_ is only targeted for Linux the `archbook` host has been removed to make it independent from the host. They can be updated when a new Linux host might be introduced.

### buku — #138 (⊶ 38ec12d7)

↠ Initially `snowflakes/buku` for [buku][] provided the bookmarks of the used database exported as HTML file to allow to simply import it using Firefox as well as shell script that can be used to bootstrap a database.

The files are `igloocrypt` encrypted because they include sensitive data for private SSH servers as well as jo related bookmarks.

Over the time the `buku` _snowflake_ evolved through the following changes:

1. **Bookmarks September 2018** #152 ⇄ #159 (⊶ f021edf0)
   ↠ The regular bookmark update for September 2018.

   → Added

   - [React Top-Level API][react-docs-api] - The official docs of the React Top-Level API
   - [Modular Scale][modularscale] - A web app to calculate modular font scales
   - [Type Scale][type-scale] - Another web app to calculate modular font scales
   - [Cypress][cypress] - ast, easy and reliable testing for anything that runs in a browser.
   - [Let's Encrypt][letsencrypt] - A free, automated, and open Certificate Authority.
   - [Firefox Monitor][firefox-monitor] - Firefox Monitor arms you with tools to keep your personal information safe. Find out what hackers already know about you and learn how to stay a step ahead of them.
   - [Have I Been Pwned][haveibeenpwned] - Check if you have an account that has been compromised in a data breach.
   - [React Patterns][reactpatterns] - Collection of good React patterns.
   - [Hacktoberfest][hacktoberfest] - The yearly open source hackathon by Digital Ocean.
   - [BitPaper][bitpaper] - A collaborative whiteboard web app
   - [React Lifecycle Methods Diagram][react-lifecycle-methods-diagram] - A web app to visualize the React Lifecycle Methods also mentioned in the official React docs.
   - [oEmbed][oembed] - Specification for a format for allowing an embedded representation of a URL on third party sites.

   → Updated

   - [Atomic Design][atomicdesign] by Brad Frost
     - Removed the `/table-of-contents` path from the URL
     - Added new tags: `css-in-js`, `workflow`

2. **Bookmarks October 2018** #168 (⊶ dd80df52)
   ↠ The regular bookmark update for October 2018.

   → Added

   - [Expo][] - A free and open source toolchain built around React Native to help you build native iOS and Android projects using JavaScript and React.
   - [unpkg][] - A fast, global content delivery network for everything on npm to quickly and easily load any file from any package using a URL.
   - [My Ocotocat][octocat] - Take a break from your build and create an Octocat that’s all you, from whisker tip to tail.
   - [Open Collective][opencollective] - A new form of association, transparent by design. A group of people with a shared mission that operates in full transparency. Everyone can see how they receive or spend money.
   - [node.green][] - Node.js ECMAScript compatibility tables.
   - [Create React App][create-react-app] - Set up a modern web app by running one command.
   - [date-fn][] - Modern JavaScript date utility library that provides the most comprehensive, yet simple and consistent toolset for manipulating JavaScript dates in a browser & Node.js.
   - [Centering in CSS: A Complete Guide][css-tricks-centering-css-guide]

3. **Bookmarks November 2018** #170 (⊶ 4807c565)
   ↠ The regular bookmark update for November 2018.

   → Added

   - [web.dev][] — Let's build the future of the web. With actionable guidance and analysis, web.dev helps developers like you learn and apply the web's modern capabilities to your own sites and apps.
   - [squoosh.app][] — Squoosh is an image compression web app that allows you to dive into the advanced options provided by various image compressors.
   - [Contributor Covenant][contributor-covenant] — A Code of Conduct for Open Source Projects
   - [Eva Icons][eva-icons] — Eva Icons is a pack of more than 480 beautifully crafted Open Source icons for common actions and items.
   - [Feather Icons][feathericons] — Simply beautiful open source icons
   - [CommonMark][] — A strongly defined, highly compatible specification of Markdown
   - [Overreacted][] — Personal blog by [Dan Abramov][twitter-dan_abramov], React core team developer.
   - [JSON-LD][] — A JSON-based Serialization for Linked Data. JSON-LD organizes and connects it, creating a better Web.

   → Updated

   - [AUR][]: Updated the outdated keyword search URL from `https://aur.archlinux.org?K=%s` to `https://aur.archlinux.org/packages/?O=0&K=%s`.

### Homebrew — #140, #131 (⊶ 43fd982e)

↠ Initially `snowflakes/homebrew` for [Homebrew][] added a [`Brewfile`][homebrew/homebrew-bundle] and a documentation that includes instructions how to…

- …update to the latest Homebrew version.
- …upgrade all outdated formulas, casks and taps.
- …bootstrap the `Brewfile` with [Homebrew Bundle][homebrew/homebrew-bundle].

Over the time the `homebrew` _snowflake_ evolved through the following changes:

1. **“Google Chrome“ cask** #148 (⊶ 2b0286dc)
   ↠ The [google-chrome][brew-google-chrome] cask has been added that is used for web development with [DevTools][gdev-web-devtools] features only available in Chrome (e.g. Lighthouse) and to test and compare possible browser differences.

2. **“Gifski“ (desktop ap) and “ImageOptim“** #149 (⊶ 7508e641)
   ↠ The [Gifski][] desktop app has been added for simple and fast conversion as well as the [ImageOptim][homebrew/homebrew-cask-imageoptim] cask and [imageoptim-cli][brew-imageoptim-cli] formula to optimize images.

   <div align="center">
   <img src="https://sindresorhus.com/assets/gifski/icon.png" width="30%" />
   <img src="https://sindresorhus.com/assets/gifski/screenshot1.jpg" width="60%" />
   <img src="https://imageoptim.com/ImageOptim-app.png" width="60%" />
   </div>

3. **Brewfile Update Januar 2019** #173 (⊶ 60274c38)
   ↠ The regular batch update for new, changed and deleted _Homebrew_ formulas/casks/taps.

   → Added

   - [cabextract][] — OSS tool to extract _Microsoft cabinet files_ (`.cab`)
   - [nq][] — A UNIX CLI queue utility that allows to create very lightweight job queue systems which require no setup, maintenance, supervision, or any long-running processes.
   - [wallpaper][macos-wallpaper] — Allows to manage the desktop wallpaper on macOS from the CLI
   - [Spectrum][] — The desktop app of [Spectrum][]
   - [Visual Studio Code][vscode] — Code editing. Redefined. Free. Open source. Runs everywhere.

   → Updated

   - [KeepassXC][] — An actively developed community-edition of [KeePassX][]

4. **`hostess` formula** #174 (⊶ 0e8f37f9)
   ↠ Added the formula for [hostess][cbednarski/hostess], an **idempotent** command-line utility for managing your `/etc/hosts` file.

5. **`gotop` formula** #176 (⊶ 5a449b47)
   ↠ Added the formula for [gotop][], a terminal based graphical activity monitor inspired by [gtop][gtop] and [vtop][vtop].
   The formula is available through the `cjbassi/gotop` tap.

   <div align="center"><img src="https://raw.githubusercontent.com/cjbassi/gotop/master/assets/demos/demo.gif" width="60%" /><img src="https://raw.githubusercontent.com/cjbassi/gotop/master/assets/screenshots/minimal.png" width="60%" /></div>

6. **`dive` formula** #177 (⊶ fed546f5)
   ↠ Added the formula for [dive][], a tool for exploring a _Docker_ image, layer contents, and discovering ways to shrink your Docker image size.
   The formula is available through the `wagoodman/dive` tap.<div align="center"><img src="https://raw.githubusercontent.com/wagoodman/dive/master/.data/demo.gif" width="60%" /><img src="https://raw.githubusercontent.com/wagoodman/dive/master/.data/demo-ci.png" width="60%" /></div>

7. **`streamlink` formula** #178 (⊶ c8dfabe7)
   ↠ Added the formula for [streamlink][], a CLI for extracting streams from various websites to a video player of your choosing by using _FFMPEG_ and _youtube-dl_.

8. **Remove `dep` formula** #187 (⊶ 6c0a0414)
   ↠ Since _Go_ 1.11 with [Go Modules][go-ghwiki-mods] `dep` is deprecated and not necessary anymore.

9. **Fixed typo in `gnu-which` formula name** #188 (⊶ 9c2d48df)
   ↠ Fixed thae typo in the formula name of [`gnu-which`][brew-gnu-which] that is currently stored as `gnu-witch`.

10. **_Kubernetes_ and _Helm_** #189 (⊶ d8a79830)
    ↠ Added [Kubernetes][] and [Helm][].

11. **_Protocol Buffers_** #190 (⊶ b3b43e3f)
    ↠ Added [Protocol Buffers][protocol-buffers] to develop and build with [gRPC][].

### iTerm2 — #135, #131, #70 (⊶ 3573a2a2)

↠ Initially `snowflakes/iterm2` for [iTerm2][] has been created as replacement for [Tilix][] that is designed for GTK based Linux distributions. The _snowflake_ contains the exported JSON file of the created `igloo` profile.

### udev — #111 ⇄ #112 (⊶ 8e47b174)

↠ Initially `snwoflakes/udev` for [udev][archw-udev] a custom rule with mappings for the [Logitech R400 Presenter][logitech-r400-presenter] optimized for presentations made with the React library [Spectacle][] and the [Code Slide][spectacle-code-slide] extension.
The documentation contains detailed information about the functionality as well as install & usage instructions for _udev_ custom rules.

### Visual Studio Code — #179 (⊶ 8cebb084)

↠ Initially `snowflakes/visual-studio-code` for [Visual Studio Code][vscode] provided the `extensions.json` file that contains the IDs of all currently used _Visual Studio Code_ extesnions.
See the “_Snowblocks_“ → “Visual Studio Code“ section of this changelog for the release version `0.1.0` for more details.

# Project Initialization

![Release Date: 2017-01-07](https://img.shields.io/badge/Release_Date-2017--01--07-88C0D0.svg?style=flat-square)

<!--lint disable no-duplicate-headings-->

# Historical Background

Back on 2017-01-07, this repository was created in order to open source my _dotfiles_ that were stored and managed in a private repository on my server back then. The intention was to allow other to learn and use these files or even contribute back even though most of the time preferences and configurations are shaped for personal use. I also liked the great idea of the [“GitHub does dotfiles“][gh-dotfiles] project and the fact that a public repository makes it way easier for me to setup and bootstrap a new system without the requirement to configure and connect to my VPN before being able to clone and use my _dotfiles_.

Since then this repository changed a lot regarding the structure and data, forming my “digital source-of-truth“ for my systems. The main targets hosts were `illuvigaq` (later on [renamed to `igloo`][gh-10]) and `archbook` where the later was [replaced with `iceowl`][gh-143] later on by switching from _Arch Linux_ running on a _MacBook Pro 11,2 (2016)_ to [_macOS_ on a new _MacBook Pro 15,2 (2018)_][gh-131].
Even though updates are documented and merged through an organized workflow, the repository was more like a constantly changing and moving kind of cache to keep the _dotfiles_ reasonably maintainable and in sync between the systems.

The goal was to use the files in daily business, improve up on these usage experiences and finally persist the configurations into this repository. This is the way this repository was used for almost over 3 years and it worked reasonably well, but there are plans for a refactoring of the structure and workflow. In order to clarify this goal release version 0.1.0 is going to set a imaginary marker line in the repository history to persist and document the current repository state.

The following sections provide detailed documentations about all the _snowblocks_, _snowflakes_ and everything else that has been done to build up the current _dotfile_ state.

## Repository Structure

**Bootstrap script** — #1 (⊶ b516e30a)

↠ Implemented the `bootstrap` shell script to run [snowsaw][] with the following configurations:

- `SNOWSAW_DIR=.snowsaw` — Path to the _snowsaw_ submodule.
- `SNOWSAW_BIN=.bin/snowsaw` — Path to the _snowsaw_ binary.
- `SNOWBLOCKS_BASE_DIR_NAME=snowblocks` — Name of the base `snowblock` directory.
- `SNOWBLOCKSDIR=.` — Relative path of the current working directory the `bootstrap` script runs in.

The actual execution command `"${SNOWSAW_DIR}/${SNOWSAW_BIN}" -s "${SNOWBLOCKSDIR}"` allows to add additional options by passing parameters through via `"${@}"`.

**MIT license migration** — #59 ⇄ #60 (⊶ 11c003ec)

↠ Before the project code was licensed under the [Apache 2.0][apache-license] license. This often causes problems when developers want to use the project or code parts of it in another project licensed under a less restricted license.
The project migrated to the [MIT license][choosealicense-mit] which is more open, unrestricted and the most used license for open source projects like [React][] which has also recently been [re-licensed][fb-code-blog-react_relicense].

**Updated copyright comment header** — #123 (⊶ 2e4d6946)

↠ Before some files still used a “hard-coded“ copyright year that has now been changed to use the `<YEAR_OF_BIRTH>-present` pattern in order to prevent unnecessary overhead on each year change.
Also the copyright email for „Sven Greb“ was invalid and has been updated to the valid address.

## _Snowblocks_

### Git — #2 (⊶ fd43bdac)

↠ Initially `snwoblocks/git` for [Git][] provided the following files & directories linked to their destination:

- `gitconfig` → `~/.git-commit-msg`
- `gitignore` → `~/.gitignore`
- `gitconfig_auth` → `~/.gitconfig_auth` (initially **not** tracked by Git but only created and linked locally)
- `git-commit-msg` → `~/.git-commit-msg`

Over the time the `git` _snowblock_ evolved through the following changes:

1. **Conditional configuration inclusion** #23 ⇄ #27 (⊶ 427e6cb5)
   ↠ The new [conditional configuration `includes`][git-docs-config#incl] Git feature was introduced in version [2.13][gh-blog-git-2.13] provides a comfortable way to automatically load different configurations based on the current path of the repository.
   Many path specific projects have been added to to allow to split the main- and job authentication configurations.
   Also see the following related changes:

   - **Conditional configuration includes for "gitlab" and "incubator"** #97 ⇄ #101 (⊶ eca02520)
     ↠ Added [conditional configuration `includes`][gh-blog-git-2.13#cond_incl] for the `gitlab` and `incubator` directories using the default main Git configuration.
   - **New conditional authentication configuration `include`** #120 (⊶ 36970049)
     ↠ Ensured all _communikey_ projects are configured to use the `svengreb` Git user a new conditional include for the `~/code/github/repositories/communicode/` path(s).
   - **New conditional authentication config `include`** #171 (⊶ 631ab5f1)
     ↠ Ensured all projects by [@svengreb][gh-user-svengreb] are committed with the correct Git credentials a new conditional `include` for the `~/yggdrasil/svengreb/` path has been added.

2. **Simplified branch printing aliases** #25 ⇄ #28 (⊶ 427e6cb5)
   ↠ The branch printing aliases `b` and the extended aliases `bum` and `bm` have been simplified by removing unnecessary flags:

   - The `--list` flag is used to list branches matching a specific pattern.
   - Removed `-v`/`-vv`/`--verbose` which shows the commit SHA1 and subject line after each branch.

3. **Improved logging alias formats** #24 ⇄ #29 (⊶ a316d775)
   ↠ The defined ASCII colors codes for the output have been changed to adapt to the terminal colors theme/scheme.
   The format has also been simplified and minimized/reduced to relevant information except the extended `ll` and `llf` aliases.
   Added the new shorthand aliases `lf` and `llf` were added for a flattened output without topic commits from merges and adapted the style to the existing `lnew` and `lch` aliases. The `lr` alias is now superfluous and has been removed due to the new `ll` and `llf` aliases which include the relative date of a commit.

4. **Long GPG `keyid` format for Git configuration** #50 ⇄ #54 (⊶ a4065f5d)
   ↠ The GPG [`keyid-format`][gpg-docs-conf_opts] has been changed from `short` to `long`.

5. **Adapted Git commit message template to style guide** #51 ⇄ #55 (⊶ 272d1bff)
   ↠ The Git commit message template content was outdated and has been updated to adapt to the new [Git Style Guide][arcticicestudio/styleguide-git].

6. **Transparent Git encryption using GPG** #64 ⇄ #69 (⊶ 32c24ceb)
   → **Replaced by #113 ⇄ #114 later on!**
   ↠ Added a global `.gitattributes` file and configured the global `.gitconfig` file to apply a transparent git encryption with `smudge` and `clean` filters using [GPG].
   In the `.gitattributes` file, a filter for all `*.igloocrypt` file extensions was set. The `.gitconfig` now includes the filter configuration by using `gpg` for the encryption and decryption, processing files just before they‘re checked out and just before they’re staged. Also see GitHub _Gist_ [“Transparent Git encryption with `smudge` & `clean` filters using GPG“][gist-git_smudge_clean] for more details.
   ![](https://git-scm.com/book/en/v2/images/smudge.png)
   ![](https://git-scm.com/book/en/v2/images/clean.png)
   6.1 **Migration to `git-crypt`** #113 ⇄ #114 (⊶ 4bb0d48e)
   ↠ In #64 the concept was described as a simpler and cleaner solution instead of adding a using a tool like [git-crypt][] with the reason that this would make the encryption usage dependent on an external tool and also commits additional files to the repository like the `.git-crypt` folder in the root of the repository. It was also documented that such tools are really useful and necessary when the repository is used by many collaborator, but only adds overhead for personal _dotfile_ repositories.
   Anyway, the transparent Git encryption introduced to [GPG] encrypt specific files using the `smudge` and `clean` filters only worked reasonably well with various problems, e.g. caused files to be flagged as „dirty“ (modified) after checkout even if there have been no changes. The pure Git builtin solution with filters was chosen to prevent dependence to external tools, but the latest release versions of Git causing more and more problems due to changes in the behavior e.g. [how `git diff` works][git-docs-diff] (also causing `diff-so-fancy` to be broken).
   Therefore the previously implemented solution has been removed again and, against contrary to the opinion in #64, migrated to use [git-crypt][] instead. Even if this added additional files to the repository as well as the external dependency to the tool itself, `git-crypt` is a stable and production proven concept that works safely and allows to really use a transparent encryption.
   After playing around and testing `git-crypt` locally the resulting migration steps were as follows:

   - **1** Deleted the custom [`git-diff-igloocrypt`](https://github.com/arcticicestudio/igloo/blob/8e47b174e586694bf4e882575b1931bbd27013d7/snowblocks/git/git-diff-igloocrypt) script.
   - **2** Removed the custom [`[diff "igloocrypt"]`](https://github.com/arcticicestudio/igloo/blob/8e47b174e586694bf4e882575b1931bbd27013d7/snowblocks/git/gitconfig#L57-L58) section from the `gitconfig` file.
   - **3** Removed the custom filter [`"igloocrypt"`](https://github.com/arcticicestudio/igloo/blob/8e47b174e586694bf4e882575b1931bbd27013d7/snowblocks/git/gitconfig#L73-L75) from the `gitconfig` file.
   - **4** Updated the `filter` and `diff` custom global Git attributes handler for all `*.igloocrypt` files to the new `git-crypt` setup.
   - **5** Decrypted all `*.igloocrypt` files and backup them up outside the repository.
   - **6** Deleted all `*.igloocrypt` files within the repository.
   - **7** Initialized `git-crypt` for the repository: `git-crypt init` (default key).
   - **8** Added the main Arctic Ice Studio GPG key: `git-crypt add-gpg-user -n <ID>` (`-n` flag prevents automatic commit of generated files).
   - **9** Committed the newly generated `.git-crypt` folder.
   - **10** Unlocked the repository: `git-crypt unlock`.
   - **11** Added all backed up `*.igloocrypt` files back into the repository.
   - **12** Ensured all `*.igloocrypt` are tracked to be encrypted: `git-crypt status`.
   - **13** Committed all `*.igloocrypt` files.
   - **14** Validated the encryption works by locking the repository again: `git-crypt lock`.

7. **Revised commit message template** #26 (⊶ 8eee3520)
   ↠ The Git commit message template contained an deprecated format and have been rewritten from scratch to match the new Arctic Ice Studio [Git Style Guide][arcticicestudio/styleguide-git].

8. **`diff-so-fancy` compatible `format-patch` alias** #84 ⇄ #87 (⊶ b9437b57)
   ↠ Added a new `fp` ("_format patch_") alias to fix a output problem when using [diff-so-fancy][] with the the `format-patch` command which also prints the ANSI color sequences. This is now prevented by using the `--no-color` option of `git diff`.
   The alias now also contains the `--patch-with-stat` option to add additional patch stats like the total amount of changed/removed lines.

9. **`diff-so-fancy` for `git add` interactive/patch mode** #63 ⇄ #91 (⊶ 82d8cfd9)
   ↠ Git [2.14.0][git-rln-2.14.0] includes a restructuring of `diff-highlight` (_contrib/_) for a easier reuse by [diff-so-fancy][]. `diff-so-fancy` for the `git add` interactive/patch mode is now used for the `interactive.diffFilter` configuration. Also the [so-fancy/diff-so-fancy#35 (comment)][so-fancy/diff-so-fancy#35-c] for more details.
   Also see the following related changes:

   - **Temporary replace `diff-so-fancy` with bundled `diff-highlight`** #125 (⊶ 535cb0a6)
     → See [so-fancy/diff-so-fancy#35][] and [so-fancy/diff-so-fancy#296][] for more details.
     ↠ The reason are incompatibility problems of [diff-so-fancy][] with the latest Git versions caused by changes in the diff logic.

   ```raw
   fatal: mismatched output from interactive.diffFilter
   hint: Your filter must maintain a one-to-one correspondence
   hint: between its input and output lines.
   ```

   **NOTE**: Downgrading to a compatible Git version is not an option because [versions <2.17.1 are effected by _CVE-2018-11233_ and and _11235_][git-rln-2.17.1#cve].
   To fix this problem for [interactive patch mode](https://github.com/arcticicestudio/igloo/blob/bb19634544f91c26d66e1f7f53a6bf06210fbaaf/snowblocks/git/gitconfig#L214-L220) the filter was temporary changed to the official [diff-highlight][] tool bundled with Git.

   ```diff
   [interactive]
   -  diffFilter = diff-so-fancy
   +  diffFilter = diff-highlight
   ```

10. **Host specific and encrypted user configurations** #93 ⇄ #94 (⊶ 1b564fc5)
    ↠ The [`gitconfig_auth`](https://github.com/arcticicestudio/igloo/blob/develop/snowblocks/git/gitconfig_auth) file was previously linked for all hosts and were limited to the hosts `igloo` and `archbook`. Also the `gitconfig_auth_job` file [was ignored](https://github.com/arcticicestudio/igloo/blob/develop/.gitignore#L8) and has been added in encrypted `.igloocrypt` format to the _snowblock_.
    Also see the following related changes:

    - **Fixed invalid file symlink targets for Git authentication configurations** #116 (⊶ 6cb11653)
      ↠ The Git authentication configurations were updated to be encrypted, but the targets for the symlinks configured within the `snowblock.json` have not been updated to match this change.

11. **Autocorrect command typos** #150⇄ #157 (⊶ 19a89e2a)
    ↠ The [`help.autocorrect`][git-docs-conf#autocorr] configuration allows to run auto-corrected commands with a specified delay time (seconds) after the info message has been shown. This has been added and set to a value of `10` (1 second).

12. **Git alias to list commits ahead/behind tracking branch** #180 (⊶ 545df096)
    ↠ Before only the `lnew` alias was available to list commits behind [`ORIG_HEAD`][git-docs-revs] which only worked after a solved merge conflict. This was not very useful and has been replaced by two new aliases:

    - `lahead` — Lists all commits the current branch is ahead of the tracked origin branch that have not been pushed yet.
    - `lbehind` — Lists all ahead commits of the tracked origin branch that are not merged into the current branch yet.

13. **Fixed invalid exit code handling for IntelliJ `mergetool`** #206 (⊶ 81734203)
    ↠ When using IntelliJ as `mergetool` and setting `mergetool.intellij.trustExitCode` to `true`, the `mergetool.intellij.cmd` gets called for all files immediately. After IntelliJ gets closed for the first processed file, all other calls will error because the temporary files passed to `idea merge` as parameters are not valid anymore causing the app to exit.
    The problem was that Git is not able to interpret or track started IntelliJ process and fails to listen for the exit code, causing the calls to be fired immediately. This problem was narrowed down to macOS while it works fine for Linux systems. See the [official Git documentation about the `mergetool` command][git-docs-mergetool] for more details.
    To fix the problem the `mergetool.intellij.trustExitCode` option was set to `false` and `mergetool.intellij.prompt` to `true` to force Git to wait for the user to confirm the merge is completed and the app window has been closed before continuing with the next queued file.
    The only impact is that it requires to press `y` or `n` after solving a conflict instead of only closing the app window and waiting for it to reopen again for the next file. This is also limited to macOS so the impact is very small compared to the broken state when not applying the fix.
    In order to dynamically apply the configurations only for macOS systems a `[include]` block is used and set the path to a additional file that will only be linked by _snowsaw_ for macOS based hosts.
    Note that the `include` statement/block **must be placed at the bottom** of the main Git configuration file in order to override the initial/default block!

14. **Git alias for _squash_ merging** #208 (⊶ 78ccf4c7)
    ↠ Before only the `m` alias was available to merge the specified branch in non-fast-forward mode. To do a ["squash" merge][ghh-prs#squash] a new `ms` alias has been added using the default fast-forward mode.

15. **Replaced/Updated `archbook` with new `iceowl` host** #143, #131 (⊶ c08ca24c)
    ↠ There were [various _snowblock_/_snowflake_ configurations that contained the `archbook` host](https://github.com/search?l=&q=archbook+repo%3Aarcticicestudio%2Figloo+created%3A%3E2018-09-18&type=Code) which doesn't exist anymore and has been replaced in most cases with the new `iceowl` host. In cases where the _snowblock_/_snowflake_ is only targeted for Linux the `archbook` host has been removed to make it independent from the host. They can be updated when a new Linux host might be introduced.

### Vim — #3 (⊶ 3e5b053c)

↠ Initially `snwoblocks/vim` for [Vim][] provided the following files & directories linked to their destination:

- `vimrc` → `~/.vimrc`

Over the time the `vim` _snowblock_ evolved through the following changes:

1. **Paste toggle key mapping** #16 (⊶ 57e84f59)
   ↠ Added `<F3>` key as toggle for the [`pastetoggle`][vimdoc-opts#pastetoggle] option.

2. **Automatically wrap left and right** #22 ⇄ #30 (⊶ 60895adc)
   ↠ Allowed to move the cursor to the previous/next line after reaching first/last character in the line using the the left <kbd><</kbd> and <kbd>></kbd> arrow keys in normal-, insert- (`<,>`) and visual mode (`[,]`) or the <kbd>h</kbd> and <kbd>l</kbd> keys. This is configured through the `whichwrap` variable. See `:help whichwrap` for more details.

3. **Key mapping to move current line and selected block** #21 ⇄ #31 (⊶ ed36f3b9)
   ↠ Added a key mapping that allows to easily move the current line or selected block(s) using the <kbd>Ctrl</kbd> and the _up_ <kbd>⇧</kbd> and _down_ <kbd>⇩</kbd> keys. The moved line/block adapts to the new indentation and is available in the `NORMAL`, `INSERT` and `VISUAL` modes.

4. **Auto toggle sign column** #32 ⇄ #33 (⊶ e08a7767)
   ↠ Vim 8 introduced a new option to configure the state of the sign column to be always visible (`yes`), always hidden (`no`) or to automatically toggle (`auto`) when signs are available to display.
   This improvement is related to the warning message added to [airblade/vim-gitgutter@dc73a81][] which also advises to remove the custom option `g:gitgutter_sign_column_always = 1` and use `set signcolumn = auto` instead, described by the plugin owner in [airblade/vim-gitgutter#431 (comment)][airblade/vim-gitgutter#431-c-sigcol]. Also see `:help signcolumn` for more details.

5. **Remap syntax highlighting function** #36 ⇄ #39 (⊶ 474b9b90)
   ↠ The `<C-S-P>` mapping for the function to show the syntax highlighting groups for the current cursor position collided with the AUR package [plotinus-git][aur-plotinus-git] which provides a searchable command palette in every modern GTK+ application. Is uses the commonly known <kbd>Control</kbd> + <kbd>Shift</kbd> + <kbd>P</kbd> key mapping. The terminal emulator [Tilix][] is a GTK3 application so the command bar is available and has a higher priority as the mapping for the function.
   The key mapping for the function was changed to use the <kbd>K</kbd> key instead of <kbd>P</kbd>.

6. **Enable 24bit true color support** #37 ⇄ #40 (⊶ 54c35959)
   ↠ The `termguicolors` option has been added to enable support for [24bit true colors][gist-term_colors]. This is necessary to use the Nord Vim _Custom Comment Brightness_ theme feature which makes use of HEX defined colors.**NOTE**: This change has been made obsolete later due to the deprecation of the _comment contrast_ option in _Nord Vim_ through the following change: **Comment Color Brightness** [arcticicestudio/nord-vim#145][] ⇄ [arcticicestudio/nord-vim#146][] (⊶ [arcticicestudio/nord-vim@9e0249ca][])

7. **Markdown plugin `plasticboy/vim-markdown`** #38 ⇄ #41 (⊶ c2d9cb4a)
   ↠ The [plasticboy/vim-markdown][] plugin extends the syntax highlighting support and provides additional features compared to the default syntax definitions.
   Also see the following related changes:

   - **Remove Markdown plugin plasticboy/vim-markdown"** #129 (⊶ ff85c3d0)
     ↠ Removed the [plasticboy/vim-markdown][plasticboy/vim-markdown] plugin (added in #38) again. The default Markdown syntax has been updated and now also supports many (non-standard) Markdown extensions while the plugin causes some compatibility problems.

8. **Replace unmaintained vim-coloresque plugin** #42 ⇄ #46 (⊶ c70a440a)
   ↠ The [gko/vim-coloresque][] was not actively developed anymore and conflicted with other plugins and has therefore been replaced with the active fork [ap/vim-css-color][].

9. **Add `vim-livedown` plugin** #45 ⇄ #47 (⊶ 39480637)
   ↠ The [shime/vim-livedown][] plugin adds support for [Livedown][] (Live Markdown Previews) for Vim.
   It requires the [`livedown`][npm-livedown] NPM package to be **globally** available!

10. **JSX syntax highlighting and indentation plugin** #44 ⇄ #48 (⊶ e940c244)
    ↠ The [mxw/vim-jsx][] plugin adds syntax highlighting and indenting support for JSX. It is **not a standalone JavaScript plugin** and must be used with a base JS highlighter and integrates with the currently used and recommended [pangloss/vim-javascript][] plugin (vim-jsx's "official" dependency).
    The `g:jsx_ext_required` configuration has been set to `0` to also enable JSX syntax highlighting in `.js` files.

11. **Remove default enabled "list" option** #72 ⇄ #73 (⊶ 6c823718)
    ↠ Before the `list` option was enabled by default, but has been disabled due to problems when using copy & paste within _Vim_ with OS- or terminal emulator specific functionalities.

12. **"NERD Commenter" plugin** #71 ⇄ #75 (⊶ 4ab5c4be)
    ↠ Added the [NERD Commenter][nerdcommenter] plugin that configures hotkeys to dynamically comment with language syntax awareness.
    The `NERDSpaceDelims` config has been enabled to automatically add spaces after comment delimiters.

13. **macOS compatibility for line- and block movement keymappings** #172 (⊶ 59a5cc50)
    ↠ The key mappings implemented in #31 worked fine on Linux systems, but conflicted with a global (non-modifiable) system key mapping on macOS. Therefore a condition check for the currently running environment is now used to set other specific key mappings for macOS and Linux.

### Bash — #4 (⊶ 0b664c78)

↠ Initially `snwoblocks/bash` for [Bash][] provided the following files & directories linked to their destination:

- `bootstrap` → `~/.bash_profile`
- `bootstrap` → `~/.bashrc`

Over the time the `bash` _snowblock_ evolved through the following changes:

1. **Fixed invalid logging directory creation** #5 (⊶ 374f7b7b)
   ↠ Removed the remaining code fragment from the old bash framework version causing a `/.log directory can not be created: Permission denied` error message during the bootstrap process.
   The `__snowblock_bash::setup_history()` function now also only creates the `.log` directory if it does not exists yet to avoid possible errors.

2. **`dircolors` color theme** #6 (⊶ 6ab88b9d)
   ↠ Added a `dircolors` package configuration to load the `~/.dir_colors` color theme on initialization.

3. **Fix invalid filename for local `igloo` environment configuration** #7 (⊶ 250bb72e)
   ↠ The local untracked environment configuration file `igloo.local` was not sourced caused by the wrong filename [`igloo.env.local`](https://github.com/arcticicestudio/igloo/commit/802258472da1afc0089cdef2a0bd22d9b51718a4#diff-76276899e039b7f3458a2bd0590d2ec8R27) in the [`igloo`](https://github.com/arcticicestudio/igloo/blob/develop/snowblocks/bash/config/env/igloo#L27#L28) environment configuration file.

4. **Java package specific environment variable `_JAVA_AWT_WM_NONREPARENTING`** #8 (⊶ ccdf6144)
   ↠ The environment variable `_JAVA_AWT_WM_NONREPARENTING` has been placed in the specific [`java`](https://github.com/arcticicestudio/igloo/blob/develop/snowblocks/bash/config/pkg/java) package configuration instead of the main [`igloo`](https://github.com/arcticicestudio/igloo/blob/develop/snowblocks/bash/config/env/igloo#L22) environment configuration file.

5. **Optimized base dir- and module name detection functions** #9 (⊶ c3e9a792)
   ↠ The functions to initialize the `$SNOWBLOCK_BASH_BASE_DIR` environment variable and to get the name of the currently running module were unnecessary complicated, unstable and contained duplicated code.

6. **Renamed environment `illuvigaq` to `igloo`** #10 (⊶ f0856f32)
   ↠ The `illuvigaq` environment has been finally renamed to `igloo`. The env configuration [`illuvigaq`](https://github.com/arcticicestudio/igloo/blob/develop/snowblocks/bash/config/env/illuvigaq) symlinked to [`igloo`](https://github.com/arcticicestudio/igloo/blob/develop/snowblocks/bash/config/env/igloo) is not used anymore.

7. **`sudo` package configuration** #12 (⊶ d605816d)
   ↠ Added a package configuration for [`sudo`](https://www.sudo.ws). The `SUDO_PROMPT` environment variable has been set to highlight the word "sudo" with a light background and a dark front followed by `$USER@$HOSTNAME` colorized with bluish _Nord_ colors.
   Also see the following related changes:

   - **Core alias `sudo` for alias expansion** #15 (⊶ dad96f29)
     ↠ Added a new `sudo` core alias to fix alias expansion when running a user alias via `sudo`.
     _bash_ only checks the first word of a command for an alias, any words after that are not checked. That means in a command like `sudo pacman`, only the first word (`sudo`) is checked by _bash_ for an alias while `pacman` is ignored. This can be changed by adding a space to the end of the alias value so _bash_ checks the next word after the alias.
     Snippet of the official [bash manual][bash-docs-alias]:

     > The first word of each simple command, if unquoted, is checked to see if it has an alias. If so, that word is replaced by the text of the alias.
     > If the last character of the alias value is _blank_, then the next command word following the alias is also checked for alias expansion

     More information and this alias can also be found in the [Arch Linux Wiki for `sudo`][archw-sudo].

8. **Core alias for _Spring Boot Remote Debugging_ via Maven** #13 (⊶ 0aecbe39)
   ↠ Added a new `sbrd` core alias to remote debug Spring Boot applications.
   **JDK 5** or higher should use the`-agentlib` option instead of `-Xdebug -Xrunjdwp` (Java Debug Wire Protocol): `-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=9999"`
   Arguments can be appended via `-Drun.jvmArguments` and commands for Maven to run the Spring Boot Application via `mvn spring-boot:run`: `mvn spring-boot:run -Drun.jvmArguments="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=9999"`

9. **Auto-detect installed _Ruby_ version for `PATH` concatenation** #17 (⊶ 6b0f8e2b)
   ↠ Before all _Ruby_ gem paths (`~/.gem/ruby/*/bin`) for each version had to be added to the `$PATH_RUBY_GEMS` variable in the [`igloo`](https://github.com/arcticicestudio/igloo/blob/develop/snowblocks/bash/config/env/igloo) env config manually.
   This has been changed to detect installed versions, add it to an array and append it to the `$PATH_RUBY_GEMS` variable separated with a colon (`:`).

10. **`gulp` package configuration** #18 (⊶ 6b0f856f)
    ↠ Added a package configuration for [gulp](http://gulpjs.com) to enable shell completions [provided by `gulp`][gulp-cli#compl].
    Also see the following related changes:

    - **Removed `gulp` package configuration** #145 (⊶ 83bbc253)
      ↠ [Gulp][] was not used anymore and has therefore been replaced with [Webpack][] or by simply using scripts or [npm scripts][npm-docs-scripts]. Therefore the [gulp](https://github.com/arcticicestudio/igloo/blob/c1fdba9e6554a4c1cdff32618ddafd700bc1a4cc/snowblocks/bash/config/pkg/gulp) package configuration has been removed. This also improves the shell startup time since the auto-completion script of `gulp` is not sourced anymore.

11. **Cleaned up _Java_ package config docs** #19 (⊶ 2696ed05)
    ↠ Updated references, remove unnecessary double quotes and cleaned up indentations.

12. **Removed local Ruby and NPM modules from `PATH`** #52 ⇄ #56 (⊶ 900a6b2e)
    ↠ Global _Ruby_- and _NPM_ packages should be installed to the default paths instead of customized paths to increase the overall compatibility and adapt to general conventions.
    The `PATH_NPM_PACKAGES` and `PATH_RUBY_GEMS` variables were therefore obsolete and have been removed from `PATH`.

13. **Add `GRADLE_OPTS`** #86 ⇄ #89 (⊶ bffaf260)
    ↠ Created a package configuration for [Gradle][] to set and export global default options using the [`GRADLE_OPTS`][gradle-docs-env#opts] environment variable. It includes

    - `org.gradle.daemon=true` - Enable to always use the Gradle daemon to run builds.
      Since Gradle 3.0, the daemon is [enabled by default][gradle-docs-rln-3.0#daemon] and is recommended for running Gradle.
    - `org.gradle.console=rich` - Always colorize console output.

14. **Alias for file/directory mode bits (attributes) in octal notation format** #86 ⇄ #88 (⊶ d20e4d20)
    ↠ Added a new `lsm` ("_list modes_") alias for the `stat` command to show [file/directory mode bits (attributes)][wiki-fs_perms] in the octal notation format.

15. **Using `diff-so-fancy` without _Git_** #61 ⇄ #90 (⊶ 08cbbc4c)
    ↠ [diff-so-fancy][] has been designed to work within Git controlled directories. To allow to use it to compare files that are not controlled by Git the `--no-index` option of `git-diff` can be used.
    The implemented script pipes the output to `less` using the options

    - `-R, --RAW-CONTROL-CHARS` to only display ANSI "color" escape sequences in "raw" form.
    - `-F, --quit-if-one-screen` to automatically exit if the entire file can be displayed on the first screen.
    - `-X, --no-init` to disable sending the _termcap_ (de)initialization strings to the terminal to avoid unnecessary operations like clearing the screen.
    - `-x2, --tabs=n` to use two tab stops.
      Also see [so-fancy/diff-so-fancy#220 (comment)](https://github.com/so-fancy/diff-so-fancy/issues/220#issuecomment-282530252) for more details.

16. **Removed custom `ATOM_HOME` path** #98 ⇄ #102 (⊶ 78042d83)
    ↠ The [`ATOM_HOME` environment variable][atom-docs-custom#home_path_env] was assigned to a custom path for the configuration folder of _Atom_ instead of using the default `~/.atom`. The reason was that the folder was located in a kind of "global application configuration collection folder" on another drive mounted on system start. This has now been deprecated and changed to use the default paths of the installed applications. The `~/.atom` folder is now used for _Atom_ which is located on the main SSD drive instead of using a symlink to the external drive.
    This change also comes with a great performance boost as the read/write capacity of the external drive HDD was of course way slower than the SSD.

17. **Source local `~/.bin` for binaries** #99 ⇄ #103 (⊶ 13d4ec36)
    ↠ If a local `~/.bin` folder exists it is now added to `PATH` to make all included binaries (executable scripts) available.

18. **Shortcut alias for `trash-cli`** #100 ⇄ #104 (⊶ eb5dedb8)
    ↠ Added a new `t` shortcut alias for [trash-cli][trash-cli] to quickly move files and folders into the trash.

19. **Alias for `taskwarrior`** #126 (⊶ 12dc9609)
    ↠ Renamed the previously used `t` alias of [trash-cli][trash-cli] to `trm` to use it for [taskwarrior][] instead.

20. **Alias for `timewarrior`** #127 (⊶ 0cdb1dd2)
    ↠ Added new shortcut aliases for [timewarrior][]:

    - `tw` = `tw summary` - Shortcut to show the summary.
    - `tws` = `timew :ids` - Shortcut to show IDs by default (depends on `alias.tw`).

21. **Package configuration and alias for _Buku_** #128 (⊶ 68e0289a)
    ↠ [Buku][buku] provides the `BUKU_COLORS` environment variable to allow users to define a custom color scheme. It follows the same principle like the `LSCOLORS` environment variables of the BSD `ls` command.
    The five letters represent the colors in ordered form of

    - index
    - title
    - url
    - description/comment/note
    - tag
      See the GitHub repository wiki page about [how to customize colors][buku-wiki-colors] for more details about available letters and their meaning.
      Next to this a shortcut alias `bk` has been added to simplify the command usage.

22. **Environment and auto-completion for `iceowl` host (macOS support)** #146, #131 (⊶ ac9f7bf7)
    ↠ Added a new [environment configuration](https://github.com/arcticicestudio/igloo/tree/83bbc2530dbb21f7e734aaa9e33898d7c4c67d50/snowblocks/bash/config/env) for the new `iceowl` host. Also imported the auto-completion scripts bundled with the Homebrew [git][brew-git] and [bash][brew-bash] forumlas.

23. **Alias for _IINA_** #147 (⊶ 17158a75)
    ↠ Added a new _macOS_ specific `iina` alias for [IINA][] to ensure the [MPV][] specific flags [`--mpv-config-dir`][mpv-doc-config-dir] and `--mpv-watch-later-directory` are always used which contain the paths to the [MPV configuration files][mpv-doc-config-files] and the [_watch-later_ folder][mpv-doc-config-folder-wl] of the [`--save-position-on-quit` feature][mpv-doc-save-pos]. This ensures the _watch-later_ state/position files are always synced with `igloosync` to ensure consitency with other synced hosts like `igloo`.

24. **Shorthand script to open files, paths or URLs** #169 (⊶ dedfd67b)
    ↠ Most OS provide builtin tools to open a file, path or URL with the associated application based on the MIME type. To use a uniform command for it a new script `open` has been implemented.
    When running on Linux it'll use the XDG compliant tool `xdg-open` from [xdg-utils][] while it'll pass through the parameters to the builtin application also called `open` when run on macOS.

25. **Basic _Go_ environment setup** #181 (⊶ ef8c84d4)
    ↠ I started to use [Go][] as my main programming language almost 3 years for everything from CLIs, high performant and lightweight backends/microservices with performance and intercompatibility in mind as well as for daily tools.
    _Go_ comes with a fantastic toolchain that also doesn't require a lot of necessary setups, therefore this basic setup is enough to work efficiently in combination with the awesome [IntelliJ Go plugin][jb-plg-go], a minimal setup for [Vim with the `govim` plugin][govim] and a basic integration for [Go in VS Code][vscode-docs-go].
    I've used the following basic setup:
    - Defined the `GOPATH` environment variable to point to the custom location at `$HOME/.go`. Even though I only use [Go Modules][go-ghwiki-mods] this is required for backwards compatibility, the toolchain as well as the resulting binaries in `$GOPATH/bin`
    - Added `$GOPATH/bin` to `$PATH` for all hosts.

<div align="center"><img src="https://magefile.org/images/gary.svg" width="140" /></div>

26. **Mage package configuration** #192 (⊶ 39069bef)
    ↠ Added a package configuration for [Mage][], a make/rake-like build tool using Go allowing to write plain-old go functions that'll automatically be used as Makefile-like runnable targets. See the [official documentation about environment variables][mage-docs-env] for more information.

    - `MAGEFILE_CACHE` — Changed the path of the directory for the magefile build cache from the default location `$HOME/.magefile` to `/tmp/.magefiles` since there is no need to persist the cache across system restarts.

27. **Fixed determing the exit status of last shell command** #207 (⊶ 6f483af3) by [@xulongwu4][gh-user-xulongwu4]
    ↠ The exit status of the last shell command was not determined at the very beginning of the `compile_prompt` function which caused a wrong code output.

### pacman — #14 (⊶ fa6909c8)

↠ Initially `snwoblocks/pacman` for [pacman][] provided the following files & directories linked to their destination:

- `makepkg.conf` → `~/.makepkg.conf`
- `pacman.conf.igloo`, `pacman.conf.archbook` → `~/.pacman.conf`

The initial implementation also included

- a package configuration for `pacaur` to set the `AURDEST` environment variable.
- the new `STORE_PKGS` environment variable added to the `igloo` and `archbook` environment configurations.
- the shorthand `pacman --config <PATH_TO_CONFIG>` shell alias.
- _pacman_ configurations for the hosts `igloo` and `archbook`.

Over the time the `pacman` _snowblock_ evolved through the following changes:

1. **Everyone loves candies!** #34 ⇄ #35 (⊶ be4d52e0)
   ↠ Enabled [pacman][]'s _candy eating mode_ for progress bars via `ILoveCandy` config boolean. See [`conf.c`](https://git.archlinux.org/pacman.git/tree/src/pacman/conf.c#n483) in _pacman_'s source code for more details.

2. **Replaced/Updated `archbook` with new `iceowl` host** #143, #131 (⊶ c08ca24c)
   ↠ There were [various _snowblock_/_snowflake_ configurations that contained the `archbook` host](https://github.com/search?l=&q=archbook+repo%3Aarcticicestudio%2Figloo+created%3A%3E2018-09-18&type=Code) which doesn't exist anymore and has been replaced in most cases with the new `iceowl` host. In cases where the _snowblock_/_snowflake_ is only targeted for Linux the `archbook` host has been removed to make it independent from the host. They can be updated when a new Linux host might be introduced.

<div align="center"><img src="https://user-images.githubusercontent.com/7836623/29265613-f4300e72-80e1-11e7-986b-8f45b1958c9a.png" width="800" /></div>

3. **Removed ignored pacman packages** #49 ⇄ #53 (⊶ b853ec8c)
   ↠ Before the `harfbuzz`, `harfbuzz-icu` and `gdk-pixbuf2` packages were added to the _pacman_ ignore list to [fix the harfbuzz + _Infinality_ issue](https://gist.github.com/cryzed/e002e7057435f02cc7894b9e748c5671) which caused broken font rendering & boot failures on most systems due to incompatibility with the updated `freetype2` package, which superseded the `infinality-bundle`.
   These packages have now been removed from the ignore list against since the issues have already been fixed some days after the issue occurred.
   Also see the following related changes:
   - **Removed ignored pacman packages for `archbook` host** #53 (⊶ 880b3fac)
     ↠ #53 only removed the ignored packages for the `igloo` host which has now also been ported for `archbook`.

### systemd — #58 (⊶ ab4513b0)

↠ Initially `snwoblocks/systemd` for [systemd][] provided user [service][freedesktop-systemd-srv] and [units][freedesktop-systemd-unit] to

- automount the `sync` [gocryptfs][] volume located in the [Dropbox][] folder receiving the password stored in the [GNOME keyring][archw-gnome-keyring] via `secret-tool` ([`libsecret`][libsec]). The service unit is named `igloosync-dropbox`.
- automatically run a instance of the [`ssh-agent`][archw-ssh_ag] using `$SSH_AUTH_SOCK` and let _systemd_ manage the `$SSH_AGENT_PID` environment variable.

This includes a documentation to describe the requirements for the `igloosync-dropbox.service` file providing information

- about how to create the required `gocryptfs` password stored- and received via `secret-tool`.
- about how to configure [wiki-fuse][] ([libfuse][]) with the `/etc/fuse.conf` file to allow non-root users to specify the `allow_other` or `allow_root` mount options which overrides the security measure restricting file access to the filesystem owner, so that all users (including root) can access the files. This is necessary to access the files of the mounted `gocryptfs` volume with applications that are run via `sudo`. It is used in the `pacman` _snowblock_ for the local package repository to prevent a _Permission Denied_ exception when running `pacman` (e.g. `sudo pacman -Sy`) if the `gocryptfs` volume is not mounted with the `-allow_other` option. Please note that `libfuse` has a **[unresolved security bug][libfuse/libfuse#15]** when using the `allow_other` mount option as [described in the official documentation][libfuse-sec], but is of **little concern if the filesystem is accessible only to the mounting user** which is the case since these are **dotfiles for a personal system**:

> No other user (including root) can access the contents of the mounted filesystem (though this can be relaxed by allowing the use of the `allow_other` and `allow_root` mount options in `/etc/fuse.conf`)
>
> If you intend to use the allow_other mount options, be aware that FUSE has an unresolved [security bug][libfuse/libfuse#15]: if the `default_permissions` mount option is not used, the results of the first permission check performed by the file system for a directory entry will be re-used for subsequent accesses as long as the inode of the accessed entry is present in the kernel cache - even if the permissions have since changed, and even if the subsequent access is made by a different user. This is of little concern if the filesystem is accessible only to the mounting user (which has full access to the filesystem anyway), but becomes a security issue when other users are allowed to access the filesystem (since they can exploit this to perform operations on the filesystem that they do not actually have permissions for).
>
> This bug needs to be fixed in the Linux kernel and has been known since 2006 but unfortunately no fix has been applied yet. If you depend on correct permission handling for FUSE file systems, the only workaround is to use `default_permissions` (which does not currently support ACLs), or to completely disable caching of directory entry attributes.

The target paths `~/.config/systemd/user` for all unit files will be created by _snowsaw_ if they doesn't exist yet.

The `igloosync-dropbox.service` unit file is only linked for the `igloo` and `archbook` hosts while the `ssh-agent.service` file will be linked by default.

Over the time the `system` _snowblock_ evolved through the following changes:

1. **Replaced/Updated `archbook` with new `iceowl` host** #143, #131 (⊶ c08ca24c)
   ↠ There were [various _snowblock_/_snowflake_ configurations that contained the `archbook` host](https://github.com/search?l=&q=archbook+repo%3Aarcticicestudio%2Figloo+created%3A%3E2018-09-18&type=Code) which doesn't exist anymore and has been replaced in most cases with the new `iceowl` host. In cases where the _snowblock_/_snowflake_ is only targeted for Linux the `archbook` host has been removed to make it independent from the host. They can be updated when a new Linux host might be introduced.

### XDG — #74 ⇄ #78 (⊶ 89b68775)

↠ Initially `snwoblocks/xdg` for _XDG_/[freedesktop.org][] specifications provided the following files & directories linked to their destination:

- `user-dirs.conf` → `~/.config/user-dirs.conf`
- `user-dirs.dirs` → `~/.config/user-dirs.dirs`
- `user-dirs.locale` → `~/.config/user-dirs.locale`
- `bookmarks` → `~/.config/gtk-3.0/bookmarks`
- `applications/atom.desktop` → `~/.local/share/applications/atom.desktop`
- `applications/evolution.desktop` → `~/.local/share/applications/evolution.desktop`
- `applications/gpick.desktop` → `~/.local/share/applications/gpick.desktop`
- `applications/gtkhash.desktop` → `~/.local/share/applications/gtkhash.desktop`
- `applications/intellij-idea-ce.desktop` → `~/.local/share/applications/intellij-idea-ce.desktop`
- `applications/intellij-idea-u.desktop` → `~/.local/share/applications/intellij-idea-u.desktop`
- `applications/minecraft.desktop` → `~/.local/share/applications/minecraft.desktop`
- `applications/org.gnome.gedit.desktop` → `~/.local/share/applications/org.gnome.gedit.desktop`
- `applications/org.gnome.Nautilus.desktop` → `~/.local/share/applications/org.gnome.Nautilus.desktop`
- `applications/org.gnome.Screenshot.desktop` → `~/.local/share/applications/org.gnome.Screenshot.desktop`
- `applications/pycharm-community.desktop` → `~/.local/share/applications/pycharm-community.desktop`
- `applications/shotwell-viewer.desktop` → `~/.local/share/applications/shotwell-viewer.desktop`
- `applications/webstorm.desktop` → `~/.local/share/applications/webstorm.desktop`
- `autostart/dropbox.desktop` → `~/.local/share/autostart/dropbox.desktop`
- `autostart/plank.desktop` → `~/.local/share/autostart/plank.desktop`
- `settings.ini` → `~/.config/gtk-3.0/settings.ini`

This includes [freedesktop][]'s _xdg_ specifications for

- user-specific [`.desktop` application files][archw-dfile].
- user-specific [autostart `.desktop` files][freedesktop-autostart].
- [XDG user directories][archw-ud] configurations and document templates.
- [XDG bookmarks][fd-bookmarks]

Over the time the `xdg` _snowblock_ evolved through the following changes:

1. **Removed GNOME Nautilus `.desktop` file** #105 (⊶ 7125312e)
   ↠ The custom `org.gnome.Nautilus.desktop` file isn't necessary anymore since the the missing MIME type handler has been added in the upstream which is necessary to open Nautilus from within other applications to e.g. show a project folder in the file system.

   <div align="center"><img src="https://upload.wikimedia.org/wikipedia/commons/d/d5/IntelliJ_IDEA_Logo.svg?sanitize=true" width="20%" /> <img src="https://upload.wikimedia.org/wikipedia/commons/a/a1/PyCharm_Logo.svg?sanitize=true" width="20%" /> <img src="https://confluence.jetbrains.com/download/thumbnails/51964300/WebStorm_400x400_Twitter_logo_white.png" width="22%" /></div>

2. **Updated and removed obsolete application desktop files** #118 (⊶ f2dffb76)
   ↠ Some XDG application `.desktop` files were not required anymore because the latest upstream versions have been adapted and improved to match the custom configurations:

   - [JetBrains IntelliJ IDEA Ultimate Edition][arch-jb-idea-u] binary `/opt/intellij-idea-ultimate-edition/bin/idea.sh` is now linked to `/usr/bin/idea` and `/usr/bin/intellij-idea-ultimate-edition`. The desktop file is now uniformly named `/usr/share/applications/jetbrains-idea.desktop`.
   - [JetBrains IntelliJ IDEA Community Edition][arch-jb-idea-ce] binary `/opt/intellij-idea-community-edition/bin/idea.sh` is now linked to `/usr/bin/idea`. The desktop file is now named uniform `/usr/share/applications/jetbrains-idea.desktop`.
   - [JetBrains Webstorm][aur-jb-ws] binary `/opt/webstorm/bin/webstorm.sh` is now linked to `/usr/bin/webstorm` and the desktop file is now named uniform `/usr/share/applications/jetbrains-webstorm.desktop`.
   - [JetBrains Pycharm Community Edition][arch-jb-py-ce] binary `/opt/pycharm-community-edition/bin/pycharm.sh` is now linked to `/usr/bin/pycharm`, but the desktop file is still named `/usr/share/applications/pycharm.desktop`.
   - [Atom 1.28][atom-blog-1.28] included an upgrade to Electron 2.0 and now ships with an standalone launcher(`/usr/lib/atom/atom`) instead of using the Electron binary (`electron <BINARY_PATH>`).

3. **Custom _JetBrains IntelliJ IDEA Ultimate_ editor desktop launcher** #203 (⊶ d4f474eb)
   ↠ _IntelliJ IDEA_ version 2019.1.3 came with a new “hardcoded“ icon so the `.desktop` launcher required a customization to use the correct icon theme name.

4. **Custom _KeePassXC_ desktop launcher** #204 (⊶ 6d86a967)
   ↠ [KeePassXC][] supports GTK3 out-of-the-box, but unfortunately doesn't adapted to the current system theme and icon them making the UI looking really unpleasant and outdated.
   To use a modern style the app now starts with the [`QT_QPA_PLATFORMTHEME` environment variable set to `gtk2`][archw-qt#fail_update] to [ensure the app respects the Qt5 style overrides][keepassxreboot/keepassxc#1931].

5. **Replaced/Updated `archbook` with new `iceowl` host** #143, #131 (⊶ c08ca24c)
   ↠ There were [various _snowblock_/_snowflake_ configurations that contained the `archbook` host](https://github.com/search?l=&q=archbook+repo%3Aarcticicestudio%2Figloo+created%3A%3E2018-09-18&type=Code) which doesn't exist anymore and has been replaced in most cases with the new `iceowl` host. In cases where the _snowblock_/_snowflake_ is only targeted for Linux the `archbook` host has been removed to make it independent from the host. They can be updated when a new Linux host might be introduced.

### cower — #65 ⇄ #79 (⊶ 503561de)

↠ Initially `snwoblocks/cower` for _cower_ (rewritten as [auracle][]) provided the following files & directories linked to their destination:

- `config` → `~/.config/cower/config`

### htop — #68 ⇄ #80 (⊶ 952d502b)

↠ Initially `snwoblocks/htop` for [htop][] provided the following files & directories linked to their destination:

- `htoprc` → `~/.config/htop/htoprc`

### plank — #81 ⇄ #82 (⊶ 97e2182b)

↠ Initially `snwoblocks/plank` for [plank][archw-plank] provided the following files & directories linked to their destination:

- `igloo/launchers` → `~/.config/plank/igloo/launchers`
- `archbook/launchers` → `~/.config/plank/archbook/launchers`
- `themes` → `~/.config/plank/themes/igloo`

This includes application launchers for the host specific `igloo` and `archbook` profiles and a minimal, non-obstructive theme called `igloo` with a transparent background and no shadow- and glow effects.

Over the time the `plank` _snowblock_ evolved through the following changes:

1. **Removed GNOME Nautilus `.desktop` file** #118 (⊶ 7125312e)
   ↠ See the changelog section of _XDG_ for more details.

2. **Custom _JetBrains IntelliJ IDEA Ultimate_ editor desktop launcher** #203 (⊶ d4f474eb)
   ↠ See the changelog section of _XDG_ for more details.

3. **Removed _Google Chrome_ from desktop app launcher** #205 (⊶ 1c969ff9)
   ↠ Since the re-switch to Firefox in #139, _Google Chrome_ is only used for compatibility tests for projects like web apps and websites (_React_, _Gatsby.js_ etc.) as well as private session when using web apps especially build for Google Chrome's APIs/web capabilities.

4. **Replaced/Updated `archbook` with new `iceowl` host** #143, #131 (⊶ c08ca24c)
   ↠ There were [various _snowblock_/_snowflake_ configurations that contained the `archbook` host](https://github.com/search?l=&q=archbook+repo%3Aarcticicestudio%2Figloo+created%3A%3E2018-09-18&type=Code) which doesn't exist anymore and has been replaced in most cases with the new `iceowl` host. In cases where the _snowblock_/_snowflake_ is only targeted for Linux the `archbook` host has been removed to make it independent from the host. They can be updated when a new Linux host might be introduced.

### tilix — #70 ⇄ #83 (⊶ 5c12e6cd)

↠ Initially `snwoblocks/tilix` for [Tilix][] provided the following files & directories linked to their destination:

- `bookmarks.json.igloocrypt` → `~/.config/tilix/bookmarks.json`

Also includes a [dconf][] dump of the current system configurations. See [gnunn1/tilix#571][gnunn1/tilix#571] for more details.

Over the time the `tilix` _snowblock_ evolved through the following changes:

1. **Updated and extended bookmarks** #119 (⊶ 962bc284)
   ↠ Updated some paths of bookmarks that were not up-to-date and added some that were missing.

2. **Replaced/Updated `archbook` with new `iceowl` host** #143, #131 (⊶ c08ca24c)
   ↠ There were [various _snowblock_/_snowflake_ configurations that contained the `archbook` host](https://github.com/search?l=&q=archbook+repo%3Aarcticicestudio%2Figloo+created%3A%3E2018-09-18&type=Code) which doesn't exist anymore and has been replaced in most cases with the new `iceowl` host. In cases where the _snowblock_/_snowflake_ is only targeted for Linux the `archbook` host has been removed to make it independent from the host. They can be updated when a new Linux host might be introduced.

### tmux — #66 ⇄ #92 (⊶ 56595bde)

↠ Initially `snwoblocks/tmux` for [tmux][] provided the following files & directories linked to their destination:

- `tmux.conf` → `~/.tmux.conf`

If the _tmux_ plugin manager [tpm][] doesn't exist it will be [downloaded automatically][tmux-docs-autodown].
Also see the [“tmux“ Arch Linux Wiki page][archw-tmux] for more details.

### NPM — #95 ⇄ #96 (⊶ a916aa17)

↠ Initially `snwoblocks/npm` for [NPM][] provided the following files & directories including

- the [`.npmrc` configuration file][npm-docs-rc] to define the [`npm init`][npm-docs-config] options
  - `init-author-name`
  - `init-author-email`
  - `init-author-url`
  - `init-version`
  - `init-license`
- the `package-lock` option with `false` to disable the generation of the [`package-lock.json`][npm-docs-pkg-lock] file.
- the `save-exact` option to always save the exact dependency versions in the [`package.json`][npm-docs-pkg].

Over the time the `npm` _snowblock_ evolved through the following changes:

1. **Enable NPM's package-lock feature** #142 (⊶ 22635a83)
   ↠ The [`package-lock.json`][npm-docs-pkg-lock] file was disabled in the global [`npmrc`][npm-docs-rc] file since it hasn't been used due to a various problems regarding merge conflicts and unintended transitive dependency updates on each `npm install`. These problems have been fixed in later NPM release versions. This allows to use this feature again to ensure stable and reproducible builds.

2. **Replaced/Updated `archbook` with new `iceowl` host** #143, #131 (⊶ c08ca24c)
   ↠ There were [various _snowblock_/_snowflake_ configurations that contained the `archbook` host](https://github.com/search?l=&q=archbook+repo%3Aarcticicestudio%2Figloo+created%3A%3E2018-09-18&type=Code) which doesn't exist anymore and has been replaced in most cases with the new `iceowl` host. In cases where the _snowblock_/_snowflake_ is only targeted for Linux the `archbook` host has been removed to make it independent from the host. They can be updated when a new Linux host might be introduced.

### atom — #106 (⊶ 528383c5)

↠ Initially `snwoblocks/atom` for [Atom][] provided the following files & directories linked to their destination:

- `config.cson` → `~/.atom/config.cson`
- `keymap.cson` → `~/.atom/keymap.cson`
- `project-folder.cson` → `~/.atom/project-folder.cson`
- `packages.cson` → `~/.atom/packages.cson`

This includes

- the main [CSON based condifuration][atom-docs-custom#cson_conf] file
- the [keymapping configuration][atom-docs-keymap] file

Support for the [package-sync][atom-pkg-package-sync] package is provided through the `packages.cson` file including all installed packages. The `project-folder.cson` configuration file for the [project-folder][atom-pkg-project-folder] package contains all necessary group entries.

Over the time the `atom` _snowblock_ evolved through the following changes:

1. **Color Profile** #115 (⊶ dc4d22d6)
   ↠ Atom 1.28 introduced [support for custom ICC color profiles][atom-blog-rln-1.28#color_profile] based on the upgrade to Electron 2.x which in turn is based on the latest Chrome version. This version includes changes to the color rendering and now respects the color profile configured in the OS settings.
   Due to this change for many users the [colors appear to be pale][atom/atom#17356]. To bring back the previous (more stronger) color rendering Atoms _Core_ → „Color Profile“ has been changed from „Use color profile configured in the operating system“ to „Use sRGB color profile“.

   <div align="center"><strong>With OS color profile</strong><br><img src="https://user-images.githubusercontent.com/7836623/45257088-b05fae80-b3a0-11e8-903e-2ad4a41489a4.png" /></div>
   <div align="center"><strong>With sRGB color profile</strong><br><img src="https://user-images.githubusercontent.com/7836623/45257095-d1c09a80-b3a0-11e8-9fc9-7ec0494386ff.png" /></div>

<div align="center"><img src="https://www.rust-lang.org/logos/rust-logo-blk.svg?sanitize=true" /></div>

2. **Rust support: `language-rust` package** #121 (⊶ 11ca4319)
   ↠ Added support for [Rust][] via the [language-rust][atom-pkg-language-rust] community package.

3. **New project paths** #122 (⊶ bb196345)
   ↠ Added groups for the new project paths:

   - **communikey**: `~/code/github/repositories/communicode/*`
   - **NPM**: `~/yggdrasil/npm/*`
   - **snowsaw**: `~/yggdrasil/snowsaw`

4. **Include default package configuration keys** #124 (⊶ 7554efce)
   ↠ Before the configuration keys were initialized with the default value were not added to user's `~/.atom/config.cson`. To ensure the same Atom setup even when some default values are changed these have been included in the `config.cson`. This also includes keys for all core and community packages.

5. **Atom IDE** #151 ⇄ #158 (⊶ 39707355)
   ↠ Added the [Atom IDE][atom-ide] base package [atom-ide-ui][atom-pkg-atom-ide-ui] and the [ide-typescript][atom-pkg-ide-typescript] package for JavaScript (Babel, ES6, React etc.) and Typescript.

6. **Atom IDE - Don't show debugger when setting breakpoints** #166 (⊶ 360f7140)
   ↠ By default, when [setting a breakpoint][nuclide-docs-bp] the [debugger][nuclide-docs-db] was shown automatically. Sometimes this was not the desired goal (e.g. by accidentally setting a breakpoint) and has been disabled.

7. **Keymap to move caret to the end/start of the current line** #167 (⊶ 360fb8b1)
   ↠ To simply move the caret to the end/start of the current line instead of using the <kbd>end</kbd> and <kbd>pos</kbd> keys a new mapping has been added for Linux based OS:
   - **Move to the end of the current line**: <kbd>Ctrl</kbd> (super) + <kbd>alt</kbd> + <kbd>→</kbd>
   - **Move to the start of the current line**: <kbd>Ctrl</kbd> (super) + <kbd>alt</kbd> + <kbd>←</kbd>
     The default mappings <kbd>⌘</kbd> + <kbd>⌥</kbd> + <kbd>←</kbd> / <kbd>→</kbd> for macOS are already provided by default.

### taskwarrior — #107 (⊶ c6534e63)

↠ Initially `snwoblocks/taskwarrior` for [Taskwarrior][] provided the following files & directories linked to their destination:

- `taskrc` → `~/.taskrc`
- `nord.theme` → `~/.task/nord.theme`

This includes the _key=value_ based [`.taskrc` configuration][taskwarrior-docs-conf] file and a [Nord][] based color theme to be included in `.taskrc`.

- **Context** — The [context][taskwarrior-docs-cx] feature is used to separate all public projects and private/job related tasks.
- **UDA (User Defined Attributes)** — The [UDA][taskwarrior-docs-uda] feature is used to create custom attributes to add a assignee, a estimation value and the GitHub issue ID to a task.
- **Reports** — The [reports][taskwarrior-docs-r] feature is used to extend and optimize the task output. The custom report should be set to `default.command` to replace the default `next` report.
- **Aliases** — The config contains aliases to align with the alias workflow of other _snowblocks_ like _bash_ and _Git_. This improves the usability, because there are several commands that start with the same characters making it slower to be used with the auto completion:
  - `a` :arrow_right: `add`
  - `bd` :arrow_right: `burndown.daily`
  - `cx` :arrow_right: `context`
  - `e` :arrow_right: `edit`
  - `ls` :arrow_right: `list`
  - `mod` :arrow_right: `modify`
- **Alternative workflows** — The _Taskwarrior_ workflow is changed later on to use multiple databases per use-case like e.g. one database per project to make better use of the features like _projects_, _tags_ and _context_ with finer grained filters.

Over the time the `taskwarrior` _snowblock_ evolved through the following changes:

1. **Time tracking hooks** #108 (⊶ 2e541f5e)
   ↠ Created two hooks to track the duration a task was active. Both hooks are written in Python 3 and require a Taskwarrior version `>=2.4`.

   - **With `totalactivetime` UDA** — The first hook makes use of a new UDA called `totalactivetime` of type `duration` which stores the total time in seconds. Every time a task gets stopped the value gets added to the old value. To simplify the communication with the [Taskwarrior Hook v2 API][taskwarrior-docs-hooks2] the hook uses the [taskw][pypi-taskw] Python package which provides the bindings for Python.
     **Note: This requires [taskw][pypi-taskw] as a direct dependency and must be installed on the target system!** The package is [available from the AUR][aur-python-taskw].
   - **Taskwarrior integration** — The second hook is a fork from the [official Taskwarrior `on-modify.taskwarrior` hook][timewarrior-hook-on-modify]. It comes bundled with _Taskwarrior_, but can not be used via symlink, because the file is owned by the `root` user which prevents the script from being executed when symlinked.
     The usage of the hook is also [documented in the official Timewarrior docs][taskwarrior-docs-tw_int].

2. **taskopen integration** #110 (⊶ 759fdc69)
   ↠ Integrated [taskopen][] by adding the main [`.taskopenrc` configuration][taskopen#conf] file and aliases to simply adding notes (`an`) and open (`o`) task notes/annotations.

3. **More than one active task** #117 (⊶ 8d013adc)
   ↠ The default _Taskwarrior_ limit of active tasks is one. However, there are many use cases where multiple active tasks must be used, e.g. when working on an GitHub issue and the associated PR which are both handled in separate tasks or when working on tasks that are dependent on other tasks.
   The limited has therefore been increased to allow to use _Taskwarrior_ for such use cases without having to deal with limitation errors.

4. **taskopen workaround support for macOS** #134,#131,#110 (⊶ 47af7adc)
   ↠ The management of installed [Perl modules][cpan-doc-modules] on macOS is not as simple and well thought through like the concept of package managers on Linux systems, e.g. via [pacman][] on [Arch Linux][archlinux]. There are problems when is comes to configuring the runtime path the modules have been installed to even when using the most popular module manager called [cpanminus][]. This causes the [Taskwarrior][] plugin [taskopen][] fail to load because the Perl core module `JSON` can't be found and loaded.
   As a workaround a custom script has been implemented to create and open a attached note of an task:

   1. Use the [`_get`][taskwarrior-doc-api-_get] function of the [Taskwarrior DOM API][taskwarrior-doc-dom-api] to extract any stored piece of information of an task. This allows to receive the [UUID of an task][taskwarrior-doc-ids].
   2. Create a custom `on` (open note) [Taskwarrior alias][taskwarrior-doc-alias] to run the implemented custom script via the `execute` command.

   The logic of the script follows the same like taskopen uses for default notes:

   - Use the [UUID of an task][taskwarrior-doc-ids] as the note filename.
   - Simply pass the file to an editor (in this case [Atom][]) which will…
   - …create a new file if it doesn't exist yet.
   - …open the file if it already exists.

   Note that **this script is not limited to macOS** but can also be used for any other Linux host! It is only necessary to use it on macOS due to the problems described above.

5. **Link whole Taskwarrior "hooks" and "scripts" folders** #201 (⊶ 961293ba)
   ↠ Instead of linking single files from the `hooks` and `scripts` Taskwarrior folders both folders are now linked directly.

6. **Use single VS Code instance to open task notes** #202 (⊶ e9c04c6f)
   ↠ When opening a task note, it is now made sure to add it to the already opened VS Code instance instead of opening a new one by using VS Code's `reuse-window` CLI flag.

7. **Replaced/Updated `archbook` with new `iceowl` host** #143, #131 (⊶ c08ca24c)
   ↠ There were [various _snowblock_/_snowflake_ configurations that contained the `archbook` host](https://github.com/search?l=&q=archbook+repo%3Aarcticicestudio%2Figloo+created%3A%3E2018-09-18&type=Code) which doesn't exist anymore and has been replaced in most cases with the new `iceowl` host. In cases where the _snowblock_/_snowflake_ is only targeted for Linux the `archbook` host has been removed to make it independent from the host. They can be updated when a new Linux host might be introduced.

### timewarrior — #109 (⊶ 15688f30)

↠ Initially `snwoblocks/timewarrior` for [Timewarrior][] provided the following files & directories linked to their destination:

- `timewarrior.cfg.archbook`, `timewarrior.cfg.igloo` → `~/.timewarrior/timewarrior.cfg`
- `nord.theme` → `~/.timewarrior/nord.theme`

This includes the [`timewarrior.cfg` configuration][timewarrior-docs-conf] files for the `igloo` and `archbook` hosts as well as a [Nord][] based [color theme][timewarrior-docs-themes] that is imported imported in the `timewarrior.cfg` file.
The default `day` reports should include the month name and week number.

Over the time the `timewarrior` _snowblock_ evolved through the following changes:

1. **Timewarrior config for iceowl (macOS support)** #144,#131 (⊶ c1fdba9e)
   ↠ Created a new configuration for the new `iceowl` host due to the usage of absolute paths in the configuration previous files of [Timewarrior][]. This requires a configuration per host, e.g. for different paths to the used color theme.

2. **Replaced/Updated `archbook` with new `iceowl` host** #143, #131 (⊶ c08ca24c)
   ↠ There were [various _snowblock_/_snowflake_ configurations that contained the `archbook` host](https://github.com/search?l=&q=archbook+repo%3Aarcticicestudio%2Figloo+created%3A%3E2018-09-18&type=Code) which doesn't exist anymore and has been replaced in most cases with the new `iceowl` host. In cases where the _snowblock_/_snowflake_ is only targeted for Linux the `archbook` host has been removed to make it independent from the host. They can be updated when a new Linux host might be introduced.

### GPG — #130 (⊶ 1f3815e7)

↠ Initially `snwoblocks/gpg` for [GPG][] provided the following files & directories linked to their destination:

- `gpg.conf` → `~/.gnupg/gpg.conf`

This includes the [`gpg.conf`][gpg-doc-conf] configuration file and the [`gpg-agent.conf`][gpg-doc-conf-agent] file for the _gpg-agent_.

### launchd — #133, #131, #58 (⊶ 6cf24792)

↠ Initially `snwoblocks/launchd` for [launchd][] ([FreeBSD Wiki][freebsd-wiki-launchd]) provided the following files & directories linked to their destination:

- `com/arcticicestudio/igloo/launchd/igloosync/com.arcticicestudio.igloo.launchd.igloosync-dropbox.plist` → `~/Library/LaunchAgents/com.arcticicestudio.igloo.launchd.igloosync-dropbox.plist`
- `com/arcticicestudio/igloo/launchd/igloosync/igloosync-dropbox.sh` → `~/Library/LaunchAgents/igloosync-dropbox.sh`

This includes a user agent defining a job to auto-mount the `sync` [gocryptfs][] volume located in the [Dropbox][] folder receiving the password stored in the [macOS Keychain][apple-docs-keychain] via the macOS builtin system CLI tool `security`.
The documentation describes the requirements for the `com.arcticicestudio.igloo.launchd.igloosync` agent. It contains information about dependencies and how to create the required `gocryptfs` password stored- and received via the macOS builtin system CLI tool `security`.

Note that this is a _macOS_ specific _snowblock_ and therefore the `com.arcticicestudio.igloo.launchd.igloosync-dropbox.plist` agent file is only linked for the currently only _macOS_ host `iceowl`.

See the knowledge base at [launchd.info][] for more details as well as the available _man_ pages `launchd(1)`, `launchd.plist(5)` and `security(1)`.

### Docker — #136, #131 (⊶ 0876c2c9)

↠ Initially `snwoblocks/docker` for [Docker][] provided the following files & directories linked to their destination:

- `config.iceowl.json` → `~/.docker/config.json`

This includes `config-<HOST>.json` configuration files where `<HOST>` is the name of the target host. The `iceowl` host has the `credsStore` field with the `osxkeychain` value to ensure the _macOS Keychain_ is used to store tokens instead of saving them as plain text into the config file.

### pip — #141, #131 (⊶ f5d6ff48)

↠ Initially `snwoblocks/pip` for [pip][] provided the following files & directories linked to their destination:

- `pip.conf` → `~/.config/pip/pip.conf`
- `requirements.iceowl.txt` → `~/.config/pip/requirements.txt`

This includes the [`requirements.txt`][pip-docs-requirements] file to track [installed packages][python-docs-install-reqs] and their versions and the [`pip.conf`][pip-docs-config-file] file for user specific configurations.
See the documentation about the [requirements.txt file format][pip-docs-req-file-format] for more details.

### Firefox — #139 (⊶ 505e3407)

↠ Initially `snwoblocks/firefox` for [Firefox][] and [Firefox Developer Edition][firefox-dev-edition] provided the following files & directories linked to their destination:

- `chrome` → `~/.mozilla/firefox/igloo/chrome`, `~/Library/Application Support/Firefox/Profiles/igloo/chrome`
- `containers.json` → `~/.mozilla/firefox/igloo/containers.json`, `~/Library/Application Support/Firefox/Profiles/igloo/containers.json`
- `ignore-dev-edition-profile` → `~/.mozilla/firefox/ignore-dev-edition-profile`, `~/Library/Application Support/Firefox/ignore-dev-edition-profile`
- `profiles.iceowl.ini` → `~/Library/Application Support/Firefox/profiles.ini`
- `profiles.igloo.ini` → `~/.mozilla/firefox/profiles.ini`
- `user.js` → `~/.mozilla/firefox/igloo/user.js`, `~/Library/Application Support/Firefox/igloo/user.js`

This includes…

- …the [`user.js`][mozkb-user.js] file to define and persist almost all preferences for a profile.
- …the [`profiles.ini`][mozkb-profiles.ini] file to configure the name and path of the main profile `igloo`.
- …the `ignore-dev-edition-profile` file to fix [Bugzilla bug 1098986][bugzilla-1098986] that causes Firefox Developer Edition to use the internal default profile regardless of whether another customized profile has been set as default. The problem can be fixed by creating the file within the Firefox application data folder.

- …the `chrome` folder with the [`userChrome.css`][mozkb-userchrome.css] and [`userContent.css`][mozkb-usercontent.css] files to change the Firefox's UI components design and elements within the content.
- …the `containers.json` file of the [Firefox Multi-Account Containers][firefox-addon-multi-acc-cont] to persist the configured containers.
- …the documentation about the setup, tips & tricks and various configurations.

See [pyllyukko/user.js][pyllyukko/user.js] for another _Firefox_ `user.js` configuration file designed to harden browser settings and make it more secure as well as [ghacks-user.js][] which is an ongoing comprehensive `user.js` template for configuring and hardening Firefox privacy, security and anti-fingerprinting.

Over the time the `firefox` _snowblock_ evolved through the following changes:

1. **Disable third-party APIs for more privacy** #153 ⇄ #160 (⊶ e622889b)
   ↠ To improve the privacy some more third-party APIs have been disabled:

   - Set `browser.aboutHomeSnippets.updateUrl` to `""` — Disables third-party API requests on new tab page for snippets widget.
   - Set `browser.newtabpage.directory.source` to `""` — Also improves the privacy by removing requests against third-party APIs.

2. **Fixed tabs not rendered in titlebar** #154 ⇄ #161 (⊶ 9c6a97d1)
   ↠ The `browser.tabs.drawInTitlebar` key is set to `false` which caused the tabs to being rendered in the titlebar.

3. **Disabled fullscreen warning popup** #155 ⇄ #162 (⊶ 924d4953)
   ↠ The fullscreen warning popup has been disabled by setting the `full-screen-api.warning.timeout` key to `0`.

4. **Disabled fullscreen warning popup** #156 ⇄ #163 (⊶ c7c1f898)
   ↠ Moved the badge of the [test pilot][firefox-testpilot-exp-color] addon [Firefox Color][firefox-color] into the overflow menu.

5. **Disabled “Find As You Type“** #164 (⊶ e82e8821)
   ↠ The [“Find As You Type“][mozkb-accesb-typeaheadfind] feature (UI path: _Preferences_ → _General_ → _Browsing_ → _Search for text when you start typing_) has been disabled. It allows to search the current site as soon as a key is pressed instead of requiring to press <kbd>Ctrl</kbd>/<kbd>⌘</kbd> + <kbd>f</kbd>. This is a great accessibility improvement, but unfortunately this often collides with page features like hotkeys e.g. when pressing <kbd>r</kbd> on [Octobox][] to sync the latest notifications or any other site using such features.

6. **Always open bookmarks in a new tab in the background** #165 (⊶ 6826f9cb)
   ↠ By default, opening a bookmark from the sidebar uses the current active tab. The `browser.tabs.loadBookmarksInTabs` has been set to `true` to always open bookmarks in a new tab in the background.

7. **Fixed invalid path for Firefox `user.js` file on macOS** #175 (⊶ eb222438)
   ↠ The path for the custom Firefox [`user.js` file][mozkb-user.js] file was invalid for macOS hosts. It did not contain the `Profiles` directory causing a symlink to a path where the file won't be read by _Firefox_.

8. **“light“ as default UI theme** #224 (⊶ a02a48a1)
   ↠ The builtin “light“ UI theme is now used by default with the “normal“ density. The theme is provided by the bundled `firefox-compact-light@mozilla.org` extension.

9. **Disable automatic crash report sending** #217 ⇄ #229 (⊶ 82bee46a)
   ↠ To improve the privacy and security the automatic sending of crash reports has been disabled by setting `browser.tabs.crashReporting.sendReport` to `false`.

10. **"Standard" option for "Enhanced Tracking Protection" browser privacy preferences** #218 ⇄ #230 (⊶ 379c9659)
    ↠ The _Standard_ option for the [Enhanced Tracking Protection][mozs-enhc_track_protc] (stats are available at `about:protections`) preference comes with good defaults configuration and is therefore used instead of the _Custom_ option to also prevent sites from breaking due to cookie blocking.

11. **“Simple Tab Groups“ add-on** #219 ⇄ #231 (⊶ b279caa1)
    ↠ The [Simple Tab Groups][firefox-addon-stg] add-on allows to „create, modify, and quickly change tab groups” and is a port of one of the best Firefox extensions that were available before _Firefox Quantum_.
    To adapt it the add-on icon has been added to the top bar for quick access and the add-on preferences adjusted.

12. **Enabled more `about:debugging` options by default** #220 ⇄ #232 (⊶ 3f92ab9f)
    ↠ The [`about:debugging` page][mdm-about-debugging] allows to debug processes, tabs and local add-ons. These options are disabled by default and has therefore been enabled in order to extend the ways to debug features.

13. **Automatic page reload for touch simulation in responsive design mode** #222 ⇄ #234 (⊶ 95655f18)
    ↠ When using the [Responsive Design Mode][mdn-tools-resp_design_mode] and the _touch simulation_ gets activated it requires the page to reload in order to work properly. Firefox provides an option to automatically run this task and has now been enabled by default.

14. **Disable automatic execution pause on script exceptions** #221 ⇄ #233 (⊶ 7e0d3175)
    ↠ When the _DevTools_ are opened and an exceptions occurs in any running script, the debugger will be opened and the execution paused. This is kind of annoying for third-party scripts or when the actual goal is not to debug scripts at all and has therefore been disabled.

15. **Show CSS grid line numbers** #223 ⇄ #235 (⊶ 25e05122)
    ↠ To allow to better design and debug [CSS grids][css-tricks-grid_guide] the Firefox _DevTools_ can [visually show the grid line numbers][mdm-inspect-grid#line_num]. This option is disabled by default and has therefore been enabled.

16. **“Inter“ as base sans-serif typeface** #225 ⇄ #236 (⊶ 8ea0ef06)
    ↠ It is currently [required to manually configure the sans-serif typeface based on the running OS](https://github.com/arcticicestudio/igloo/tree/eb222438e6cd93b19c222043570bb7c627ea3e3b/snowblocks/firefox#typeface) due to licensing and the availability of specific font families on different operating systems. Since I use the fantastic [Inter][] typeface family for almost all UI, text and designs it has now also been set as default sans-serif typeface. Inter is open source and therefore system independent and is installed in all of my systems/habitats.

17. **“Soft“ and USB WebAuthn development options** #226 ⇄ #237 (⊶ 87e6b1d0)
    ↠ In order to allow and simplify the development and testing of [WebAuthn][] based apps and websites, the security [options must be set to allow “soft tokens“][webauthn.bin.coffee-ff58].
    Also see the section about [requirements for testing][mozw-sec-webauthn#test_req] of the Mozilla “Security/QA/TestPlans/Web Authentication“ wiki page for more details.

18. **Disable password generation suggestion for password fields** #227 ⇄ #238 (⊶ d8905100)
    ↠ _Firefox_ comes with generally great security features like [Firefox Lockwise][firefox-lockwise], but the [suggestion to generate a new random password when focusing a password field][mozw-toolkit-passman-gen] is kind of annoying and not necessary due to the usage of a password manager that includes a password generator. It has therefore been disabled.

19. **Enable “legacy“ user profile customizations** #228 ⇄ #239 (⊶ d664ea09)
    ↠ [As of Firefox version 69, the `userChrome.css` and `userContent.css` files are not loaded by default anymore][moz-ff-rln-69.0#chrome] in order to improve the performance during browser startup. Also see the documentation about [Firefox breaking changes of `userChrome.css`][userchrome-ff_changes_chrome].
    To achieve the previous behavior, the option to load such “legacy“ files has been enabled again.

### Jetbrains — #137 (⊶ 2fa3d1d5)

↠ Initially `snwoblocks/jetbrains` for [JetBrains][] IDEs and products provided the following files & directories linked to their destination:

- `codestyles/arctic-codestyle.xml` → `~/.IntelliJIdea2018.2/codestyles/arctic-codestyle.xml`, `~/Library/Preferences/IntelliJIdea2018.2/codestyles/arctic-codestyle.xml`
- `inspection/arctic-inspections.xml` → `~/.IntelliJIdea2018.2/inspection/arctic-inspections.xml`, `~/Library/Preferences/IntelliJIdea2018.2/inspection/arctic-inspections.xml`
- `keymaps/arctic-keymap.macos.xml` → `~/.IntelliJIdea2018.2/keymaps/arctic-inspections.xml`, `~/Library/Preferences/IntelliJIdea2018.2/keymaps/arctic-keymap.macos.xml`
- `options/code.style.schemes.xml` → `~/.IntelliJIdea2018.2/options/code.style.schemes.xml`, `~/Library/Preferences/IntelliJIdea2018.2/options/code.style.schemes.xml`
- `options/colors.scheme.xml` → `~/.IntelliJIdea2018.2/options/colors.scheme.xml`, `~/Library/Preferences/IntelliJIdea2018.2/options/colors.scheme.xml`
- `options/customization.xml` → `~/.IntelliJIdea2018.2/options/customization.xml`, `~/Library/Preferences/IntelliJIdea2018.2/options/customization.xml`
- `options/editor.codeinsight.xml` → `~/.IntelliJIdea2018.2/options/editor.codeinsight.xml`, `~/Library/Preferences/IntelliJIdea2018.2/options/editor.codeinsight.xml`
- `options/editor.xml` → `~/.IntelliJIdea2018.2/options/editor.xml`, `~/Library/Preferences/IntelliJIdea2018.2/options/editor.xml`
- `options/ide.general.xml` → `~/.IntelliJIdea2018.2/options/ide.general.xml`, `~/Library/Preferences/IntelliJIdea2018.2/options/ide.general.xml`
- `options/keymap.xml` → `~/.IntelliJIdea2018.2/options/keymap.xml`, `~/Library/Preferences/IntelliJIdea2018.2/options/keymap.xml`
- `options/laf.xml` → `~/.IntelliJIdea2018.2/options/laf.xml`, `~/Library/Preferences/IntelliJIdea2018.2/options/laf.xml`
- `options/options.xml` → `~/.IntelliJIdea2018.2/options/options.xml`, `~/Library/Preferences/IntelliJIdea2018.2/options/options.xml`
- `options/project.default.xml` → `~/.IntelliJIdea2018.2/options/project.default.xml`, `~/Library/Preferences/IntelliJIdea2018.2/options/project.default.xml`
- `options/ui.lnf.xml` → `~/.IntelliJIdea2018.2/options/ui.lnf.xml`, `~/Library/Preferences/IntelliJIdea2018.2/options/ui.lnf.xml`
- `disabled_plugins.txt` → `~/.IntelliJIdea2018.2/disabled_plugins.txt`, `~/Library/Preferences/IntelliJIdea2018.2/disabled_plugins.txt`

These are important configurations for all used _JetBrains_ IDEs and products which are currently [IntelliJ][] (Ultimate Edition) and [GoLand][]. For details about the paths see the documentation about [directories used by the IDE to store settings, caches, plugins and logs][jb-docs-settings_paths].

It includes…

- …the [code style][jb-docs-code-style] XMl configuration file stored in the `codestyles` folder.
- …the [inspections][jb-docs-inspections] XMl configuration file stored in the `inspections` folder.
- …the [keymaps][jb-docs-keymap] XMl configuration files for Linux and macOS stored in the `keymaps` folder.
  See the [keymap reference][jb-docs-keymap_refs] for a visual presentation of the default mappings.
- …the [preferences][jb-docs-prefs] XMl configuration files stored in the `options` folder:
  - `code.style.schemes.xml` - settings of the currently used code style.
  - `colors.scheme.xml` - settings of the currently used color scheme.
  - `customization.xml` and `project.default.xml` - settings of the customized [menus and toolbars][jb-docs-menu_toolbar].
  - `editor.codeinsight.xml` - settings of various automatic code transformations.
  - `keymap.xml` - the currently used keymap.
  - `laf.xml` and `ui.lnf.yml` - settings of the currently used UI theme.
  - all other customized preferences defined in the various categories: `editor.xml`, `ide.general.xml` and `options.xml`
- …the list of [disabled plugins][jb-docs-plugins] stored in the `disabled_plugins.txt` file.

Since _JetBrains_ uses a naming scheme for user configuration folders based on the product major/minor version it is necessary to update the _snowblock_ as soon as the product gets updated to adapt to the new version string.
Due to this naming scheme for the target path of previous targets should be kept for the `clean` and `link` tasks to ensure these are cleaned up after updating to a new product version.

Over the time the `jetbrains` _snowblock_ evolved through the following changes:

1. **IntelliJ 2018.3.5** #182 (⊶ 7e270eb0)
   ↠ Before the target version was _IntelliJ 2018.2_ which has been updated to the latest version _IntelliJ 2018.3.5_. This includes new configurations as well as the obligatory adjustment for the correct target paths `~/.IntelliJIdea2018.3` (Linux) and `~/Library/Preferences/IntelliJIdea2018.3` (macOS).

2. **IntelliJ IDEA 2019.1** #193 (⊶ d5ac5d06)
   ↠ Updated the previously used target version _IntelliJ 2018.3_ to the latest version [IntelliJ 2019.1][jb-blog-intellij_2019.1]. This includes the obligatory adjustment for the correct target paths `~/.IntelliJIdea2018.3` (Linux) and `~/Library/Preferences/IntelliJIdea2018.3` (macOS).
   Also removed the disabled [CVS][] and [TFS][wiki-tfs] plugins since they are [no longer officially supported and not bundled with IntelliJ IDEA anymore][jb-blog-unbundle_tfs_cvs_plug].

3. **No _Go_ package clipboard detection** #194 (⊶ a3d062a5)
   ↠ Disabled the detection of _Go_ packages fom the clipbaord, e.g. GitHub URLs, to avoid the noise of notifications/popups that asks to install the package as well as improving privacy during the usage of _JetBrains_ products. There is absolute no need to `go get` since Go 1.11+ is used with [_Go Modules_][go-ghwiki-mods].

4. **`goimports` for _Go_ import auto formatting** #195 (⊶ 8a02ae76)
   ↠ To improve the formatting and adhere to _Arctic Ice Studio_'s _Go_ code style [`goimports][godoc-x-tools-cmd-goimports] is now used to automatically format imports:

   - Only use one import declaration.
   - Use of the `-local` flag to put imports local imports after 3rd-party packages.
   - Move all stdlib imports into one group.
   - Sort all imports.

5. **IntelliJ IDEA 2019.2** #211 (⊶ 007a3c8c)
   ↠ Updated the previously used target version _IntelliJ 2019.1_ to the latest version [IntelliJ 2019.2][jb-blog-rln-2019.2]. This includes the obligatory adjustment for the correct target paths `~/.IntelliJIdea2019.1` (Linux) and `~/Library/Preferences/IntelliJIdea2019.1` (macOS).
   Also see _JetBrains_ [“What's New“][jb-new-2019.2] page for a summary of the largest changes and features.

6. **Fixed invalid JetBrains symlink target parent paths on Linux hosts** #212 (⊶ 86a06411)
   ↠ On macOS the _JetBrains_ configuration files are placed right into the main `IntelliJIdea2019.2` directory while on Linux based systems the folder consists of the sub-folders `cache`, `config` and `system` that can also be configured in the `idea64.properties` file.
   Before the target path was also the main `~/.IntellihJIdea2019.2` directory, but files must be linked into the nested `config` folder instead.

7. **IntelliJ IDEA 2019.3** #216 (⊶ 2623363e)
   ↠ Updated the previously used target version _IntelliJ 2019.2_ to the latest version [IntelliJ 2019.3][jb-blog-rln-2019.3]. This includes the obligatory adjustment for the correct target paths `~/.IntelliJIdea2019.2` (Linux) and `~/Library/Preferences/IntelliJIdea2019.2` (macOS).
   Also see _JetBrains_ [“What's New“][jb-new-2019.3] page for a summary of the largest changes and features.

### Visual Studio Code — #179 (⊶ 8cebb084)

↠ Initially `snowblocks/visual-studio-code` for [Visual Studio Code][vscode] provided the following files & directories linked to their destination:

- `css` → `~/.vscode/css`
- `workspaces` → `~/.vscode/workspaces`
- `keybindings.json` → `~/.config/Code/User/keybindings.json`, `~/Library/Application Support/Code/User/keybindings.json`
- `locale.json` → `~/.config/Code/User/locale.json`, `~/Library/Application Support/Code/User/locale.json`
- `projects.json` → `~/.vscode/projects.json`
- `settings.json` → `~/.config/Code/User/settings.json`, `~/Library/Application Support/Code/User/settings.json`

<div align="center">
  <img src="https://user-images.githubusercontent.com/7836623/53287052-28ffcf00-3777-11e9-8f32-b8c71257560c.png" width="40%" />
</div>

#179 documents the migration from [Atom][] to [Visual Studio Code][vscode].
I've used Atom since it came out some years ago and it has always been a great editor and IDE for web development as well as main editor for documents, but _Visual Studio Code_ evolved a lot during the last year.

Compared to Atom there are many features and improvements that I've really liked to see for Atom. Even though it can be extended and modified a lot there are limitations due to Atom's core in aspects like performance, stability and overall development features like auto-completion and language-awareness.

_Visual Studio Code_ feels more “language-native“ when it comes to e.g. intelligent auto-completion, the integration of linters and language specific tools. It comes with support for a lot of languages out-of-the-box™ like _JavaScript_/_TypeScript_, _CSS_/_HTML_ and has basic support for native languages like _Go_ or _Rust_.

The change was not easy for me since I've customized and developed Atom to fit all of development needs, but after some testing time I had to admit that the UX of _Visual Studio Code_ feels way better now.

I made sure that all my beloved Atom packages are also available as _Visual Studio Code_ extensions (same code base) or an equivalent alternative before actually started the migration.

Therefore the initial setup now includes…

- …core and extension settings.
- …custom keybindings.
- …locale configurations.
- …a list of all installed extensions.
- …CSS stylesheets to customize some that'll be loaded by the [“Custom CSS and JS Loader“][vscode-ext-be5invis.custom-css] extension.
- …workspace files.

The initial setup comes with the following extensions:

- [Nord](https://marketplace.visualstudio.com/items?itemName=arcticicestudio.nord-visual-studio-code)
- [file-icons](https://marketplace.visualstudio.com/items?itemName=file-icons.file-icons)
- [Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
- [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)
- [Markdown Preview Enhanced](https://marketplace.visualstudio.com/items?itemName=shd101wyy.markdown-preview-enhanced)
- [Babel JavaScript](https://marketplace.visualstudio.com/items?itemName=mgmcdermott.vscode-language-babel)
- [vscode-styled-components](https://marketplace.visualstudio.com/items?itemName=jpoissonnier.vscode-styled-components)
- [Path Intellisense](https://marketplace.visualstudio.com/items?itemName=christian-kohler.path-intellisense)
- [Go](https://marketplace.visualstudio.com/items?itemName=ms-vscode.Go)
- [Docker](https://marketplace.visualstudio.com/items?itemName=PeterJausovec.vscode-docker)
- [YAML](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml)
- [EditorConfig](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig)
- [Projects+](https://marketplace.visualstudio.com/items?itemName=fabiospampinato.vscode-projects-plus)
- [Polacode](https://marketplace.visualstudio.com/items?itemName=pnp.polacode)
- [Custom CSS and JS Loader](https://marketplace.visualstudio.com/items?itemName=be5invis.vscode-custom-css)
- [Rust (rls)](https://marketplace.visualstudio.com/items?itemName=rust-lang.rust)
- [GraphQL](https://marketplace.visualstudio.com/items?itemName=Prisma.vscode-graphql)

Over the time the `visual-studio-code` _snowblock_ evolved through the following changes:

1. **“Code Spell Checker“ extension** #183 (⊶ 898aa45d)
   ↠ The [Code Spell Checker][vscode-ext-code-streetsidesoftware.spell-checker] extension checks for errors and also allows to include user-defined dictionaries.
   The initial commit added custom dictionaries with some common words as well as project and identity related words.

   <div align="center">
   <img src="https://dunstontc.gallerycdn.vsassets.io/extensions/dunstontc/viml/0.1.7/1527861710810/Microsoft.VisualStudio.Services.Icons.Default" width="80" />
   </div>

2. **_Vim_ script syntax highlighting** #184 (⊶ 2bf7227a)
   ↠ Added the [vscode-viml-syntax][vscode-ext-dunstontc.viml] extension for syntax highlighting in all _Vim_ script files.

3. **“Soft“ word wrap for _Markdown_ and _MDX_ documents** #185 (⊶ 4e990f15)
   ↠ Enabled “soft“ word wrapping to improve the readability of long sentences and paragraphs in _Markdown_ and _MDX_ documents.

4. **File associations for `Brewfile`** ##186 (⊶ 140a7476)
   ↠ The [`Brewfile`][homebrew/homebrew-bundle] of [Homebrew][] was not detected as _Ruby_ syntax so a association has therefore been added to map it to the `ruby` syntax type.

5. **File associations for `vimrc`** #191 (⊶ 330357d6)
   ↠ The [`vimrc`][vimdoc-start#rc] of [Vim][] was not detected as _Vim_ script syntax so a association has therefore been added to map it to the `viml` syntax type provided by the [vscode-viml-syntax][vscode-ext-dunstontc.viml] extension that was added in #184.

6. **_Prettier_ plugin as default formatter** #197 (⊶ b4546935)
   ↠ As of _Visual Studio Code_ version 1.33.x a notification is shown when there are multiple formatter found for the file type in the currently active editor. Since [Prettier][] supports most languages and is the de-factor standard tool the [Prettier plugin][vscode-ext-esbenp.prettier-vscode] has been set as editor default.
   When there are unsupported languages or languages like _Go_ which come with their own toolchain (`gofmt`, `goimports` etc.) the default formatter can be overridden through the languages-specific settings scopes.

7. **Reset zoom level back to 1** #198 (⊶ 259537d5)
   ↠ The UI window zoom level (`window.zoomLevel`) was set to `0.5` due to some configurations changes made to the global system resolution (4k rendering), but has now been changed back to the default value (`1`).

8. **_MDX_ extension** #199 (⊶ 9a0ac072)
   ↠ Added support for many [MDX][] features, syntax highlighting and bracket matching through the [_MDX_ extension][vscode-ext-silvenon.mdx] by _Matija Marohnić_.

9. **Switched icon theme** #196 (⊶ f0682871)
   ↠ Before the [Material Icon Theme][vscode-ext-equinusocio.vsc-material-theme-icons] by _Mattia Astorino_ was used because it provided slick folder icons with customizeable colors and a large set of file type icons with a flat style and pale/contrast-lowered colors making it a great match to my [Nord][vscode-ext-arcticicestudio.nord] theme.
   With the latest update the icons were changed to use bright contrast colors while the folder icons changed in a bad way too.
   Therefore I've decided to give the popular [Material Icon Theme][vscode-ext-pkief.material-icon-theme] by _Philipp Kief_ another try (last time it had the same style like the current theme after the latest update and way less customization options). It turned out the theme is more advanced in almost all points and provided a good UX and style:

   - Even larger amount of supported file types.
   - Multiple theme style accents.
   - **Customizable folder and file icon colors** through the `material-icon-theme.saturation` option to reduce the file color contrast and the `material-icon-theme.folders.color` & `material-icon-theme.folders.theme` options for the folders!
   - Arrows of folders can be hidden.
     Overall the theme full fills all my requirements and is therefore now used as default theme.

10. **Hide action buttons of sidebar panel headers** #200 (⊶ f77869b5)
    ↠ In #179 the [“Custom CSS and JS Loader“][vscode-ext-be5invis.vscode-custom-css] extension was introduced to use custom CSS stylesheets including styles to hide menu buttons from the editor.
    To hide the button of sidebar panel headers another selector has been added.

11. **Disabled breadcrumb navigation** #209 (⊶ 21f8c343)
    ↠ As of _Visual Studio Code_ version 1.35 the [breadcrumb navigation is enabled by default][vscode-rln-1.35#breadcrumbs]. They have been disabled again to unclutter the UI.

12. **Disabled indent guides in tree widget (Explorer)** #210 (⊶ 5cecacc2)
    ↠ As of _Visual Studio Code_ version 1.36 the [tree widget support visual indent guide lines][vscode-rln-1.36#tree_indent_guides] are enabled by default. They have been disabled again to unclutter the UI.

13. **Render whitespace characters only for selected text** #213 (⊶ d8a81414)
    ↠ Updated to the new `selection` value for the `editor.renderWhitespace` field introduced in _Visual Studio Code_ [1.37][vscode-rln-1.37#whitespace_select] that allows to only render whitespace characters on selected text.

    <div align="center"><img src="https://code.visualstudio.com/assets/updates/1_37/render-whitespace-on-selection.png" /></div>

14. **Hide _NPM Scripts Explorer_** #214 (⊶ 673e844e)
    ↠ Previously the builtin _NPM Script Explorer_ was hidden by default, but is visible by default as of _Visual Studio Code_ [1.37][vscode-rln-1.37#npm_script_expl] which was justified by the fact that it was „difficult to discover“.

    <div align="center"><img src="https://code.visualstudio.com/assets/updates/1_37/npm-scripts-explorer.png" /></div>

15. **Incremental naming of copied files/folders** #215 (⊶ a5093282)
    ↠ As of _Visual Stusio Code_ [1.37][vscode-rln-1.37] the automatic incremental naming for copied files that include numbers has been (silently) removed, but than added back as [_explorer improvement_ in version 1.38][vscode-rln-1.38#explo_impr] with two configuration options to either add a `copy` suffix or use a `smart` strategy. The second one adds a number at the end and if some number is already part of the name, it tries to increase that number. This reflects the behavior from VS Code versions `<1.38` and has therefore been set.

## _Snowflakes_

### systemd — #76 ⇄ #77 (⊶ 1eb5ffc9)

↠ Created the new [systemd][] _snowflake_ that includes

- documentations about [how to fix the instantaneous MacBook Pro (11,x) suspend wakeup problem after the lid has been closed][archw-mbp-11x#suspend].
- documentation about [how to configure the lid close behavior][archw-gnome-lid-behavior].
- a [custom suspend service][archw-suspend-service] implementation and documentation.
- a [`system-sleep` hook][archw-system-sleep-hook] implementation and documentation.

See [systemd.special(7)][freedesktop-systemd.special] and [systemd.sleep(8)][freedesktop-systemd.sleep] for more details.

Over the time the `systemd` _snowflake_ evolved through the following changes:

1. **Replaced/Updated `archbook` with new `iceowl` host** #143, #131 (⊶ c08ca24c)
   ↠ There were [various _snowblock_/_snowflake_ configurations that contained the `archbook` host](https://github.com/search?l=&q=archbook+repo%3Aarcticicestudio%2Figloo+created%3A%3E2018-09-18&type=Code) which doesn't exist anymore and has been replaced in most cases with the new `iceowl` host. In cases where the _snowblock_/_snowflake_ is only targeted for Linux the `archbook` host has been removed to make it independent from the host. They can be updated when a new Linux host might be introduced.

### buku — #138 (⊶ 38ec12d7)

↠ Initially `snowflakes/buku` for [buku][] provided the bookmarks of the used database exported as HTML file to allow to simply import it using Firefox as well as shell script that can be used to bootstrap a database.

The files are `igloocrypt` encrypted because they include sensitive data for private SSH servers as well as jo related bookmarks.

Over the time the `buku` _snowflake_ evolved through the following changes:

1. **Bookmarks September 2018** #152 ⇄ #159 (⊶ f021edf0)
   ↠ The regular bookmark update for September 2018.

   → Added

   - [React Top-Level API][react-docs-api] - The official docs of the React Top-Level API
   - [Modular Scale][modularscale] - A web app to calculate modular font scales
   - [Type Scale][type-scale] - Another web app to calculate modular font scales
   - [Cypress][cypress] - ast, easy and reliable testing for anything that runs in a browser.
   - [Let's Encrypt][letsencrypt] - A free, automated, and open Certificate Authority.
   - [Firefox Monitor][firefox-monitor] - Firefox Monitor arms you with tools to keep your personal information safe. Find out what hackers already know about you and learn how to stay a step ahead of them.
   - [Have I Been Pwned][haveibeenpwned] - Check if you have an account that has been compromised in a data breach.
   - [React Patterns][reactpatterns] - Collection of good React patterns.
   - [Hacktoberfest][hacktoberfest] - The yearly open source hackathon by Digital Ocean.
   - [BitPaper][bitpaper] - A collaborative whiteboard web app
   - [React Lifecycle Methods Diagram][react-lifecycle-methods-diagram] - A web app to visualize the React Lifecycle Methods also mentioned in the official React docs.
   - [oEmbed][oembed] - Specification for a format for allowing an embedded representation of a URL on third party sites.

   → Updated

   - [Atomic Design][atomicdesign] by Brad Frost
     - Removed the `/table-of-contents` path from the URL
     - Added new tags: `css-in-js`, `workflow`

2. **Bookmarks October 2018** #168 (⊶ dd80df52)
   ↠ The regular bookmark update for October 2018.

   → Added

   - [Expo][] - A free and open source toolchain built around React Native to help you build native iOS and Android projects using JavaScript and React.
   - [unpkg][] - A fast, global content delivery network for everything on npm to quickly and easily load any file from any package using a URL.
   - [My Ocotocat][octocat] - Take a break from your build and create an Octocat that’s all you, from whisker tip to tail.
   - [Open Collective][opencollective] - A new form of association, transparent by design. A group of people with a shared mission that operates in full transparency. Everyone can see how they receive or spend money.
   - [node.green][] - Node.js ECMAScript compatibility tables.
   - [Create React App][create-react-app] - Set up a modern web app by running one command.
   - [date-fn][] - Modern JavaScript date utility library that provides the most comprehensive, yet simple and consistent toolset for manipulating JavaScript dates in a browser & Node.js.
   - [Centering in CSS: A Complete Guide][css-tricks-centering-css-guide]

3. **Bookmarks November 2018** #170 (⊶ 4807c565)
   ↠ The regular bookmark update for November 2018.

   → Added

   - [web.dev][] — Let's build the future of the web. With actionable guidance and analysis, web.dev helps developers like you learn and apply the web's modern capabilities to your own sites and apps.
   - [squoosh.app][] — Squoosh is an image compression web app that allows you to dive into the advanced options provided by various image compressors.
   - [Contributor Covenant][contributor-covenant] — A Code of Conduct for Open Source Projects
   - [Eva Icons][eva-icons] — Eva Icons is a pack of more than 480 beautifully crafted Open Source icons for common actions and items.
   - [Feather Icons][feathericons] — Simply beautiful open source icons
   - [CommonMark][] — A strongly defined, highly compatible specification of Markdown
   - [Overreacted][] — Personal blog by [Dan Abramov][twitter-dan_abramov], React core team developer.
   - [JSON-LD][] — A JSON-based Serialization for Linked Data. JSON-LD organizes and connects it, creating a better Web.

   → Updated

   - [AUR][]: Updated the outdated keyword search URL from `https://aur.archlinux.org?K=%s` to `https://aur.archlinux.org/packages/?O=0&K=%s`.

### Homebrew — #140, #131 (⊶ 43fd982e)

↠ Initially `snowflakes/homebrew` for [Homebrew][] added a [`Brewfile`][homebrew/homebrew-bundle] and a documentation that includes instructions how to…

- …update to the latest Homebrew version.
- …upgrade all outdated formulas, casks and taps.
- …bootstrap the `Brewfile` with [Homebrew Bundle][homebrew/homebrew-bundle].

Over the time the `homebrew` _snowflake_ evolved through the following changes:

1. **“Google Chrome“ cask** #148 (⊶ 2b0286dc)
   ↠ The [google-chrome][brew-google-chrome] cask has been added that is used for web development with [DevTools][gdev-web-devtools] features only available in Chrome (e.g. Lighthouse) and to test and compare possible browser differences.

2. **“Gifski“ (desktop ap) and “ImageOptim“** #149 (⊶ 7508e641)
   ↠ The [Gifski][] desktop app has been added for simple and fast conversion as well as the [ImageOptim][homebrew/homebrew-cask-imageoptim] cask and [imageoptim-cli][brew-imageoptim-cli] formula to optimize images.

   <div align="center">
   <img src="https://sindresorhus.com/assets/gifski/icon.png" width="30%" />
   <img src="https://sindresorhus.com/assets/gifski/screenshot1.jpg" width="60%" />
   <img src="https://imageoptim.com/ImageOptim-app.png" width="60%" />
   </div>

3. **Brewfile Update Januar 2019** #173 (⊶ 60274c38)
   ↠ The regular batch update for new, changed and deleted _Homebrew_ formulas/casks/taps.

   → Added

   - [cabextract][] — OSS tool to extract _Microsoft cabinet files_ (`.cab`)
   - [nq][] — A UNIX CLI queue utility that allows to create very lightweight job queue systems which require no setup, maintenance, supervision, or any long-running processes.
   - [wallpaper][macos-wallpaper] — Allows to manage the desktop wallpaper on macOS from the CLI
   - [Spectrum][] — The desktop app of [Spectrum][]
   - [Visual Studio Code][vscode] — Code editing. Redefined. Free. Open source. Runs everywhere.

   → Updated

   - [KeepassXC][] — An actively developed community-edition of [KeePassX][]

4. **`hostess` formula** #174 (⊶ 0e8f37f9)
   ↠ Added the formula for [hostess][cbednarski/hostess], an **idempotent** command-line utility for managing your `/etc/hosts` file.

5. **`gotop` formula** #176 (⊶ 5a449b47)
   ↠ Added the formula for [gotop][], a terminal based graphical activity monitor inspired by [gtop][gtop] and [vtop][vtop].
   The formula is available through the `cjbassi/gotop` tap.

   <div align="center"><img src="https://raw.githubusercontent.com/cjbassi/gotop/master/assets/demos/demo.gif" width="60%" /><img src="https://raw.githubusercontent.com/cjbassi/gotop/master/assets/screenshots/minimal.png" width="60%" /></div>

6. **`dive` formula** #177 (⊶ fed546f5)
   ↠ Added the formula for [dive][], a tool for exploring a _Docker_ image, layer contents, and discovering ways to shrink your Docker image size.
   The formula is available through the `wagoodman/dive` tap.<div align="center"><img src="https://raw.githubusercontent.com/wagoodman/dive/master/.data/demo.gif" width="60%" /><img src="https://raw.githubusercontent.com/wagoodman/dive/master/.data/demo-ci.png" width="60%" /></div>

7. **`streamlink` formula** #178 (⊶ c8dfabe7)
   ↠ Added the formula for [streamlink][], a CLI for extracting streams from various websites to a video player of your choosing by using _FFMPEG_ and _youtube-dl_.

8. **Remove `dep` formula** #187 (⊶ 6c0a0414)
   ↠ Since _Go_ 1.11 with [Go Modules][go-ghwiki-mods] `dep` is deprecated and not necessary anymore.

9. **Fixed typo in `gnu-which` formula name** #188 (⊶ 9c2d48df)
   ↠ Fixed thae typo in the formula name of [`gnu-which`][brew-gnu-which] that is currently stored as `gnu-witch`.

10. **_Kubernetes_ and _Helm_** #189 (⊶ d8a79830)
    ↠ Added [Kubernetes][] and [Helm][].

11. **_Protocol Buffers_** #190 (⊶ b3b43e3f)
    ↠ Added [Protocol Buffers][protocol-buffers] to develop and build with [gRPC][].

### iTerm2 — #135, #131, #70 (⊶ 3573a2a2)

↠ Initially `snowflakes/iterm2` for [iTerm2][] has been created as replacement for [Tilix][] that is designed for GTK based Linux distributions. The _snowflake_ contains the exported JSON file of the created `igloo` profile.

### udev — #111 ⇄ #112 (⊶ 8e47b174)

↠ Initially `snwoflakes/udev` for [udev][archw-udev] a custom rule with mappings for the [Logitech R400 Presenter][logitech-r400-presenter] optimized for presentations made with the React library [Spectacle][] and the [Code Slide][spectacle-code-slide] extension.
The documentation contains detailed information about the functionality as well as install & usage instructions for _udev_ custom rules.

### Visual Studio Code — #179 (⊶ 8cebb084)

↠ Initially `snowflakes/visual-studio-code` for [Visual Studio Code][vscode] provided the `extensions.json` file that contains the IDs of all currently used _Visual Studio Code_ extesnions.
See the “_Snowblocks_“ → “Visual Studio Code“ section of this changelog for the release version `0.1.0` for more details.

<!--
+------------------+
+ Symbol Reference +
+------------------+
↠ (U+21A0): Start of a log section description
— (U+2014): Separator between a log section title and the metadata
⇄ (U+21C4): Separator between a issue ID and pull request ID in a log metadata
⊶ (U+22B6): Icon prefix for the short commit SHA checksum in a log metadata
-->

<!-- Base Links -->

<!--v 0.1.0 -->

[airblade/vim-gitgutter@dc73a81]: https://github.com/airblade/vim-gitgutter/commit/dc73a81
[airblade/vim-gitgutter#431-c-sigcol]: https://github.com/airblade/vim-gitgutter/issues/431#issuecomment-319696108
[ap/vim-css-color]: https://github.com/ap/vim-css-color
[apache-license]: http://www.apache.org/licenses/LICENSE-2.0
[apple-docs-keychain]: https://support.apple.com/guide/keychain-access/welcome/mac
[arch-jb-idea-ce]: https://git.archlinux.org/svntogit/community.git/tree/trunk/idea.desktop?h=packages/intellij-idea-community-edition
[arch-jb-idea-u]: https://aur.archlinux.org/cgit/aur.git/tree/jetbrains-idea.desktop?h=intellij-idea-ultimate-edition
[arch-jb-py-ce]: https://git.archlinux.org/svntogit/community.git/tree/trunk/pycharm.desktop?h=packages/pycharm-community-edition
[archlinux]: https://archlinux.org
[archw-dfile]: https://wiki.archlinux.org/index.php/Desktop_entries
[archw-gnome-keyring]: https://wiki.archlinux.org/index.php/GNOME/Keyring
[archw-gnome-lid-behavior]: https://wiki.archlinux.org/index.php/GNOME#Configure_behaviour_on_lid_switch_close
[archw-mbp-11x#suspend]: https://wiki.archlinux.org/index.php/MacBookPro11,x#Suspend
[archw-plank]: https://wiki.archlinux.org/index.php/Plank
[archw-qt#fail_update]: https://wiki.archlinux.org/index.php/qt#All_Qt5-based_applications_fail_to_run_after_Qt5_update
[archw-ssh_ag]: https://wiki.archlinux.org/index.php/SSH_keys#ssh-agent
[archw-sudo]: https://wiki.archlinux.org/index.php/Sudo#Passing_aliases
[archw-suspend-service]: https://wiki.archlinux.org/index.php/Power_management#Combined_Suspend.2Fresume_service_file
[archw-system-sleep-hook]: https://wiki.archlinux.org/index.php/Power_management#Hooks_in_.2Fusr.2Flib.2Fsystemd.2Fsystem-sleep
[archw-tmux]: https://wiki.archlinux.org/index.php/Tmux
[archw-ud]: https://wiki.archlinux.org/index.php/XDG_user_directories
[archw-udev]: https://wiki.archlinux.org/index.php/udev
[arcticicestudio/nord-vim@9e0249ca]: https://github.com/arcticicestudio/nord-vim/tree/9e0249caa7d122d55a75b790c61db36ab3bdc97d
[arcticicestudio/nord-vim#145]: https://github.com/arcticicestudio/nord-vim/issues/145
[arcticicestudio/nord-vim#146]: https://github.com/arcticicestudio/nord-vim/pull/146
[arcticicestudio/styleguide-git]: https://github.com/arcticicestudio/styleguide-git
[atom-blog-1.28]: http://blog.atom.io/2018/06/21/atom-1-28.html#electron-upgrade
[atom-blog-rln-1.28#color_profile]: http://blog.atom.io/2018/06/21/atom-1-28.html#support-for-custom-color-profiles
[atom-docs-custom#cson_conf]: https://flight-manual.atom.io/using-atom/sections/basic-customization/#configuring-with-cson
[atom-docs-custom#home_path_env]: http://flight-manual.atom.io/using-atom/sections/basic-customization/#custom-home-location-with-an-environment-variable
[atom-docs-keymap]: http://flight-manual.atom.io/behind-atom/sections/keymaps-in-depth
[atom-ide]: https://ide.atom.io
[atom-pkg-atom-ide-ui]: https://atom.io/packages/atom-ide-ui
[atom-pkg-ide-typescript]: https://atom.io/packages/ide-typescript
[atom-pkg-language-rust]: https://atom.io/packages/language-rust
[atom-pkg-package-sync]: https://github.com/lee-dohm/package-sync
[atom-pkg-project-folder]: https://github.com/t9md/atom-project-folder
[atom]: https://atom.io
[atom/atom#17356]: https://github.com/atom/atom/issues/17356
[atomicdesign]: http://atomicdesign.bradfrost.com
[aur-jb-ws]: https://aur.archlinux.org/cgit/aur.git/tree/jetbrains-webstorm.desktop?h=webstorm
[aur-plotinus-git]: https://aur.archlinux.org/packages/plotinus-git
[aur-python-taskw]: https://aur.archlinux.org/packages/python-taskw
[aur]: https://aur.archlinux.org
[auracle]: https://github.com/falconindy/auracle
[bash-docs-alias]: https://www.gnu.org/software/bash/manual/bashref.html#Aliases
[bash]: https://www.gnu.org/software/bash
[bitpaper]: https://bitpaper.io
[brew-bash]: https://formulae.brew.sh/formula/git
[brew-git]: https://formulae.brew.sh/formula/git
[brew-gnu-which]: https://formulae.brew.sh/formula/gnu-which
[brew-google-chrome]: https://github.com/Homebrew/homebrew-cask/blob/master/Casks/google-chrome.rb
[brew-imageoptim-cli]: https://formulae.brew.sh/formula/imageoptim-cli
[bugzilla-1098986]: https://bugzilla.mozilla.org/show_bug.cgi?id=1098986
[buku-wiki-colors]: https://github.com/jarun/Buku/wiki/Customize-colors
[buku]: https://github.com/jarun/Buku
[cabextract]: https://www.cabextract.org.uk
[cbednarski/hostess]: https://github.com/cbednarski/hostess
[choosealicense-mit]: https://choosealicense.com/licenses/mit
[commonmark]: https://commonmark.org
[contributor-covenant]: https://www.contributor-covenant.org
[cpan-doc-modules]: http://www.cpan.org/modules
[cpanminus]: https://github.com/miyagawa/cpanminus
[create-react-app]: https://facebook.github.io/create-react-app
[css-tricks-centering-css-guide]: https://css-tricks.com/centering-css-complete-guide
[css-tricks-grid_guide]: https://css-tricks.com/snippets/css/complete-guide-grid
[cvs]: http://savannah.nongnu.org/projects/cvs
[cypress]: https://www.cypress.io
[date-fn]: https://date-fns.org
[dconf]: https://wiki.gnome.org/Projects/dconf
[diff-highlight]: https://github.com/git/git/tree/master/contrib/diff-highlight
[diff-so-fancy]: https://github.com/so-fancy/diff-so-fancy
[dive]: https://github.com/wagoodman/dive
[docker]: https://www.docker.com
[dropbox]: https://www.dropbox.com
[eva-icons]: https://akveo.github.io/eva-icons
[expo]: https://expo.io
[fb-code-blog-react_relicense]: https://code.facebook.com/posts/300798627056246/relicensing-react-jest-flow-and-immutable-js
[fd-bookmarks]: https://www.freedesktop.org/wiki/Specifications/desktop-bookmark-spec
[feathericons]: https://feathericons.com
[firefox-addon-multi-acc-cont]: https://addons.mozilla.org/en-US/firefox/addon/multi-account-containers
[firefox-addon-stg]: https://addons.mozilla.org/en-US/firefox/addon/simple-tab-groups
[firefox-color]: https://color.firefox.com
[firefox-dev-edition]: https://www.mozilla.org/en-US/firefox/developer
[firefox-lockwise]: https://www.mozilla.org/firefox/lockwise
[firefox-monitor]: https://monitor.firefox.com
[firefox-testpilot-exp-color]: https://testpilot.firefox.com/experiments/color
[firefox]: https://www.mozilla.org/en-US/firefox
[freebsd-wiki-launchd]: https://wiki.freebsd.org/launchd
[freedesktop-autostart]: https://specifications.freedesktop.org/autostart-spec/autostart-spec-latest.html
[freedesktop-systemd-srv]: https://www.freedesktop.org/software/systemd/man/systemd.service.html
[freedesktop-systemd-unit]: https://www.freedesktop.org/software/systemd/man/systemd.unit.html
[freedesktop-systemd.sleep]: https://www.freedesktop.org/software/systemd/man/sleep.conf.d.html
[freedesktop-systemd.special]: https://www.freedesktop.org/software/systemd/man/systemd.special.html
[freedesktop.org]: https://www.freedesktop.org
[freedesktop]: https://freedesktop.org
[gdev-web-devtools]: https://developers.google.com/web/tools/chrome-devtools
[gh-10]: https://github.com/arcticicestudio/igloo/issues/10
[gh-131]: https://github.com/arcticicestudio/igloo/issues/131
[gh-143]: https://github.com/arcticicestudio/igloo/issues/143
[gh-blog-git-2.13]: https://github.com/blog/2360-git-2-13-has-been-released
[gh-blog-git-2.13#cond_incl]: https://github.com/blog/2360-git-2-13-has-been-released#conditional-configuration
[gh-dotfiles]: https://dotfiles.github.io
[gh-user-svengreb]: https://github.com/svengreb
[gh-user-xulongwu4]: https://github.com/xulongwu4
[ghacks-user.js]: https://github.com/ghacksuserjs/ghacks-user.js
[ghh-prs#squash]: https://help.github.com/en/articles/about-pull-request-merges#squash-and-merge-your-pull-request-commits
[gifski]: https://sindresorhus.com/gifski
[gist-git_smudge_clean]: https://gist.github.com/g-k/9087422
[gist-term_colors]: https://gist.github.com/XVilka/8346728
[git-crypt]: https://github.com/AGWA/git-crypt
[git-docs-conf#autocorr]: https://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration#_code_help_autocorrect_code
[git-docs-config#incl]: https://git-scm.com/docs/git-config#_includes
[git-docs-diff]: https://git-scm.com/docs/git-diff
[git-docs-mergetool]: https://git-scm.com/docs/git-mergetool
[git-docs-revs]: https://git-scm.com/docs/gitrevisions
[git-rln-2.14.0]: https://github.com/git/git/blob/master/Documentation/RelNotes/2.14.0.txt#L213
[git-rln-2.17.1#cve]: https://github.com/git/git/blob/master/Documentation/RelNotes/2.17.1.txt#L7-L10
[git]: https://git-scm.com
[gko/vim-coloresque]: https://github.com/gko/vim-coloresque
[gnunn1/tilix#571]: https://github.com/gnunn1/tilix/issues/571
[go-ghwiki-mods]: https://github.com/golang/go/wiki/Modules
[go]: https://golang.org
[gocryptfs]: https://github.com/rfjakob/gocryptfs
[godoc-x-tools-cmd-goimports]: https://godoc.org/golang.org/x/tools/cmd/goimports
[goland]: https://www.jetbrains.com/go
[gotop]: https://github.com/cjbassi/gotop
[govim]: https://github.com/govim/govim
[gpg-doc-conf-agent]: https://www.gnupg.org/documentation/manuals/gnupg/Agent-Configuration.html#Agent-Configuration
[gpg-doc-conf]: https://www.gnupg.org/documentation/manuals/gnupg/GPG-Configuration.html
[gpg-docs-conf_opts]: https://www.gnupg.org/documentation/manuals/gnupg/GPG-Configuration-Options.html
[gpg]: https://gnupg.org
[gradle-docs-env#opts]: https://docs.gradle.org/current/userguide/gradle_command_line.html#sec:cli_environment_variables
[gradle-docs-rln-3.0#daemon]: https://docs.gradle.org/3.0/release-notes.html#improved-gradle-daemon,-now-enabled-by-default
[gradle]: https://gradle.org
[grpc]: https://grpc.io
[gtop]: https://github.com/aksakalli/gtop
[gulp-cli#compl]: https://github.com/gulpjs/gulp-cli#completion
[gulp]: https://gulpjs.com
[hacktoberfest]: https://hacktoberfest.digitalocean.com
[haveibeenpwned]: https://haveibeenpwned.com
[helm]: https://helm.sh
[homebrew]: https://brew.sh
[homebrew/homebrew-bundle]: https://github.com/Homebrew/homebrew-bundle
[homebrew/homebrew-cask-imageoptim]: https://github.com/Homebrew/homebrew-cask/blob/master/Casks/imageoptim.rb
[htop]: https://hisham.hm/htop
[iina]: https://lhc70000.github.io/iina
[intellij]: https://www.jetbrains.com/idea
[inter]: https://rsms.me/inter
[iterm2]: https://www.iterm2.com
[jb-blog-intellij_2019.1]: https://blog.jetbrains.com/idea/2019/03/intellij-idea-2019-1-is-released-theme-customization-java-12-switch-expressions-debug-inside-docker-containers-and-more
[jb-blog-rln-2019.2]: https://blog.jetbrains.com/idea/2019/07/intellij-idea-2019-2-java-13-preview-features-profiling-tools-services-tool-window-and-more
[jb-blog-rln-2019.3]: https://blog.jetbrains.com/idea/2019/11/intellij-idea-2019-3-better-performance-and-quality
[jb-blog-unbundle_tfs_cvs_plug]: https://blog.jetbrains.com/idea/2019/02/unbundling-tfs-and-cvs-integration-plugins
[jb-docs-code-style]: https://www.jetbrains.com/help/idea/settings-code-style.html
[jb-docs-inspections]: https://www.jetbrains.com/help/idea/inspections-settings.html
[jb-docs-keymap_refs]: https://www.jetbrains.com/help/idea/keymap-reference.html
[jb-docs-keymap]: https://www.jetbrains.com/help/idea/settings-keymap.html
[jb-docs-menu_toolbar]: https://www.jetbrains.com/help/idea/menus-and-toolbars.html
[jb-docs-plugins]: https://www.jetbrains.com/help/idea/managing-plugins.html
[jb-docs-prefs]: https://www.jetbrains.com/help/idea/settings-preferences-dialog.html
[jb-docs-settings_paths]: https://intellij-support.jetbrains.com/hc/en-us/articles/206544519-Directories-used-by-the-IDE-to-store-settings-caches-plugins-and-logs
[jb-new-2019.2]: https://www.jetbrains.com/idea/whatsnew/#v2019-2
[jb-new-2019.3]: https://www.jetbrains.com/idea/whatsnew/#v2019-3
[jb-plg-go]: https://plugins.jetbrains.com/plugin/9568-go
[jetbrains]: https://www.jetbrains.com
[json-ld]: https://json-ld.org
[keepassx]: https://www.keepassx.org
[keepassxc]: https://keepassxc.org
[keepassxreboot/keepassxc#1931]: https://github.com/keepassxreboot/keepassxc/issues/1931
[kubernetes]: https://kubernetes.io
[launchd.info]: http://www.launchd.info
[launchd]: https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/Introduction.html#//apple_ref/doc/uid/10000172i-SW1-SW1
[letsencrypt]: https://letsencrypt.org
[libfuse-sec]: https://github.com/libfuse/libfuse#security-implications
[libfuse]: https://github.com/libfuse/libfuse
[libfuse/libfuse#15]: https://github.com/libfuse/libfuse/issues/15
[libsec]: https://wiki.gnome.org/Projects/Libsecret
[livedown]: https://github.com/shime/livedown
[logitech-r400-presenter]: https://www.logitech.com/en-us/product/wireless-presenter-r400
[macos-wallpaper]: https://github.com/sindresorhus/macos-wallpaper
[mage-docs-env]: https://magefile.org/environment
[mage]: https://magefile.org
[mdm-about-debugging]: https://developer.mozilla.org/en-US/docs/Tools/about:debugging
[mdm-inspect-grid#line_num]: https://developer.mozilla.org/en-US/docs/Tools/Page_Inspector/How_to/Examine_grid_layouts#Display_line_numbers
[mdn-tools-resp_design_mode]: https://developer.mozilla.org/en-US/docs/Tools/Responsive_Design_Mode
[mdx]: https://mdxjs.com
[modularscale]: https://www.modularscale.com
[moz-ff-rln-69.0#chrome]: https://www.mozilla.org/en-US/firefox/69.0/releasenotes/#note-788117
[mozkb-accesb-typeaheadfind]: http://kb.mozillazine.org/Accessibility.typeaheadfind
[mozkb-profiles.ini]: http://kb.mozillazine.org/Profiles.ini_file
[mozkb-user.js]: http://kb.mozillazine.org/User.js_file
[mozkb-userchrome.css]: http://kb.mozillazine.org/index.php?title=UserChrome.css
[mozkb-usercontent.css]: http://kb.mozillazine.org/index.php?title=UserContent.css
[mozs-enhc_track_protc]: https://support.mozilla.org/en-US/kb/enhanced-tracking-protection-firefox-preview
[mozw-sec-webauthn#test_req]: https://wiki.mozilla.org/Security/QA/TestPlans/Web_Authentication#Requirements_for_testing
[mozw-toolkit-passman-gen]: https://wiki.mozilla.org/Toolkit:Password_Manager/Password_Generation
[mpv-doc-config-dir]: https://mpv.io/manual/master/#options-config-dir
[mpv-doc-config-files]: https://mpv.io/manual/master/#files-~/-config/mpv/mpv-conf
[mpv-doc-config-folder-wl]: https://mpv.io/manual/master/#files-~/-config/mpv/watch-later
[mpv-doc-save-pos]: https://mpv.io/manual/master/#options-save-position-on-quit
[mpv]: https://mpv.io
[mxw/vim-jsx]: https://github.com/mxw/vim-jsx
[nerdcommenter]: https://github.com/scrooloose/nerdcommenter
[node.green]: https://node.green
[nord]: https://www.nordtheme.com
[npm-docs-config]: https://docs.npmjs.com/misc/config
[npm-docs-pkg-lock]: https://docs.npmjs.com/files/package-lock.json
[npm-docs-pkg]: https://docs.npmjs.com/files/package.json
[npm-docs-rc]: https://docs.npmjs.com/files/npmrc
[npm-docs-scripts]: https://docs.npmjs.com/misc/scripts
[npm-livedown]: https://www.npmjs.com/package/livedown
[npm]: https://www.npmjs.com
[nq]: https://github.com/chneukirchen/nq
[nuclide-docs-bp]: https://nuclide.io/docs/features/debugger#breakpoints
[nuclide-docs-db]: https://nuclide.io/docs/features/debugger
[octobox]: https://octobox.io
[octocat]: https://myoctocat.com
[oembed]: https://oembed.com
[opencollective]: https://opencollective.com
[overreacted]: https://overreacted.io
[pacman]: https://www.archlinux.org/pacman
[pangloss/vim-javascript]: https://github.com/pangloss/vim-javascript
[pip-docs-config-file]: https://pip.pypa.io/en/stable/user_guide/#config-file
[pip-docs-req-file-format]: https://pip.pypa.io/en/latest/reference/pip_install/#requirements-file-format
[pip-docs-requirements]: https://pip.pypa.io/en/latest/user_guide/#requirements-files
[pip]: https://pip.pypa.io
[plasticboy/vim-markdown]: https://github.com/plasticboy/vim-markdown
[prettier]: https://prettier.io
[protocol-buffers]: https://developers.google.com/protocol-buffers
[pyllyukko/user.js]: https://github.com/pyllyukko/user.js
[pypi-taskw]: https://pypi.org/project/taskw
[python-docs-install-reqs]: https://packaging.python.org/tutorials/installing-packages/#requirements-files
[react-docs-api]: https://reactjs.org/docs/react-api.html
[react-lifecycle-methods-diagram]: http://projects.wojtekmaj.pl/react-lifecycle-methods-diagram
[react]: https://reactjs.org
[reactpatterns]: https://reactpatterns.com
[rust]: https://www.rust-lang.org
[shime/vim-livedown]: https://github.com/shime/vim-livedown
[snowsaw]: https://github.com/arcticicestudio/snowsaw
[so-fancy/diff-so-fancy#296]: https://github.com/so-fancy/diff-so-fancy/issues/296
[so-fancy/diff-so-fancy#35-c]: https://github.com/so-fancy/diff-so-fancy/issues/35#issuecomment-196940127
[so-fancy/diff-so-fancy#35]: https://github.com/so-fancy/diff-so-fancy/issues/35
[spectacle-code-slide]: http://jamiebuilds.github.io/spectacle-code-slide
[spectacle]: https://formidable.com/open-source/spectacle
[spectrum]: https://spectrum.chat
[squoosh.app]: https://squoosh.app
[streamlink]: https://streamlink.github.io
[systemd]: https://systemd.io
[taskopen]: https://github.com/ValiValpas/taskopen
[taskopen#conf]: https://github.com/ValiValpas/taskopen#configuration
[taskwarrior-doc-alias]: https://taskwarrior.org/docs/terminology.html#alias
[taskwarrior-doc-api-_get]: https://taskwarrior.org/docs/commands/_get.html
[taskwarrior-doc-dom-api]: https://taskwarrior.org/docs/dom.html
[taskwarrior-doc-ids]: https://taskwarrior.org/docs/ids.html
[taskwarrior-docs-conf]: https://taskwarrior.org/docs/introduction.html
[taskwarrior-docs-cx]: https://taskwarrior.org/docs/context.html
[taskwarrior-docs-hooks2]: https://taskwarrior.org/docs/hooks2.html
[taskwarrior-docs-r]: https://taskwarrior.org/docs/report.html
[taskwarrior-docs-tw_int]: https://taskwarrior.org/docs/timewarrior/taskwarrior.html
[taskwarrior-docs-uda]: https://taskwarrior.org/docs/udas.html
[taskwarrior]: https://taskwarrior.org
[tilix]: https://gnunn1.github.io/tilix-web
[timewarrior-docs-conf]: https://taskwarrior.org/docs/timewarrior/configuration.html
[timewarrior-docs-themes]: https://taskwarrior.org/docs/timewarrior/themes.html
[timewarrior-hook-on-modify]: https://github.com/GothenburgBitFactory/timewarrior/blob/dev/ext/on-modify.timewarrior
[timewarrior]: https://taskwarrior.org/docs/timewarrior
[tmux-docs-autodown]: https://github.com/tmux-plugins/tpm/blob/master/docs/automatic_tpm_installation.md
[tmux]: https://tmux.github.io
[tpm]: https://github.com/tmux-plugins/tpm
[trash-cli]: https://github.com/andreafrancia/trash-cli
[twitter-dan_abramov]: https://twitter.com/dan_abramov
[type-scale]: https://type-scale.com
[unpkg]: https://unpkg.com
[userchrome-ff_changes_chrome]: https://www.userchrome.org/firefox-changes-userchrome-css.html
[vim]: https://www.vim.org
[vimdoc-opts#pastetoggle]: http://vimdoc.sourceforge.net/htmldoc/options.html#%27pastetoggle%27
[vimdoc-start#rc]: http://vimdoc.sourceforge.net/htmldoc/starting.html#vimrc
[vscode-docs-go]: https://code.visualstudio.com/docs/languages/go
[vscode-ext-arcticicestudio.nord]: https://marketplace.visualstudio.com/items?itemName=arcticicestudio.nord-visual-studio-code
[vscode-ext-be5invis.custom-css]: https://marketplace.visualstudio.com/items?itemName=be5invis.vscode-custom-css
[vscode-ext-be5invis.vscode-custom-css]: https://marketplace.visualstudio.com/items?itemName=be5invis.vscode-custom-css
[vscode-ext-code-streetsidesoftware.spell-checker]: https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker
[vscode-ext-dunstontc.viml]: https://marketplace.visualstudio.com/items?itemName=dunstontc.viml
[vscode-ext-equinusocio.vsc-material-theme-icons]: https://marketplace.visualstudio.com/items?itemName=Equinusocio.vsc-material-theme-icons
[vscode-ext-esbenp.prettier-vscode]: https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode
[vscode-ext-pkief.material-icon-theme]: https://marketplace.visualstudio.com/items?itemName=PKief.material-icon-theme
[vscode-ext-silvenon.mdx]: https://marketplace.visualstudio.com/items?itemName=silvenon.mdx
[vscode-rln-1.35#breadcrumbs]: https://code.visualstudio.com/updates/v1_35#_breadcrumbs-displayed
[vscode-rln-1.36#tree_indent_guides]: https://code.visualstudio.com/updates/v1_36#_tree-indent-guides
[vscode-rln-1.37]: https://code.visualstudio.com/updates/v1_37
[vscode-rln-1.37#npm_script_expl]: https://code.visualstudio.com/updates/v1_37#_npm-scripts-explorer-visible-by-default
[vscode-rln-1.37#whitespace_select]: https://code.visualstudio.com/updates/v1_37#_show-whitespace-in-selection
[vscode-rln-1.38#explo_impr]: https://code.visualstudio.com/updates/v1_38#_explorer-improvements
[vscode]: https://code.visualstudio.com
[vtop]: https://parall.ax/vtop
[web.dev]: https://web.dev
[webauthn.bin.coffee-ff58]: https://webauthn.bin.coffee/ff58
[webauthn]: https://webauthn.io
[webpack]: https://webpack.js.org
[wiki-fs_perms]: https://en.wikipedia.org/wiki/File_system_permissions
[wiki-fuse]: https://en.wikipedia.org/wiki/Filesystem_in_Userspace
[wiki-tfs]: https://en.wikipedia.org/wiki/Team_Foundation_Server
[xdg-utils]: https://www.freedesktop.org/wiki/Software/xdg-utils
