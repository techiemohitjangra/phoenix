# phoenix
Phoenix is a tool to setup configurations and tools for a fresh linux installation and development environment.

## Requirements
- Install chezmoi
``` sh
# for debian or ubuntu
sudo apt install chezmoi

# for arch
sudo pacman -Sy chezmoi
```
- Clone dotfiles repository
``` sh
# for debian or ubuntu
git clone <url-to-repo>
```

## Setup
``` sh
# setup
chezmoi --source path/to/dotfiles apply
# chezmoi --source $HOME/learning/phoenix/dotfiles apply
```
