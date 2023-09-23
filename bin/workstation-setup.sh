#!/usr/bin/env bash

# update latest repo
sudo dnf upgrade --refresh -n

# install rpmfusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# install essential
sudo dnf install git zsh stow kitty curl

# install window manager
sudo dnf install i3 istatus i3lock dmenu picom feh xss-lock dunst rofi i3blocks xset \
fontawesome-fonts jetbrains-mono-fonts papirus-icon-theme 

# install main program
sudo dnf install neovim flameshot ripgrep

# install omz
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# copy configurations
stow i3 i3blocks dunst gtk-3.0 gtk-4.0 picom kitty
