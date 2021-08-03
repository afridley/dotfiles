# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.


import os
import re
import socket
import subprocess
from libqtile.config import Drag, Key, Screen, Group, Drag, Click, Rule
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook, qtile
from libqtile.widget import Spacer
#import arcobattery

#mod4 or mod = super key
#  #6790EB #6790EB #e5e5e5 #6790EB #5e81ac #4c566a 5f676a
# Green #44CC99 #118877
# Blue #6790EB #3560a9
# yellow #ffcc55 #cc7722
mod = "mod4"
mod1 = "alt"
mod2 = "control"
mainColor = "#ffcc55"
mainColorDimmed = "#cc7722"
mainUnfocusedColor = "#222222"
home = os.path.expanduser('~')


@lazy.function
def window_to_prev_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i - 1].name)

@lazy.function
def window_to_next_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i + 1].name)

################
# Keys
################

keys = [

# FUNCTION KEYS

    Key([], "F12", lazy.spawn('xfce4-terminal --drop-down')),

# SUPER + FUNCTION KEYS

    # Key([mod], "e", lazy.spawn('atom')),
    Key([mod], "c", lazy.spawn('conky-toggle')),
    # Key([mod], "f", lazy.window.toggle_fullscreen()),
    # Key([mod], "f", lazy.layout.maximize()),
    Key([mod], "f", lazy.window.toggle_maximize()),
    # Key([mod], "f", lazy.layout.Max(margin=8, border_width=2, border_focus="#5e81ac", border_normal="#4c566a")),
    Key([mod], "m", lazy.spawn('pragha')),
    Key([mod], "q", lazy.window.kill()),
    Key([mod], "r", lazy.spawn('rofi-theme-selector')),
    Key([mod], "t", lazy.spawn('urxvt')),
    Key([mod], "v", lazy.spawn('pavucontrol')),
    Key([mod], "w", lazy.spawn('vivaldi-stable')),
    Key([mod], "x", lazy.spawn('arcolinux-logout')),
    Key([mod], "Escape", lazy.spawn('xkill')),
    # Key([mod], "Return", lazy.spawn('alacritty')),
    Key([mod], "Return", lazy.spawn('kitty')),
    Key([mod], "KP_Enter", lazy.spawn('termite')),
    Key([mod], "F1", lazy.spawn('vivaldi-stable')),
    Key([mod], "F2", lazy.spawn('atom')),
    Key([mod], "F3", lazy.spawn('inkscape')),
    Key([mod], "F4", lazy.spawn('gimp')),
    Key([mod], "F5", lazy.spawn('meld')),
    Key([mod], "F6", lazy.spawn('vlc --video-on-top')),
    Key([mod], "F7", lazy.spawn('virtualbox')),
    Key([mod], "F8", lazy.spawn('thunar')),
    Key([mod], "F9", lazy.spawn('evolution')),
    Key([mod], "F10", lazy.spawn("spotify")),
    Key([mod], "F11", lazy.spawn('rofi -show run -fullscreen')),
    Key([mod], "F12", lazy.spawn('rofi -show run')),

# SUPER + SHIFT KEYS

    Key([mod, "shift"], "Return", lazy.spawn('thunar')),
    Key([mod, "shift"], "d", lazy.spawn("dmenu_run -i -nb '#191919' -nf '#fea63c' -sb '#fea63c' -sf '#191919' -fn 'NotoMonoRegular:bold:pixelsize=14'")),
    Key([mod, "shift"], "q", lazy.window.kill()),
    Key([mod, "shift"], "r", lazy.restart()),
    Key([mod, "control"], "r", lazy.restart()),
    # Key([mod, "shift"], "x", lazy.shutdown()),

# CONTROL + ALT KEYS

    Key(["mod1", "control"], "Next", lazy.spawn('conky-rotate -n')),
    Key(["mod1", "control"], "Prior", lazy.spawn('conky-rotate -p')),
    Key(["mod1", "control"], "a", lazy.spawn('xfce4-appfinder')),
    Key(["mod1", "control"], "e", lazy.spawn('thunar')),
    Key(["mod1", "control"], "c", lazy.spawn('code')),
    Key(["mod1", "control"], "g", lazy.spawn('arcolinux-tweak-tool')),
    Key(["mod1", "control"], "f", lazy.spawn('firefox')),
    Key(["mod1", "control"], "b", lazy.spawn('brave')),
    Key(["mod1", "control"], "i", lazy.spawn('nitrogen')),
    Key(["mod1", "control"], "k", lazy.spawn(home + '/.config/qtile/scripts/picom-toggle.sh')),
    Key(["mod1", "control"], "l", lazy.spawn('arcolinux-logout')),
    Key(["mod1", "control"], "m", lazy.spawn('xfce4-settings-manager')),
    Key(["mod1", "control"], "o", lazy.spawn(home + '/AppImages/Obsidian-0.11.5.AppImage')),
    Key(["mod1", "control"], "p", lazy.spawn(home + '/.config/polybar/restartpolybar.sh')),
    # Key(["mod1", "control"], "p", lazy.spawn('pamac-manager')),
    Key(["mod1", "control"], "r", lazy.spawn('rofi-theme-selector')),
    Key(["mod1", "control"], "s", lazy.spawn('spotify')),
    Key(["mod1", "control"], "t", lazy.spawn('termite')),
    Key(["mod1", "control"], "v", lazy.spawn('pavucontrol')),
    Key(["mod1", "control"], "u", lazy.spawn('vivaldi-stable')),
    Key(["mod1", "control"], "w", lazy.spawn('arcolinux-welcome-app')),
    Key(["mod1", "control"], "Return", lazy.spawn('termite')),

# ALT + ... KEYS

    # Key(["mod1"], "f", lazy.layout.CurrentLayout({margin = 0})),
    Key(["mod1"], "h", lazy.spawn('urxvt -e htop')),
    # Key(["mod1"], "n", lazy.spawn('variety -n')),
    # Key(["mod1"], "p", lazy.spawn('variety -p')),
    # Key(["mod1"], "t", lazy.spawn('variety -t')),
    # Key(["mod1"], "Up", lazy.spawn('variety --pause')),
    # Key(["mod1"], "Down", lazy.spawn('variety --resume')),
    # Key(["mod1"], "Left", lazy.spawn('variety -p')),
    # Key(["mod1"], "Right", lazy.spawn('variety -n')),
    Key(["mod1"], "F2", lazy.spawn('gmrun')),
    Key(["mod1"], "F3", lazy.spawn('xfce4-appfinder')),
    Key(["mod1"], "d", lazy.spawn(home + '/.config/rofi/launchers/colorful/launcher.sh')),

# VARIETY KEYS WITH PYWAL

    Key(["mod1", "shift"], "f", lazy.spawn(home + '/.config/qtile/scripts/set-pywal.sh -f')),
    Key(["mod1", "shift"], "p", lazy.spawn(home + '/.config/qtile/scripts/set-pywal.sh -p')),
    Key(["mod1", "shift"], "n", lazy.spawn(home + '/.config/qtile/scripts/set-pywal.sh -n')),
    Key(["mod1", "shift"], "u", lazy.spawn(home + '/.config/qtile/scripts/set-pywal.sh -u')),

# CONTROL + SHIFT KEYS

    Key([mod2, "shift"], "Escape", lazy.spawn('xfce4-taskmanager')),

# SCREENSHOTS

    Key([], "Print", lazy.spawn("scrot 'ArcoLinux-%Y-%m-%d-%s_screenshot_$wx$h.jpg' -e 'mv $f $$(xdg-user-dir PICTURES)'")),
    Key([mod2], "Print", lazy.spawn('xfce4-screenshooter')),
    Key([mod2, "shift"], "Print", lazy.spawn('gnome-screenshot -i')),

# MULTIMEDIA KEYS

# INCREASE/DECREASE BRIGHTNESS
    Key([], "XF86MonBrightnessUp", lazy.spawn("xbacklight -inc 5")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("xbacklight -dec 5")),

# INCREASE/DECREASE/MUTE VOLUME
    Key([], "XF86AudioMute", lazy.spawn("amixer -q set Master toggle")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -q set Master 5%-")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -q set Master 5%+")),

    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next")),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous")),
    Key([], "XF86AudioStop", lazy.spawn("playerctl stop")),

