#!/bin/bash

DAY=$(date "+%d")
MONTH=$(date "+%m")
if [ $DAY == 01 ] && [ $MONTH == 01 ]
then
  #Jan
  sed -i 's/"moonlight"/"onenord"/g' ~/.config/lvim/config.lua
  sed -i 's/#21213b/#2d3441/g' ~/.config/kitty/kitty.conf
fi
if [ $DAY == 01 ] && [ $MONTH == 02 ]
then
  #Feb
  sed -i 's/"onenord"/"calvera"/g' ~/.config/lvim/config.lua
  sed -i 's/#2d3441/#0c0c1f/g' ~/.config/kitty/kitty.conf
fi
if [ $DAY == 01 ] && [ $MONTH == 03 ]
then
  #Mar
  sed -i 's/"calvera"/"bogster"/g' ~/.config/lvim/config.lua
  sed -i 's/#1c242b/#161c23/g' ~/.config/kitty/kitty.conf
fi
if [ $DAY == 01 ] && [ $MONTH == 04 ]
then
  #Apr
  sed -i 's/"bogster"/"everforest"/g' ~/.config/lvim/config.lua
  sed -i 's/#161c23/#2b3339/g' ~/.config/kitty/kitty.conf
fi
if [ $DAY == 01 ] && [ $MONTH == 05 ]
then
  #May
  sed -i 's/"everforest"/"alduin"/g' ~/.config/lvim/config.lua
  sed -i 's/#2b3339/#1c1c1c/g' ~/.config/kitty/kitty.conf
fi
if [ $DAY == 01 ] && [ $MONTH == 06 ]
then
  #Jun
  sed -i 's/"alduin"/"gruvbox-material"/g' ~/.config/lvim/config.lua
  sed -i 's/#1c1c1c/#32302F/g' ~/.config/kitty/kitty.conf
fi
if [ $DAY == 01 ] && [ $MONTH == 07 ]
then
  #Jul
  sed -i 's/"gruvbox-material"/"miramare"/g' ~/.config/lvim/config.lua
  sed -i 's/#32302F/#2A2426/g' ~/.config/kitty/kitty.conf
fi
if [ $DAY == 01 ] && [ $MONTH == 08 ]
then
  #Aug
  sed -i 's/"miramare"/"zenburn"/g' ~/.config/lvim/config.lua
  sed -i 's/#2A2426/#3f3f3f/g' ~/.config/kitty/kitty.conf
fi
if [ $DAY == 01 ] && [ $MONTH == 09 ]
then
  #Sept
  sed -i 's/"zenburn"/"kanagawa"/g' ~/.config/lvim/config.lua
  sed -i 's/#3F3f3f/#1f1f28/g' ~/.config/kitty/kitty.conf
fi
if [ $DAY == 01 ] && [ $MONTH == 10 ]
then
  #Oct
  sed -i 's/"kanagawa"/"tokyonight"/g' ~/.config/lvim/config.lua
  sed -i 's/#1f1f28/#24283B/g' ~/.config/kitty/kitty.conf
fi
if [ $DAY == 01 ] && [ $MONTH == 11 ]
then
  #Nov
  sed -i 's/"tokyonight"/"melange"/g' ~/.config/lvim/config.lua
  sed -i 's/#24283B/#2A2622/g' ~/.config/kitty/kitty.conf
fi
if [ $DAY == 01 ] && [ $MONTH == 12 ]
then
  #Dec
  sed -i 's/"melange"/"moonlight"/g' ~/.config/lvim/config.lua
  sed -i 's/#2A2622/#21213b/g' ~/.config/kitty/kitty.conf
fi
