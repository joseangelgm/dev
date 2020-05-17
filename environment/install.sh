#!/bin/bash

# ZSH fonts and icons
sudo pacman -S powerline-fonts

# rofi dmenu, needs rofi entry in .i3/config
# execute rofi-theme-selector to change rofi theme
#yaourt -S rofi-dmenu

# install otf and ttf fontawesome
sudo pacman -S otf-font-awesome ttf-font-awesome awesome-terminal-fonts

# i3blocks package
#sudo pacman -S i3blocks

# program to know what key are you typing
# sudo pacman -S xorg-xev
# with this program (check keysym in the output) and this page (if it dont appear in xev output) get the 0x direction https://cgit.freedesktop.org/xorg/proto/x11proto/tree/XF86keysym.h
# /usr/include/X11/XF86keysym.h
# you can figure out what key are you pressing with function key (FN)
# Also http://wiki.linuxquestions.org/wiki/XF86_keyboard_symbols
# xmodmap -pke -> show all keycodes with their keysym

# control birghtness
#sudo pacman -S xorg-xbacklight

# display info within cli
#sudo pacman -S neofetch

# ncdu
# check what is using more space within the current directory

# mdlt
# calculator for the cli

# lightdm -> lock program (wallpapers etc.)
