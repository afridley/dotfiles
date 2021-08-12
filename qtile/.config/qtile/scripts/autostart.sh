#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

# Change vim colorScheme every 15th
# Matches seasons starts in august
DAY=$(date "+%d")
MONTH=$(date "+%m")
if [ $DAY == 15 ] && [ $MONTH == 01]
then
  #Jan
  sed -i 's/"onedark"/"oceanic_material"/g' ~/.config/lvim/config.lua
  sed -i 's/#282C34/#1B2B34/g' ~/.config/kitty/kitty.conf
fi
if [ $DAY == 15 ] && [ $MONTH == 02]
then
  #Feb
  sed -i 's/"oceanic_material"/"calvera"/g' ~/.config/lvim/config.lua
  sed -i 's/#1B2B34/#0c0c1f/g' ~/.config/kitty/kitty.conf
fi
if [ $DAY == 15 ] && [ $MONTH == 03]
then
  #Mar
  sed -i 's/"calvera"/"bogster"/g' ~/.config/lvim/config.lua
  sed -i 's/#0c0c1f/#161c23/g' ~/.config/kitty/kitty.conf
fi
if [ $DAY == 15 ] && [ $MONTH == 04]
then
  #Apr
  sed -i 's/"bogster"/"everforest"/g' ~/.config/lvim/config.lua
  sed -i 's/#161c23/#2b3339/g' ~/.config/kitty/kitty.conf
fi
if [ $DAY == 15 ] && [ $MONTH == 05]
then
  #May
  sed -i 's/"everforest"/"alduin"/g' ~/.config/lvim/config.lua
  sed -i 's/#2b3339/#1c1c1c/g' ~/.config/kitty/kitty.conf
fi
if [ $DAY == 15 ] && [ $MONTH == 06]
then
  #Jun
  sed -i 's/"alduin"/"gruvbox-material"/g' ~/.config/lvim/config.lua
  sed -i 's/#1c1c1c/#32302F/g' ~/.config/kitty/kitty.conf
fi
if [ $DAY == 15 ] && [ $MONTH == 07]
then
  #Jul
  sed -i 's/"gruvbox-material"/"miramare"/g' ~/.config/lvim/config.lua
  sed -i 's/#32302F/#2A2426/g' ~/.config/kitty/kitty.conf
fi
if [ $DAY == 15 ] && [ $MONTH == 08]
then
  #Aug
  sed -i 's/"miramare"/"farout"/g' ~/.config/lvim/config.lua
  sed -i 's/#2A2426/#0F0908/g' ~/.config/kitty/kitty.conf
fi
if [ $DAY == 15 ] && [ $MONTH == 09]
then
  #Sept
  sed -i 's/"farout"/"tokyonight"/g' ~/.config/lvim/config.lua
  sed -i 's/#0F0908/#24283B/g' ~/.config/kitty/kitty.conf
fi
if [ $DAY == 15 ] && [ $MONTH == 10]
then
  #Oct
  sed -i 's/"tokyonight"/"ayu"/g' ~/.config/lvim/config.lua
  sed -i 's/#24283B/#212733/g' ~/.config/kitty/kitty.conf
fi
if [ $DAY == 15 ] && [ $MONTH == 11]
then
  #Nov
  sed -i 's/"ayu"/"melange"/g' ~/.config/lvim/config.lua
  sed -i 's/#212733/#2A2622/g' ~/.config/kitty/kitty.conf
fi
if [ $DAY == 15 ] && [ $MONTH == 12]
then
  #Dec
  sed -i 's/"melange"/"onedark"/g' ~/.config/lvim/config.lua
  sed -i 's/#2A2622/#282C34/g' ~/.config/kitty/kitty.conf
fi

# Fix docker 
sudo mkdir /sys/fs/cgroup/systemd
sudo mount -t cgroup -o none,name=systemd cgroup /sys/fs/cgroup/systemd

# change my colorScheme
# $DAY=$(date "+%d")
# if [ $DAY -eq 15 ]
# then
#   sed 's#"miramare"#"farout"'
# fi

#Set your native resolution IF it does not exist in xrandr
#More info in the script
#run $HOME/.config/qtile/scripts/set-screen-resolution-in-virtualbox.sh

#Find out your monitor name with xrandr or arandr (save and you get this line)
#xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
#xrandr --output DP2 --primary --mode 1920x1080 --rate 60.00 --output LVDS1 --off &
#xrandr --output LVDS1 --mode 1366x768 --output DP3 --mode 1920x1080 --right-of LVDS1
#xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
#MOUSE
xinput --set-prop 15 'libinput Accel Speed' -0.6
xinput --set-prop 16 'libinput Accel Speed' -0.6
xinput --set-prop 18 'libinput Accel Speed' -0.6
setxkbmap -option caps:escape

# Set 4k monitor up before we do stuff
xrandr --fb 7680x2160 --output DP-4 --mode 1920x1080 --scale 2x2 --panning 3840x2160+0+0 --pos 0x0 --output DP-0 --auto --pos 3840x0 --panning 3840x2160+3840+0


#change your keyboard if you need it
#setxkbmap -layout be

#autostart ArcoLinux Welcome App
run dex $HOME/.config/autostart/arcolinux-welcome-app.desktop &

#Some ways to set your wallpaper besides variety or nitrogen
# feh --bg-fill /usr/share/backgrounds/arcolinux/arco-wallpaper.jpg &
#start the conky to learn the shortcuts
# (conky -c $HOME/.config/qtile/scripts/system-overview) &

#IN BETA PHASE
#start sxhkd to replace Qtile native key-bindings
#run sxhkd -c ~/.config/qtile/sxhkd/sxhkdrc &

#starting utility applications at boot time
# run variety &
run nm-applet &
run pamac-tray &
# run xfce4-power-manager &
numlockx on &
blueberry-tray &
picom --config $HOME/.config/qtile/scripts/picom.conf --experimental-backends &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/xfce4/notifyd/xfce4-notifyd &

#starting user applications at boot time
run volumeicon &
# run polybar bar &
#run discord &
nitrogen --restore &
#run caffeine -a &
#run vivaldi-stable &
#run firefox &
#run thunar &
#run dropbox &
#run insync start &
#run spotify &
#run atom &
#run telegram-desktop &
for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload bar &
done

