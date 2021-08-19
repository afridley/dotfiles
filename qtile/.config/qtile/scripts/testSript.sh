#!/bin/bash

DAY=$(date "+%d")
MONTH=$(date "+%m")
if [ $DAY == 19 ] && [ $MONTH == 08 ]
then
  #Aug
  sed -i 's/"miramare"/"farout"/g' ~/.config/lvim/config.lua
  sed -i 's/#2A2426/#0F0908/g' ~/.config/kitty/kitty.conf
fi
