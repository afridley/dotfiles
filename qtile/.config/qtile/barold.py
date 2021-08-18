
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
