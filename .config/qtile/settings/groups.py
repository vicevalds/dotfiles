# Antonio Sarosi
# https://youtube.com/c/antoniosarosi
# https://github.com/antoniosarosi/dotfiles

# Qtile workspaces

from libqtile.config import Key, Group
from libqtile.command import lazy
from .keys import mod, keys


# Get the icons at https://www.nerdfonts.com/cheat-sheet (you need a Nerd Font)
# Icons: 
# nf-fa-firefox 
# nf-dev-git
# nf-cod-beaker
# nf-dev-code_badge

# for dev
groups = [Group(i) for i in [
    " 1 ", " 2 "," 3 ", " 4 ", " 5 ", " 6 ", " 7 ", " 8 ", " 9 ",

# for u
#groups = [Group(i) for i in [
#    " 1 ", " 2 ", " 3 "," 4 ", " 5 ", " 6", " 7 ", " 8 ", " 9 ", 

]]

for i, group in enumerate(groups):
    actual_key = str(i + 1)
    keys.extend([
        # Switch to workspace N
        Key([mod], actual_key, lazy.group[group.name].toscreen()),
        # Send window to workspace N
        Key([mod, "shift"], actual_key, lazy.window.togroup(group.name))
    ])
