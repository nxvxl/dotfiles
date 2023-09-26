#!/usr/bin/env bash

set -e

# update latest repo
sudo dnf upgrade

# install rpmfusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# install essential
sudo dnf install git zsh stow kitty curl

# install window manager
sudo dnf install i3 i3status i3lock dmenu picom feh xss-lock dunst rofi i3blocks xset \
fontawesome-fonts jetbrains-mono-fonts papirus-icon-theme 

# install c & c++ compiler
sudo dnf install gcc gcc-c++

# install main program
sudo dnf install neovim flameshot ripgrep fzf

# install utilities
sudo dnf install util-linux-user

# install omz
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# clone dotfiles
git clone https://github.com/nxvxl/dotfiles.git ~/.dotfiles

# copy configurations
stow i3 i3blocks dunst gtk-3.0 gtk-4.0 picom kitty
