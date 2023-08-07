from libqtile import widget
from .theme import colors
import subprocess

# Get the icons at https://www.nerdfonts.com/cheat-sheet (you need a Nerd Font)

def base(fg='text', bg='dark'):
    return {
        'foreground': colors[fg],
        'background': colors[bg]
    }

def icon(fg='text', bg='dark', fontsize=16, text="?"):
    return widget.TextBox(
        **base(fg, bg),
        fontsize=fontsize,
        text=text,
        padding=3
    )

def workspaces():
    return [
        widget.GroupBox(
            **base(fg='text'),
            font='Hack Nerd Font',
            fontsize=18,
            margin_y=3,
            margin_x=0,
            padding_y=8,
            padding_x=5,
            borderwidth=1,
            active=colors['text'],
            inactive=colors['inactive'],
            rounded=False,
            highlight_method='block',
            urgent_alert_method='block',
            urgent_border=colors['urgent'],
            this_current_screen_border=colors['focus'],
            this_screen_border=colors['focus'],
            other_current_screen_border=colors['dark'],
            other_screen_border=colors['dark'],
            disable_drag=True
        ),
        widget.Spacer(**base(bg='dark'))
        #widget.WindowName(**base(fg='text'), fontsize=14, padding=5, max_chars=40),
]

primary_widgets = [
    *workspaces(),

    #icon(bg="color3", fg="text", text='   '), #nf-linux-kali_linux

    #icon(bg="color4", fg="text", text=' '), # Icon: nf-fa-download
    #widget.CheckUpdates(
    #    distro='Arch',
    #    background=colors['color4'],
    #    colour_have_updates=colors['text'],
    #    colour_no_updates=colors['text'],
    #    no_update_string='0 ',
    #    display_format='{updates} ',
    #    update_interval=1800,
    #     custom_command='checkupdates',
    #),

    # Icon: nf-fa-calendar
    icon(bg='color2', fg='text', fontsize=17, text='  '),

    widget.Clock(**base(bg='color2'), format='%d/%m/%Y - %a - %H:%M '),

    widget.Systray(background=colors['color1'], padding=5),

]

secondary_widgets = [
    *workspaces(),

    widget.CurrentLayoutIcon(**base(bg='color2'), scale=0.65),

    widget.CurrentLayout(**base(bg='color2'), padding=5),

    widget.Clock(**base(bg='color1'), format='%d/%m/%Y - %a - %H:%M '),
]

widget_defaults = {
    'font': 'Hack Nerd Font',
    'fontsize': 14,
    'padding': 1,
}
extension_defaults = widget_defaults.copy()