#    Key([], "XF86AudioPlay", lazy.spawn("mpc toggle")),
#    Key([], "XF86AudioNext", lazy.spawn("mpc next")),
#    Key([], "XF86AudioPrev", lazy.spawn("mpc prev")),
#    Key([], "XF86AudioStop", lazy.spawn("mpc stop")),

# QTILE LAYOUT KEYS
    # Key([mod], "n", lazy.layout.normalize()),
    Key([mod], "n", lazy.layout.reset()),
    Key([mod], "space", lazy.next_layout()),
    Key([mod], "e", lazy.layout.maximize()),

# CHANGE FOCUS
    Key([mod], "Up", lazy.layout.up()),
    Key([mod], "Down", lazy.layout.down()),
    Key([mod], "Left", lazy.layout.left()),
    Key([mod], "Right", lazy.layout.right()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),


# RESIZE UP, DOWN, LEFT, RIGHT
    Key([mod, "control"], "l",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
        ),
    Key([mod, "control"], "Right",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
        ),
    Key([mod, "control"], "h",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
        ),
    Key([mod, "control"], "Left",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
        ),
    Key([mod, "control"], "k",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
        ),
    Key([mod, "control"], "Up",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
        ),
    Key([mod, "control"], "j",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
        ),
    Key([mod, "control"], "Down",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
        ),


