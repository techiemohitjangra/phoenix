#!/usr/bin/env python3

import os

common_packages = ["ripgrep", "kitty", "valgrind"]

# =============================== Arch Setup ==================================
arch_packages = ["rust", "cargo", "go", "nodejs", "npm", "neovim",
                 "tmux", "git", "make", "clang", "gcc", "firefox", "fzf",
                 "xclip", "ttf-jetbrains-mono-nerd", "ttf-ubuntu-mono-nerd",
                 "ttf-ubuntu-nerd", "ttf-roboto-mono-nerd",
                 "ttf-nerd-fonts-symbols", "ttf-nerd-fonts-symbols-mono",
                 "ttf-tinos-nerd", "zsh", "curl", "wget", "man-db", "unzip",
                 "ffmpeg", "feh", "screenkey", "chezmoi"]
exit_code = os.system("pacman --version &>/dev/null")
if int(exit_code) == 0:
    PACKAGE_MANAGER = "pacman"
    for package in common_packages:
        os.system(f"pacman -S --needed {package} -y")
    for package in arch_packages:
        os.system(f"pacman -S --needed {package} -y")

# ============================== Debian Setup =================================
debian_packages = ["rustc", "cargo", "golang", "nodejs", "npm",
                   "neovim", "tmux", "git", "make", "clang", "gcc", "firefox",
                   "fzf", "xclip", "ttf-jetbrains-mono-nerd",
                   "ttf-ubuntu-mono-nerd", "ttf-ubuntu-nerd",
                   "ttf-roboto-mono-nerd", "ttf-nerd-fonts-symbols",
                   "ttf-nerd-fonts-symbols-mono", "ttf-tinos-nerd", "zsh",
                   "curl", "wget", "man-db", "unzip", "ffmpeg", "feh",
                   "screenkey"]

exit_code = os.system("apt --version &>/dev/null")
if exit_code == 0:
    PACKAGE_MANAGER = "apt"
    for package in common_packages:
        os.system(f"apt install {package} -y")
    for package in debian_packages:
        os.system(f"apt install {package} -y")

    # install chezmoi
    os.system("sh -c \"$(curl -fsLS get.chezmoi.io)\"")


# ============================== Fedora Setup =================================
fedora_packages = ["rustc", "cargo", "golang", "nodejs", "npm",
                   "neovim", "tmux", "git", "make", "clang", "gcc", "firefox",
                   "fzf", "xclip", "ttf-jetbrains-mono-nerd",
                   "ttf-ubuntu-mono-nerd", "ttf-ubuntu-nerd",
                   "ttf-roboto-mono-nerd", "ttf-nerd-fonts-symbols",
                   "ttf-nerd-fonts-symbols-mono", "ttf-tinos-nerd", "zsh",
                   "curl", "wget", "man-db", "unzip", "ffmpeg", "feh",
                   "screenkey"]
exit_code = os.system("dnf --version &>/dev/null")
if exit_code == 0:
    PACKAGE_MANAGER = "dnf"
    for package in fedora_packages:
        os.system(f"dnf install {package}")

    # install chezmoi
    os.system("sh -c \"$(curl -fsLS get.chezmoi.io)\"")
