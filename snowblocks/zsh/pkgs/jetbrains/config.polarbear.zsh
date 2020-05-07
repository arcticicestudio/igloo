# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>

# Project:    igloo
# Repository: https://github.com/arcticicestudio/igloo
# License:    MIT

# Add IntelliJ's CLI tool to the executable search path in order to use it as Git `mergtool` and
# `difftool`, apply code style formatting or perform code inspections on the specified project or
# files, or simply launch the IDE from a specific directory/project.
# See:
#   1. https://www.jetbrains.com/help/idea/working-with-the-ide-features-from-command-line.html
#   2. https://git-scm.com/docs/git-mergetool
#   3. https://git-scm.com/docs/git-difftool
#   4. https://www.jetbrains.com/help/idea/command-line-merge-tool.html
#   5. https://www.jetbrains.com/help/idea/command-line-differences-viewer.html
#   6. https://www.jetbrains.com/help/idea/command-line-formatter.html
#   7. https://www.jetbrains.com/help/idea/command-line-code-inspector.html
#   8. https://www.jetbrains.com/help/idea/opening-files-from-command-line.html
[[ -d /opt/intellij-idea-u/bin ]] && path=(/opt/intellij-idea-u/bin $path)