# FLIP LAYOUT FOR MONADTALL/MONADWIDE
    Key([mod, "shift"], "f", lazy.layout.flip()),

# FLIP LAYOUT FOR BSP
    Key([mod, "mod1"], "k", lazy.layout.flip_up()),
    Key([mod, "mod1"], "j", lazy.layout.flip_down()),
    Key([mod, "mod1"], "l", lazy.layout.flip_right()),
    Key([mod, "mod1"], "h", lazy.layout.flip_left()),

# MOVE WINDOWS UP OR DOWN BSP LAYOUT
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),

# MOVE WINDOWS UP OR DOWN MONADTALL/MONADWIDE LAYOUT
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "Left", lazy.layout.swap_left()),
    Key([mod, "shift"], "Right", lazy.layout.swap_right()),

# TOGGLE FLOATING LAYOUT
    Key([mod, "shift"], "space", lazy.window.toggle_floating()),]

###########################
# Groups and Layouts
###########################

groups = []

# FOR QWERTY KEYBOARDS
group_names = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0",]

# FOR AZERTY KEYBOARDS
#group_names = ["ampersand", "eacute", "quotedbl", "apostrophe", "parenleft", "section", "egrave", "exclam", "ccedilla", "agrave",]

group_labels = ["1 ", "2 ", "3 ", "4 ", "5 ", "6 ", "7 ", "8 ", "9 ", "0",]
# group_labels = ["", "", "", "", "", "", "", "", "", "",]
#group_labels = ["Web", "Edit/chat", "Image", "Gimp", "Meld", "Video", "Vb", "Files", "Mail", "Music",]

group_layouts = ["monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall",]
#group_layouts = ["monadtall", "matrix", "monadtall", "bsp", "monadtall", "matrix", "monadtall", "bsp", "monadtall", "monadtall",]
def go_to_group(group):
    def f(qtile):
        if group in '1890':
            qtile.cmd_to_screen(0), #changes the screen
            # qtile.groupMap[group].cmd_toscreen(), # puts focus on screen
        elif group in '234567':
            qtile.cmd_to_screen(1),
            # qtile.groupMap[group].cmd_toscreen(),
        else:
            qtile.cmd_to_screen(2)
            # qtile.groupMap[group].cmd_toscreen()   

    return f

