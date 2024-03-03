#!/usr/bin/env python3

import os

# =============================== Arch Setup ==================================
arch_packages = ["kitty", "rust", "cargo", "golang", "nodejs", "npm", "neovim",
                 "tmux", "git", "make", "clang", "gcc", "firefox", "fzf",
                 "xclip", "ttf-jetbrains-mono-nerd", "ttf-ubuntu-mono-nerd",
                 "ttf-ubuntu-nerd", "ttf-roboto-mono-nerd",
                 "ttf-nerd-fonts-symbols", "ttf-nerd-fonts-symbols-mono",
                 "ttf-tinos-nerd", "zsh", "curl", "wget", "man-db", "unzip",
                 "ffmpeg", "feh", "screenkey"]
os.system("pacman --version &>/dev/null")
exit_code = os.system("$?")
if exit_code == 0:
    PACKAGE_MANAGER = "pacman"
    for package in arch_packages:
        os.system(f"pacman -Sy {package}")

# ============================== Debian Setup =================================
debian_packages = ["kitty", "rustc", "cargo", "golang", "nodejs", "npm",
                   "neovim", "tmux", "git", "make", "clang", "gcc", "firefox",
                   "fzf", "xclip", "ttf-jetbrains-mono-nerd",
                   "ttf-ubuntu-mono-nerd", "ttf-ubuntu-nerd",
                   "ttf-roboto-mono-nerd", "ttf-nerd-fonts-symbols",
                   "ttf-nerd-fonts-symbols-mono", "ttf-tinos-nerd", "zsh",
                   "curl", "wget", "man-db", "unzip", "ffmpeg", "feh",
                   "screenkey"]

os.system("apt --version &>/dev/null")
exit_code = os.system("$?")
if exit_code == 0:
    PACKAGE_MANAGER = "apt"
    for package in debian_packages:
        os.system(f"apt install {package}")


# ============================== Fedora Setup =================================
fedora_packages = ["kitty", "rustc", "cargo", "golang", "nodejs", "npm",
                   "neovim", "tmux", "git", "make", "clang", "gcc", "firefox",
                   "fzf", "xclip", "ttf-jetbrains-mono-nerd",
                   "ttf-ubuntu-mono-nerd", "ttf-ubuntu-nerd",
                   "ttf-roboto-mono-nerd", "ttf-nerd-fonts-symbols",
                   "ttf-nerd-fonts-symbols-mono", "ttf-tinos-nerd", "zsh",
                   "curl", "wget", "man-db", "unzip", "ffmpeg", "feh",
                   "screenkey"]
os.system("dnf --version &>/dev/null")
exit_code = os.system("$?")
if exit_code == 0:
    PACKAGE_MANAGER = "dnf"
    for package in fedora_packages:
        os.system(f"dnf install {package}")
