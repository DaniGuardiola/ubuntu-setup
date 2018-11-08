# ubuntu-setup

This is a set of scripts and snippets that are meant to be executed on a fresh installation of Ubuntu 18.10.

I made this for myself so expect a 100% opinionated configuration. However, it might be a good starting point for your own configuration, either by forking this repo or by manually changing the settings after using this script.

# Usage

> First, install Ubuntu 18.10 on a machine. The minimal installation option is recommended but not required.

For now, just download the repo, extract it if necessary, `cd` into it and run `./run.sh`.

When the script is done, inclusing the manual steps, you will be logged out automatically. It is recommended to restart the computer before using it.

# Content

## Packages intalled

- gdebi (installs deb files and its dependencies)
- vim
- VScode
- curl
- git
- meld (diff tool)
- nvm (Node Version Manager)
- last stable version of node (through nvm)
- yarn
- Google Chrome
- [fuck](https://github.com/nvbn/thefuck)
- MEGAsync & nautilus extension

## VScode extensions

- standardJS
- vscode-icons

## VScode settings

Check [vscode-settings.json](./vscode-settings.json)

## Theme and GUI settings

- roboto-font
- adapta theme
- paper icon and cursor themes
- disables desktop icons
- sets dock to autohide
- sets dock apps to Chrome and VScode
- changes the default terminal style
- installs a bunch of Gnome extensions - check [gnome-extensions.sh](./gnome-extensions.sh)
- installs Gnome Tweaks

## Filesystem configurations

- creates home dirs `apps/` and `projects/`
- removes default home dirs (`Documents/`, `Music/`, etc)
- renames `Downloads/` to `downloads/` (lowercase)
- adds a few [bookmarks](./bookmarks)

## Other configurations

- sets `vim` as the default terminal editor
- adds `apx` util - like `npx` for `apt`

## Manual configuration

Most of the setup can be done with commands, but some stuff can only be done manually. The [manual-steps.sh](./manual-steps.sh) script will walk you through the manual steps:

- I use MEGAsync to keep my `apps/` `projects/` and the default `MEGAsync/` dirs synced across my devices, so there's a step to set that up.
- There's a Chrome login step in case you use Google sync on Chrome.
- Git configuration: name and email (based on your input), 'simple' default push behavior and git commit template (from `~/projects/git-commit-template`)
- SSH key generation (for services like Github or Gitlab)