# Prevents swapping of screens to different monitors
def group_to_screen(group):
    def f(qtile):
        if group != qtile.current_screen.group.name:
            if group in '1890':
                # qtile.cmd_to_screen(0)
                qtile.current_screen.cmd_toggle_group(group)
                # qtile.current_screen.set_group(group)
            else: 
                qtile.current_screen.cmd_toggle_group(group)
                # qtile.cmd_to_screen(1)
                # qtile.cmd_togroup()
                # qtile.current_screen.set_group(group)
                # for i, group in enumerate(qtile.groups):
                #     if group == group.name:
                #         qtile.current_screen.set_group(qtile.groups[i])
        # else: 
        #     for i, group in enumerate(qtile.groups):
        #         if group_name == group.name:
        #             return qtile.current_screen.set_group(qtile.groups[i])
    return f

for i in range(len(group_names)):
    if i == 1:
       groups.append(
            Group(
                name=group_names[i],
                layout=group_layouts[i].lower(),
                label=group_labels[i],
                spawn='brave'
            ))
    elif i == 2:
        groups.append(
            Group(
                name=group_names[i],
                layout=group_layouts[i].lower(),
                label=group_labels[i],
                spawn='slack'
            ))
    elif i == 3:
        groups.append(
            Group(
                name=group_names[i],
                layout=group_layouts[i].lower(),
                label=group_labels[i],
                spawn='smerge'
            ))
    else:    
        groups.append(
            Group(
                name=group_names[i],
                layout=group_layouts[i].lower(),
                label=group_labels[i],
            ))

for i in groups:
    # keys.append(Key([mod], i.name, lazy.function(go_to_group(i.name)), lazy.group[i.name].toscreen())),
    keys.append(Key([mod], i.name, lazy.function(go_to_group(i.name)), lazy.function(group_to_screen(i.name)))),
    # keys.append(Key([mod], i.name, lazy.function(go_to_group(i.name)))),
    keys.append(Key([mod, 'shift'], i.name, lazy.window.togroup(i.name)))
    # keys.append(Key([mod, 'shift'], i.name, lazy.window.togroup(i.name), lazy.group[i.name].toscreen()))

for i in groups:
    keys.extend([

#CHANGE WORKSPACES 
        Key([mod], "Tab", lazy.screen.next_group()),
        Key(["mod1"], "Tab", lazy.screen.next_group()),
        Key(["mod1", "shift"], "Tab", lazy.screen.prev_group()),

# MOVE WINDOW TO SELECTED WORKSPACE 1-10 AND STAY ON WORKSPACE
        #Key([mod, "shift"], i.name, lazy.window.togroup(i.name)),
# MOVE WINDOW TO SELECTED WORKSPACE 1-10 AND FOLLOW MOVED WINDOW TO WORKSPACE
        # Key([mod], i.name, lazy.group[i.name].toscreen()), # Original
        # Key([mod], i, lazy.function(go_to_group(i))),
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name) , lazy.group[i.name].toscreen()), #Original
        # Key([mod, "shift"], i, lazy.window.togroup(i))),
    ])



def init_layout_theme():
    return {"margin":25,
            "border_width":4,
            "border_focus": mainColor,
            "border_normal": mainUnfocusedColor
            }

layout_theme = init_layout_theme()

def init_treeTab_theme():
    return {
        "active_bg": mainColor,
        "active_fg": "#FFF",
        "bg_color": "#555",
        "border_width": 2,
        "inactive_bg": "#777",
        "inactive_fg": "#FFF",
        "panel_width": 150,
    }

tree_theme = init_treeTab_theme()

layouts = [
    layout.MonadTall(**layout_theme),
    layout.MonadWide(**layout_theme),
    layout.Matrix(**layout_theme),
    layout.Bsp(**layout_theme),
    layout.Floating(**layout_theme),
    layout.RatioTile(**layout_theme),
    layout.Max(**layout_theme),
    layout.TreeTab(
            font='sans',
            name="looking good",
            bg_color="#31363D",
            inactive_bg="151515",
            panel_width=150,
            margin_left=0,
            margin_y=0,
            sections=['TreeTab'],
            section_left=0,
            padding_x=4,
            active_bg=mainColor,
            rounded=False,
    ),
    layout.Stack(),
    layout.Tile(),
    layout.Zoomy()
]

