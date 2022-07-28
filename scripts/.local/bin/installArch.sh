#!/bin/bash
# Generate current list of packages with
# pacman -Qqe > fullpackagelist.txt

installable_packages=$(comm -12 <(pacman -Slq | sort) <(sort ~/.local/bin/pkglist.txt))
yes | sudo pacman -S --needed $installable_packages
yes | sudo pacman -S nodejs npm

yes | sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si


bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

