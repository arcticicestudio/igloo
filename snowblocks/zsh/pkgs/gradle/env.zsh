# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>

# Project:    igloo
# Repository: https://github.com/arcticicestudio/igloo
# License:    MIT

# Set the default system-wide Gradle options.
# See:
#   1. https://docs.gradle.org/current/userguide/gradle_command_line.html
#   2. https://docs.gradle.org/current/userguide/build_environment.html#sec:gradle_environment_variables
#   3. https://docs.gradle.org/current/userguide/console.html#sec:console_build_output
#
# org.gradle.daemon
#   Always use the Gradle daemon to run builds.
#   Since Gradle 3.0, daemon is enabled by default and is recommended for running Gradle.
# org.gradle.console
#   Use "rich" level to always colorize console output.
export GRADLE_OPTS="-Dorg.gradle.daemon=true -Dorg.gradle.console=rich"

# Set the Gradle user home directory.
# See:
#   1. https://docs.gradle.org/current/userguide/build_environment.html#sec:gradle_environment_variables
export GRADLE_USER_HOME=$IGLOO_PATH_USER_CONFIG/gradle
