# Antonio Sarosi
# https://youtube.com/c/antoniosarosi
# https://github.com/antoniosarosi/dotfiles

# Qtile keybindings

from libqtile.config import Key
from libqtile.command import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
#terminal = guess_terminal()
terminal = "kitty"

keys = [Key(key[0], key[1], *key[2:]) for key in [
    # ------------ Window Configs ------------

    # Switch between windows in current stack pane
    ([mod], "down", lazy.layout.down()),
    ([mod], "up", lazy.layout.up()),
    ([mod], "left", lazy.layout.left()),
    ([mod], "right", lazy.layout.right()),
    ([mod], "space", lazy.layout.next()),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.

    ([mod, "shift"], "left", lazy.layout.shuffle_left()),
    ([mod, "shift"], "right", lazy.layout.shuffle_right()),
    ([mod, "shift"], "down", lazy.layout.shuffle_down()),
    ([mod, "shift"], "up", lazy.layout.shuffle_up()),

    ([mod], "l", lazy.hide_show_bar(position="top")),

    #-------------MonadWide and Tall------------

    ([mod, "control"], "right", lazy.layout.grow()),
    ([mod, "control"], "left", lazy.layout.shrink()),

    # Reset all windows sizes
    ([mod, "control"], "n", lazy.layout.normalize()),
    ([mod, "control"], "z", lazy.layout.maximize()),

    ([mod, "shift"], "Return", lazy.layout.flip()),

    #--------------Toggle Floating Window-------
    ([mod, "shift"], "f", lazy.window.toggle_floating()),

    # Toggle between different layouts as defined below
    ([mod], "Tab", lazy.next_layout()),
    ([mod, "shift"], "Tab", lazy.prev_layout()),

    # Kill window
    ([mod], "w", lazy.window.kill()),

    # Switch focus of monitors
    #([mod], "period", lazy.next_screen()),
    ([mod], "comma", lazy.prev_screen()),

    # Restart Qtile
    ([mod, "control"], "r", lazy.restart()),

    # Shutdown session
    ([mod, "control"], "q", lazy.shutdown()),

    # ------------ App Configs ------------

    # Menu
    ([mod], "m", lazy.spawn("rofi -show drun")),

    # Window Nav
    ([mod, "shift"], "m", lazy.spawn("rofi -show")),

    # Browser
    ([mod], "b", lazy.spawn("firefox")),

    # Block
    ([mod, "control"], "b", lazy.spawn("/opt/./lock.sh")),

    # File explorer GUI
    ([mod], "e", lazy.spawn("thunar")),

    # Terminal - kitty
    ([mod], "Return", lazy.spawn(terminal)),

    # Redshift
    ([mod], "r", lazy.spawn("redshift -O 2400")),
    ([mod, "shift"], "r", lazy.spawn("redshift -x")),

    # Screenshot
    ([mod], "s", lazy.spawn("flameshot gui")),
    # pavucontrol
    ([mod], "p", lazy.spawn("pavucontrol")),

    # ------------ Hardware Configs ------------

    # Volume
    ([], "XF86AudioLowerVolume", lazy.spawn(
        "pactl set-sink-volume @DEFAULT_SINK@ -5%"
    )),
    ([], "XF86AudioRaiseVolume", lazy.spawn(
        "pactl set-sink-volume @DEFAULT_SINK@ +5%"
    )),
    ([], "XF86AudioMute", lazy.spawn(
        "pactl set-sink-mute @DEFAULT_SINK@ toggle"
    )),

    ([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
    ([], "XF86AudioNext", lazy.spawn("playerctl next")),
    ([], "XF86AudioPrev", lazy.spawn("playerctl previous")),

    # Brightness
    ([mod], "F3", lazy.spawn("brightnessctl set +5%")),
    ([mod], "F2", lazy.spawn("brightnessctl set 5%-")),
]]
