#!/bin/bash

DAY=$(date "+%d")
MONTH=$(date "+%m")
if [ $MONTH == 01 ]
then
  #Jan
  sed -i'' -e 's/"moonlight"/"onenord"/g' ~/dotfiles/lvim/.config/lvim/config.lua
  sed -i'' -e 's/#21213b/#2d3441/g' ~/.config/kitty/kitty.conf
fi
if [ $MONTH == 02 ]
then
  #Feb
  sed -i'' -e 's/"onenord"/"calvera"/g' ~/dotfiles/lvim/.config/lvim/config.lua
  sed -i'' -e 's/#2d3441/#0d0c1e/g' ~/.config/kitty/kitty.conf
fi
if [ $MONTH == 03 ]
then
  #Mar
  sed -i'' -e 's/"calvera"/"bogster"/g' ~/dotfiles/lvim/.config/lvim/config.lua
  sed -i'' -e 's/#0d0c1e/#161c23/g' ~/.config/kitty/kitty.conf
fi
if [ $MONTH == 04 ]
then
  #Apr
  sed -i'' -e 's/"bogster"/"everforest"/g' ~/dotfiles/lvim/.config/lvim/config.lua
  sed -i'' -e 's/#161c23/#2b3339/g' ~/.config/kitty/kitty.conf
fi
if [ $MONTH == 05 ]
then
  #May
  sed -i'' -e 's/"everforest"/"darkearth"/g' ~/dotfiles/lvim/.config/lvim/config.lua
  sed -i'' -e 's/#2b3339/#1c1c1c/g' ~/.config/kitty/kitty.conf
fi
if [ $MONTH == 06 ]
then
  #Jun
  sed -i'' -e 's/"darkearth"/"gruvbox-material"/g' ~/dotfiles/lvim/.config/lvim/config.lua
  sed -i'' -e 's/#1c1c1c/#32302F/g' ~/.config/kitty/kitty.conf
fi
if [ $MONTH == 07 ]
then
  #Jul
  sed -i'' -e 's/"gruvbox-material"/"miramare"/g' ~/dotfiles/lvim/.config/lvim/config.lua
  sed -i'' -e 's/#32302F/#2A2426/g' ~/.config/kitty/kitty.conf
fi
if [ $MONTH == 08 ]
then
  # original zenburn background was 3f3f3f
  #Aug
  sed -i'' -e 's/"miramare"/"zenburn"/g' ~/dotfiles/lvim/.config/lvim/config.lua
  sed -i'' -e 's/#2A2426/#3f3f3f/g' ~/.config/kitty/kitty.conf
fi
if [ $MONTH == 09 ]
then
  #Sept
  sed -i'' -e 's/"zenburn"/"kanagawa"/g' ~/dotfiles/lvim/.config/lvim/config.lua
  sed -i'' -e 's/#3f3f3f/#1f1f28/g' ~/.config/kitty/kitty.conf
fi
if [ $MONTH == 10 ]
then
  #Oct
  sed -i'' -e 's/"kanagawa"/"tokyonight"/g' ~/dotfiles/lvim/.config/lvim/config.lua
  sed -i'' -e 's/#1f1f28/#24283B/g' ~/.config/kitty/kitty.conf
fi
if [ $MONTH == 11 ]
then
  #Nov
  sed -i'' -e 's/"tokyonight"/"melange"/g' ~/dotfiles/lvim/.config/lvim/config.lua
  sed -i'' -e 's/#24283B/#2A2622/g' ~/.config/kitty/kitty.conf
fi
if [ $MONTH == 12 ]
then
  #Dec
  sed -i'' -e 's/"melange"/"moonlight"/g' ~/dotfiles/lvim/.config/lvim/config.lua
  sed -i'' -e 's/#2A2622/#21213b/g' ~/.config/kitty/kitty.conf
fi