#######################
# Bar
#######################

# COLORS FOR THE BAR

def init_colors():
    return [["#2F343F", "#2F343F"], # color 0
            ["#2F343F50", "#2F343F50"], # color 1
            ["#c0c5ce", "#c0c5ce"], # color 2
            ["#fba922", "#fba922"], # color 3
            ["#3384d0", "#3384d0"], # color 4
            ["#f3f4f5", "#f3f4f5"], # color 5
            ["#cd1f3f", "#cd1f3f"], # color 6
            ["#62FF00", "#62FF00"], # color 7
            ["#6790eb", "#6790eb"], # color 8
            ["#a9a9a9", "#a9a9a9"]] # color 9


colors = init_colors()

# WIDGETS FOR THE BAR

# def init_widgets_defaults():
#     return dict(font="Noto Sans",
#                 fontsize = 12,
#                 padding = 2,
#                 background=colors[1]
#                 )

# widget_defaults = init_widgets_defaults()

# def init_widgets_list():
#     prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())
#     widgets_list = [
#                widget.GroupBox(font="FontAwesome",
#                         fontsize = 16,
#                         padding_y = 6,
#                         padding_x = 5,
#                         borderwidth = 0,
#                         disable_drag = True,
#                         active = colors[9],
#                         inactive = colors[5],
#                         rounded = False,
#                         highlight_method = "text",
#                         this_current_screen_border = colors[8],
#                         foreground = colors[2],
#                         # background = colors[1]
#                         ),
#                widget.Sep(
#                         linewidth = 1,
#                         padding = 10,
#                         foreground = colors[2],
#                         # background = colors[1]
#                         ),
#                widget.CurrentLayout(
#                         font = "Noto Sans Bold",
#                         foreground = colors[5],
#                         # background = colors[1]
#                         ),
#                widget.Sep(
#                         linewidth = 1,
#                         padding = 10,
#                         foreground = colors[2],
#                         # background = colors[1]
#                         ),
#                widget.WindowName(font="Noto Sans",
#                         fontsize = 12,
#                         foreground = colors[5],
#                         # background = colors[1],
#                         ),
#                # widget.Net(
#                #          font="Noto Sans",
#                #          fontsize=12,
#                #          interface="enp0s31f6",
#                #          foreground=colors[2],
#                #          background=colors[1],
#                #          padding = 0,
#                #          ),
#                # widget.Sep(
#                #          linewidth = 1,
#                #          padding = 10,
#                #          foreground = colors[2],
#                #          background = colors[1]
#                #          ),
#                # widget.NetGraph(
#                #          font="Noto Sans",
#                #          fontsize=12,
#                #          bandwidth="down",
#                #          interface="auto",
#                #          fill_color = colors[8],
#                #          foreground=colors[2],
#                #          background=colors[1],
#                #          graph_color = colors[8],
#                #          border_color = colors[2],
#                #          padding = 0,
#                #          border_width = 1,
#                #          line_width = 1,
#                #          ),
#                # widget.Sep(
#                #          linewidth = 1,
#                #          padding = 10,
#                #          foreground = colors[2],
#                #          background = colors[1]
#                #          ),
#                # # do not activate in Virtualbox - will break qtile
#                widget.ThermalSensor(
#                         foreground = colors[5],
#                         foreground_alert = colors[6],
#                         # background = colors[1],
#                         fontsize = 16,
#                         metric = True,
#                         padding = 20,
#                         threshold = 80
#                         ),
#                # # battery option 1  ArcoLinux Horizontal icons do not forget to import arcobattery at the top
#                # widget.Sep(
#                #          linewidth = 1,
#                #          padding = 10,
#                #          foreground = colors[2],
#                #          background = colors[1]
#                #          ),
#                # arcobattery.BatteryIcon(
#                #          padding=0,
#                #          scale=0.7,
#                #          y_poss=2,
#                #          theme_path=home + "/.config/qtile/icons/battery_icons_horiz",
#                #          update_interval = 5,
#                #          background = colors[1]
#                #          ),
#                # # battery option 2  from Qtile
#                # widget.Sep(
#                #          linewidth = 1,
#                #          padding = 10,
#                #          foreground = colors[2],
#                #          background = colors[1]
#                #          ),
#                # widget.Battery(
#                #          font="Noto Sans",
#                #          update_interval = 10,
#                #          fontsize = 12,
#                #          foreground = colors[5],
#                #          background = colors[1],
# 	           #          ),
#             #    widget.TextBox(
#             #             font="FontAwesome",
#             #             text="  ",
#             #             foreground=colors[6],
#             #             background=colors[1],
#             #             padding = 0,
#             #             fontsize=16
#             #             ),
#             #    widget.CPUGraph(
#             #             border_color = colors[2],
#             #             fill_color = colors[8],
#             #             graph_color = colors[8],
#             #             background=colors[1],
#             #             border_width = 1,
#             #             line_width = 1,
#             #             core = "all",
#             #             type = "box"
#             #             ),
#             #    widget.Sep(
#             #             linewidth = 1,
#             #             padding = 10,
#             #             foreground = colors[2],
#             #             background = colors[1]
#             #             ),
#             #    widget.TextBox(
#             #             font="FontAwesome",
#             #             text="  ",
#             #             foreground=colors[4],
#             #             background=colors[1],
#             #             padding = 0,
#             #             fontsize=16
#             #             ),
#             #    widget.Memory(
#             #             font="Noto Sans",
#             #             format = '{MemUsed}M/{MemTotal}M',
#             #             update_interval = 1,
#             #             fontsize = 12,
#             #             foreground = colors[5],
#             #             background = colors[1],
#             #            ),
#                widget.Sep(
#                         linewidth = 1,
#                         padding = 10,
#                         foreground = colors[2],
#                         # background = colors[1]
#                         ),
#             #    widget.TextBox(
#             #             font="FontAwesome",
#             #             text="  ",
#             #             foreground=colors[3],
#             #             background=colors[1],
#             #             padding = 0,
#             #             fontsize=16
#             #             ),
#                widget.Clock(
#                         foreground = colors[5],
#                         # background = colors[1],
#                         fontsize = 16,
#                         # format="%Y-%m-%d %H:%M"
#                         format="%I:%M %p",
#                         padding=20
#                         ),
#                widget.Sep(
#                         linewidth = 1,
#                         padding = 10,
#                         foreground = colors[2],
#                         # background = colors[1]
#                         ),
#                widget.Systray(
#                         # background=color[1],
#                         icon_size=20,
#                         padding = 20
#                         ),
#               ]
#     return widgets_list

