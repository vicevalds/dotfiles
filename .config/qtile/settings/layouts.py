# Antonio Sarosi
# https://youtube.com/c/antoniosarosi
# https://github.com/antoniosarosi/dotfiles

from libqtile import layout
from libqtile.config import Match
from .theme import colors

# Layouts and layout rules


layout_conf = {
    'border_focus': colors['urgent'][0],
    'border_width': 3,
    'margin': 4,
    'grow_amount': 2
}

layouts = [
    layout.Max(),
    layout.MonadTall(**layout_conf),
    # layout.Columns(**layout_conf),
    layout.MonadWide(**layout_conf),
    # layout.Matrix(columns=2, **layout_conf),
    # layout.RatioTile(**layout_conf),
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Tile(),
    # layout.TreeTab(**layout_conf),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

floating_layout = layout.Floating(
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class='confirmreset'),
        Match(wm_class='makebranch'),
        Match(wm_class='maketag'),
        Match(wm_class='ssh-askpass'),
        Match(title='branchdialog'),
        Match(title='pinentry'),
    ],
    border_focus=colors["urgent"][0]
)
