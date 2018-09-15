# Docker

> Docker is the leader in the containerization market, an open-source project that automates the deployment of software applications inside containers by providing an additional layer of abstraction and automation of operating-system-level virtualization on Linux.

## Setup

### macOS Keychain

To ensure that registry login tokens are stored in the macOS Keychain instead as plain text in the `~/.docker/config.json` file the configuration file must be adjusted:

```json
{
  "credsStore": "osxkeychain"
}
```