# widgets_list = init_widgets_list()


# def init_widgets_screen1():
#     widgets_screen1 = init_widgets_list()
#     return widgets_screen1

# def init_widgets_screen2():
#     widgets_screen2 = init_widgets_list()
#     return widgets_screen2

# widgets_screen1 = init_widgets_screen1()
# widgets_screen2 = init_widgets_screen2()


# def init_screens():
#     return [Screen(top=bar.Bar(widgets=init_widgets_screen1(), size=30)),
#             Screen(top=bar.Bar(widgets=init_widgets_screen2(), size=30))]
# screens = init_screens()

def init_screens():
    return [Screen(top=bar.Gap(size=34), width=500, height=500),
            Screen(top=bar.Gap(size=34), width=500, height=500)]
screens = init_screens()

# widget_padding = 20
# screens = [
#     Screen(
#         top=bar.Bar(
#             [
#                 widget.GroupBox(
#                     disable_drag=True,
#                     highlight_method="line",
#                     # highlight_color=['#000000', '#000000'],
#                     this_current_screen_border=mainColor,
#                     this_screen_border=mainColorDimmed,
#                     other_current_screen_border=mainColor,
#                     other_screen_border=mainColorDimmed,
#                     border_color=mainColorDimmed,
#                     # visible_groups=get_workspace_groups(wsp['current']),
#                     spacing=0,
#                     borderwidth=2, 
#                     padding=10,
#                 ),
#                 #  widget.Prompt(
#                 #      prompt="run: ",
#                 #      ignore_dups_history=True,
#                 #  ),
#                  widget.WindowName(),

