#!/usr/bin/env python3

import os

arch_packages = ["kitty", "rust", "cargo", "golang", "nodejs", "npm", "neovim",
                 "tmux", "git", "make", "clang", "gcc", "firefox", "fzf",
                 "xclip", "ttf-jetbrains-mono-nerd", "ttf-ubuntu-mono-nerd",
                 "ttf-ubuntu-nerd", "ttf-roboto-mono-nerd",
                 "ttf-nerd-fonts-symbols", "ttf-nerd-fonts-symbols-mono",
                 "ttf-tinos-nerd", "zsh", "curl", "wget", "man-db", "unzip",
                 "ffmpeg", "feh"]

debian_packages = ["kitty", "rustc", "cargo", "golang", "nodejs", "npm",
                   "neovim", "tmux", "git", "make", "clang", "gcc", "firefox",
                   "fzf", "xclip", "ttf-jetbrains-mono-nerd",
                   "ttf-ubuntu-mono-nerd", "ttf-ubuntu-nerd",
                   "ttf-roboto-mono-nerd", "ttf-nerd-fonts-symbols",
                   "ttf-nerd-fonts-symbols-mono", "ttf-tinos-nerd", "zsh",
                   "curl", "wget", "man-db", "unzip", "ffmpeg", "feh"]

os.system("pacman --version &>/dev/null")
exit_code = os.system("$?")
if exit_code == 0:
    PACKAGE_MANAGER = "pacman"

os.system("apt --version &>/dev/null")
exit_code = os.system("$?")
if exit_code == 0:
    PACKAGE_MANAGER = "apt"

os.system("dnf --version &>/dev/null")
exit_code = os.system("$?")
if exit_code == 0:
    PACKAGE_MANAGER = "apt"
