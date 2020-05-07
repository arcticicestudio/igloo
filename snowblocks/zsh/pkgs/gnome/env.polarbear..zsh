# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>

# Project:    igloo
# Repository: https://github.com/arcticicestudio/igloo
# License:    MIT

# See https://wiki.archlinux.org/index.php/GNOME/Keyring#Disable_keyring_daemon_components to learn
# more about the need of this environment variable when using the OpenSSH agent with GNOME.
export GSM_SKIP_SSH_AGENT_WORKAROUND=1