#                     widget.ThermalSensor(
#                                 foreground = colors[5],
#                                 foreground_alert = colors[6],
#                                 # background = colors[1],
#                                 fontsize = 16,
#                                 metric = True,
#                                 padding = 20,
#                                 threshold = 80
#                                 ),
#                 #  widget.CPUGraph(
#                 #      width=50,
#                 #      border_width=1,
#                 #      border_color="#000000",
#                 #      frequency=5,
#                 #      line_width=1,
#                 #      samples=50,
#                 #  ),
#                 #  widget.MemoryGraph(
#                 #      width=50,
#                 #      border_width=1,
#                 #      border_color="#000000",
#                 #      line_width=1,
#                 #      frequency=5,
#                 #      fill_color="EEE8AA",
#                 #      padding=20
#                 #  ),
#                 widget.Volume(fontsize=16, update_interval=2, padding=widget_padding),
#                 widget.Systray(),
#                 widget.Clock(
#                     # format='%a %b %d, %H:%M',
#                     format="%I:%M %p",
#                 ),
#                 widget.CurrentLayoutIcon(scale=0.65),
#             ],
#             30,
#             # background='#00000055'
#         ),
#     ),
#      Screen(
#         top=bar.Bar(
#             [
#                 widget.GroupBox(
#                     disable_drag=True,
#                     highlight_method="line",
#                     # highlight_color=['#000000', '#000000'],
#                     this_current_screen_border=mainColor,
#                     this_screen_border=mainColorDimmed,
#                     other_current_screen_border=mainColor,
#                     other_screen_border=mainColorDimmed,
#                     border_color=mainColorDimmed,
#                     # visible_groups=get_workspace_groups(wsp['current']),
#                     spacing=0,
#                     borderwidth=2,
#                     padding=10,
#                 ),
#                 #  widget.Prompt(
#                 #      prompt="run: ",
#                 #      ignore_dups_history=True,
#                 #  ),
#                  widget.WindowName(),

#                     widget.ThermalSensor(
#                                 foreground = colors[5],
#                                 foreground_alert = colors[6],
#                                 # background = colors[1],
#                                 fontsize = 16,
#                                 metric = True,
#                                 padding = 20,
#                                 threshold = 80
#                                 ),
#                 #  widget.CPUGraph(
#                 #      width=50,
#                 #      border_width=1,
#                 #      border_color="#000000",
#                 #      frequency=5,
#                 #      line_width=1,
#                 #      samples=50,
#                 #  ),
#                 #  widget.MemoryGraph(
#                 #      width=50,
#                 #      border_width=1,
#                 #      border_color="#000000",
#                 #      line_width=1,
#                 #      frequency=5,
#                 #      fill_color="EEE8AA",
#                 #      padding=20
#                 #  ),
#                 widget.Volume(fontsize=16, update_interval=2, padding=widget_padding),
#                 widget.Systray(),
#                 widget.Clock(
#                     # format='%a %b %d, %H:%M',
#                     format="%I:%M %p",
#                 ),
#                 widget.CurrentLayoutIcon(scale=0.65),
#             ],
#             30,
#             # background='#00000055'
#         ),
#     )
# ]


# MOUSE CONFIGURATION
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size())
]

dgroups_key_binder = None
dgroups_app_rules = []

# ASSIGN APPLICATIONS TO A SPECIFIC GROUPNAME
# BEGIN

