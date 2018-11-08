# ubuntu-setup

This is a set of scripts and snippets that are meant to be executed on a fresh installation of Ubuntu 18.10.

I made this for myself so expect a 100% opinionated configuration. However, it might be a good starting point for your own configuration, either by forking this repo or by manually changing the settings after using this script.

# Motivation and basic principles

The main purpose of these scripts is to make my life easier whenever I want to setup a new machine or simply reinstall my Ubuntu. Of course, some further configuration always happens afterwards but my goal is to keep as much of it as possible in here, so that I can always install it with a single command.

I've coded this trying to make it **idempotent**, which means that (hopefully) every time the scripts are run, the resulting state of the machine is the same, no matter if it is the first time or if it has been run a thousand times before. This way I can just add more packages and configurations to the script and run it again, so that next time it will be included as well.

I don't intend to fully support this behavior though, so for example most software that I stop using won't get removed if the script is run again, it will only stop installing. Same with configurations.

The basic goals of this configuration are:

- Make Ubuntu look and feel super-nice, minimalistic and clean but functional
- Install and configure tools for (mainly Javascript / Node.js) sofware development
- Set up MEGAsync for backups and filesystem sync of projects and apps
- Set up git and SSH keys configuration
- Set up Google account in Chrome

# Usage

> First, install Ubuntu 18.10 on a machine. The minimal installation option is recommended but not required.

Download the repo, extract it if necessary, `cd` into it and run `./run.sh`.

When the script is done, inclusing the manual steps, you will be logged out automatically. It is recommended to restart the computer before using it.

For convenience, there's a script that takes care of everything, just run:

```
$(wget -qO - ubuntu.daniguardiola.me | bash)
```


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

# TODO

Some stuff I would like to implement at some point

- Optionally skip manual steps (all and selectively)
- Detect .deb packages that are already installed and skip download & install
- z.sh
- Setup roboto as default font
- Multitouch workspaces
- More vscode extensions and configurations (emmet, etc)
- Add apps to PATH (and organize in MEGA)
- Store commit or version number somewhere (to be able to diff changes on updates for manual machine manteinance over time)