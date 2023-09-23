#!/usr/bin/env bash

# update latest repo
sudo dnf upgrade --refresh -n

# install essential
sudo dnf install git zsh stow kitty curl

# install window manager
sudo dnf install i3 istatus i3lock dmenu picom feh xss-lock dunst rofi i3blocks xset \
fontawesome-fonts jetbrains-mono-fonts papirus-icon-theme 

# install main program
sudo dnf install neovim flameshot

# install omz
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# copy configurations
stow i3 i3blocks dunst gtk-3.0 gtk-4.0 picom kitty