# @hook.subscribe.client_new
# def assign_app_group(client):
#     d = {}
#     #########################################################
#     ################ assgin apps to groups ##################
#     #########################################################
#     d["1"] = ["Navigator", "Firefox", "Vivaldi-stable", "Vivaldi-snapshot", "Chromium", "Google-chrome", "Brave", "Brave-browser",
#               "navigator", "firefox", "vivaldi-stable", "vivaldi-snapshot", "chromium", "google-chrome", "brave", "brave-browser", ]
#     d["2"] = [ "Atom", "Subl3", "Geany", "Brackets", "Code-oss", "Code", "TelegramDesktop", "Discord",
#                "atom", "subl3", "geany", "brackets", "code-oss", "code", "telegramDesktop", "discord", ]
#     d["3"] = ["Inkscape", "Nomacs", "Ristretto", "Nitrogen", "Feh",
#               "inkscape", "nomacs", "ristretto", "nitrogen", "feh", ]
#     d["4"] = ["Gimp", "gimp" ]
#     d["5"] = ["Meld", "meld", "org.gnome.meld" "org.gnome.Meld" ]
#     d["6"] = ["Vlc","vlc", "Mpv", "mpv" ]
#     d["7"] = ["VirtualBox Manager", "VirtualBox Machine", "Vmplayer",
#               "virtualbox manager", "virtualbox machine", "vmplayer", ]
#     d["8"] = ["Thunar", "Nemo", "Caja", "Nautilus", "org.gnome.Nautilus", "Pcmanfm", "Pcmanfm-qt",
#               "thunar", "nemo", "caja", "nautilus", "org.gnome.nautilus", "pcmanfm", "pcmanfm-qt", ]
#     d["9"] = ["Evolution", "Geary", "Mail", "Thunderbird",
#               "evolution", "geary", "mail", "thunderbird" ]
#     d["0"] = ["Spotify", "Pragha", "Clementine", "Deadbeef", "Audacious",
#               "spotify", "pragha", "clementine", "deadbeef", "audacious" ]
#     ##########################################################
#     wm_class = client.window.get_wm_class()[0]
#
#     for i in range(len(d)):
#         if wm_class in list(d.values())[i]:
#             group = list(d.keys())[i]
#             client.togroup(group)
#             client.group.cmd_toscreen()

# END
# ASSIGN APPLICATIONS TO A SPECIFIC GROUPNAME

main = None

@hook.subscribe.startup_once
def start_once():
    #startUpApps = [{app: "brave", screen: "2"}, {app: "slack"}]

    # for i in startUpApps:
    #     lazy.function(app_or_group(i.screen, i.app))

    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/scripts/autostart.sh'])


@hook.subscribe.startup
def start_always():
    # Set the cursor to something sane in X
    #qtile.cmd_toggle_group('2', true)
    #qtile.cmd_spawn('firefox')
    #qtile.function(app_or_group('2', 'firefox'))
    subprocess.Popen(['xsetroot', '-cursor_name', 'left_ptr'])

@hook.subscribe.client_new
def set_floating(window):
    if (window.window.get_wm_transient_for()
            or window.window.get_wm_type() in floating_types):
        window.floating = True

floating_types = ["notification", "toolbar", "splash", "dialog"]


follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    {'wmclass': 'Arcolinux-welcome-app.py'},
    {'wmclass': 'Arcolinux-tweak-tool.py'},
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},
    {'wmclass': 'makebranch'},
    {'wmclass': 'maketag'},
    {'wmclass': 'Arandr'},
    {'wmclass': 'feh'},
    {'wmclass': 'Galculator'},
    {'wmclass': 'arcolinux-logout'},
    {'wmclass': 'xfce4-terminal'},
    {'wname': 'branchdialog'},
    {'wname': 'Open File'},
    {'wname': 'pinentry'},
    {'wmclass': 'ssh-askpass'},

],  fullscreen_border_width = 0, max_border_width = 4, border_width = 4, border_focus=mainColor, border_normal=mainUnfocusedColor)
auto_fullscreen = True

focus_on_window_activation = "focus" # or smart

wmname = "LG3D"
