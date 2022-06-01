#!/bin/bash

DAY=$(date "+%d")
MONTH=$(date "+%m")
if [ $DAY == 01 ] && [ $MONTH == 01 ]
then
  #Jan
  sed -i 's/"onedark"/"calvera"/g' ~/.config/lvim/config.lua
  sed -i 's/#282C34/#0c0c1f/g' ~/.config/kitty/kitty.conf
fi
if [ $DAY == 01 ] && [ $MONTH == 02 ]
then
  #Feb
  sed -i 's/"calvera"/"citylights"/g' ~/.config/lvim/config.lua
  sed -i 's/#0c0c1f/#1c242b/g' ~/.config/kitty/kitty.conf
fi
if [ $DAY == 01 ] && [ $MONTH == 03 ]
then
  #Mar
  sed -i 's/"citylights"/"bogster"/g' ~/.config/lvim/config.lua
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
  sed -i 's/"miramare"/"farout"/g' ~/.config/lvim/config.lua
  sed -i 's/#2A2426/#0F0908/g' ~/.config/kitty/kitty.conf
fi
if [ $DAY == 01 ] && [ $MONTH == 09 ]
then
  #Sept
  sed -i 's/"farout"/"tokyonight"/g' ~/.config/lvim/config.lua
  sed -i 's/#0F0908/#24283B/g' ~/.config/kitty/kitty.conf
fi
if [ $DAY == 01 ] && [ $MONTH == 10 ]
then
  #Oct
  sed -i 's/"tokyonight"/"ayu"/g' ~/.config/lvim/config.lua
  sed -i 's/#24283B/#212733/g' ~/.config/kitty/kitty.conf
fi
if [ $DAY == 01 ] && [ $MONTH == 11 ]
then
  #Nov
  sed -i 's/"ayu"/"melange"/g' ~/.config/lvim/config.lua
  sed -i 's/#212733/#2A2622/g' ~/.config/kitty/kitty.conf
fi
if [ $DAY == 01 ] && [ $MONTH == 12 ]
then
  #Dec
  sed -i 's/"melange"/"onedark"/g' ~/.config/lvim/config.lua
  sed -i 's/#2A2622/#282C34/g' ~/.config/kitty/kitty.conf
fi
