from libqtile import bar, widget

bar_font = 30
widget_padding = 40
bar_height = 50

bar_settings = [
    widget.GroupBox(
        disable_drag=True,
        highlight_method="line",
        # highlight_color=['#000000', '#000000'],
        this_current_screen_border=mainColor,
        this_screen_border=mainColorDimmed,
        other_current_screen_border=mainColor,
        other_screen_border=mainColorDimmed,
        border_color=mainColorDimmed,
        # visible_groups=get_workspace_groups(wsp['current']),
        fontsize=bar_font,
        spacing=0,
        borderwidth=2,
        padding=20,
    ),
    #  widget.Prompt(
    #      prompt="run: ",
    #      ignore_dups_history=True,
    #  ),
    widget.WindowName(fontsize=bar_font),

    widget.ThermalSensor(
        foreground=colors[5],
        foreground_alert=colors[6],
        # background = colors[1],
        fontsize=bar_font,
        metric=True,
        padding=40,
        threshold=80
    ),
    #  widget.CPUGraph(
    #      width=50,
    #      border_width=1,
    #      border_color="#000000",
    #      frequency=5,
    #      line_width=1,
    #      samples=50,
    #  ),
    #  widget.MemoryGraph(
    #      width=50,
    #      border_width=1,
    #      border_color="#000000",
    #      line_width=1,
    #      frequency=5,
    #      fill_color="EEE8AA",
    #      padding=20
    #  ),
    widget.Volume(fontsize=bar_font, update_interval=2,
                  padding=widget_padding),
    widget.Systray(),
    widget.Clock(
        fontsize=bar_font,
        # format='%a %b %d, %H:%M',
        format="%I:%M %p",
    ),
    widget.CurrentLayoutIcon(scale=0.65),
]

new_bar1 = bar.Bar(bar_settings, bar_height)
new_bar2 = bar.Bar(bar_settings, bar_height)