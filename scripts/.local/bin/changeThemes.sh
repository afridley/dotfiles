#!/bin/bash

DAY=$(date "+%d")
MONTH=$(date "+%m")
if [ $MONTH == 01 ]; then
  #Jan
  sed -i'' -e 's/"tokyodark"/"nordic"/g' ~/dotfiles/lvim/.config/lvim/config.lua
  sed -i'' -e 's/"tokyodark"/"nordic"/g' ~/dotfiles/lazyvim/.config/nvim/init.lua
  sed -i'' -e 's/#11121d/#242933/g' ~/.config/kitty/kitty.conf
fi
if [ $MONTH == 02 ]; then
  #Feb
  sed -i'' -e 's/"nordic"/"calvera"/g' ~/dotfiles/lvim/.config/lvim/config.lua
  sed -i'' -e 's/"nordic"/"calvera"/g' ~/dotfiles/lazyvim/.config/nvim/init.lua
  sed -i'' -e 's/#242933/#0d0c1e/g' ~/.config/kitty/kitty.conf
fi
if [ $MONTH == 03 ]; then
  #Mar
  sed -i'' -e 's/"calvera"/"everblush"/g' ~/dotfiles/lvim/.config/lvim/config.lua
  sed -i'' -e 's/"calvera"/"everblush"/g' ~/dotfiles/lazyvim/.config/nvim/init.lua
  sed -i'' -e 's/#0d0c1e/#0c1417/g' ~/.config/kitty/kitty.conf
fi
if [ $MONTH == 04 ]; then
  #Apr
  sed -i'' -e 's/"everblush"/"everforest"/g' ~/dotfiles/lvim/.config/lvim/config.lua
  sed -i'' -e 's/"everblush"/"everforest"/g' ~/dotfiles/lazyvim/.config/nvim/init.lua
  sed -i'' -e 's/#0c1417/#2b3339/g' ~/.config/kitty/kitty.conf
fi
if [ $MONTH == 05 ]; then
  #May
  sed -i'' -e 's/"everforest"/"nightcity"/g' ~/dotfiles/lvim/.config/lvim/config.lua
  sed -i'' -e 's/"everforest"/"nightcity"/g' ~/dotfiles/lazyvim/.config/nvim/init.lua
  sed -i'' -e 's/#2b3339/#191b29/g' ~/.config/kitty/kitty.conf
fi
if [ $MONTH == 06 ]; then
  #Jun
  sed -i'' -e 's/"nightcity"/"gruvbox-material"/g' ~/dotfiles/lvim/.config/lvim/config.lua
  sed -i'' -e 's/"nightcity"/"gruvbox-material"/g' ~/dotfiles/lazyvim/.config/nvim/init.lua
  sed -i'' -e 's/#191b29/#32302F/g' ~/.config/kitty/kitty.conf
fi
if [ $MONTH == 07 ]; then
  #Jul
  sed -i'' -e 's/"gruvbox-material"/"miramare"/g' ~/dotfiles/lvim/.config/lvim/config.lua
  sed -i'' -e 's/"gruvbox-material"/"miramare"/g' ~/dotfiles/lazyvim/.config/nvim/init.lua
  sed -i'' -e 's/#32302F/#2A2426/g' ~/.config/kitty/kitty.conf
fi
if [ $MONTH == 08 ]; then
  # original zenburn background was 3f3f3f
  #Aug
  sed -i'' -e 's/"miramare"/"farout"/g' ~/dotfiles/lvim/.config/lvim/config.lua
  sed -i'' -e 's/"miramare"/"farout"/g' ~/dotfiles/lazyvim/.config/nvim/init.lua
  sed -i'' -e 's/#2A2426/#000000/g' ~/.config/kitty/kitty.conf
fi
if [ $MONTH == 09 ]; then
  #Sept
  sed -i'' -e 's/"farout"/"kanagawa"/g' ~/dotfiles/lvim/.config/lvim/config.lua
  sed -i'' -e 's/"farout"/"kanagawa"/g' ~/dotfiles/lazyvim/.config/nvim/init.lua
  sed -i'' -e 's/#000000/#1f1f28/g' ~/.config/kitty/kitty.conf
fi
if [ $MONTH == 10 ]; then
  #Oct
  sed -i'' -e 's/"kanagawa"/"halcyon"/g' ~/dotfiles/lvim/.config/lvim/config.lua
  sed -i'' -e 's/"kanagawa"/"halcyon"/g' ~/dotfiles/lazyvim/.config/nvim/init.lua
  sed -i'' -e 's/#1f1f28/#1d2433/g' ~/.config/kitty/kitty.conf
  ##Oct
  #sed -i'' -e 's/"kanagawa"/"tokyonight"/g' ~/dotfiles/lvim/.config/lvim/config.lua
  #sed -i'' -e 's/"kanagawa"/"tokyonight"/g' ~/dotfiles/lazyvim/.config/nvim/init.lua
  #sed -i'' -e 's/#1f1f28/#24283B/g' ~/.config/kitty/kitty.conf
fi
if [ $MONTH == 11 ]; then
  #Nov
  sed -i'' -e 's/"tokyonight"/"melange"/g' ~/dotfiles/lvim/.config/lvim/config.lua
  sed -i'' -e 's/"tokyonight"/"melange"/g' ~/dotfiles/lazyvim/.config/nvim/init.lua
  sed -i'' -e 's/#1d2433/#2A2622/g' ~/.config/kitty/kitty.conf
fi
if [ $MONTH == 12 ]; then
  #Dec
  sed -i'' -e 's/"melange"/"tokyodark"/g' ~/dotfiles/lvim/.config/lvim/config.lua
  sed -i'' -e 's/"melange"/"tokyodark"/g' ~/dotfiles/lazyvim/.config/nvim/init.lua
  sed -i'' -e 's/#2A2622/#11121d/g' ~/.config/kitty/kitty.conf
fi
