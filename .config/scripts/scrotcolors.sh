#!/bin/sh

# This work is licensed under a Creative Commons Attribution-ShareAlike 3.0 Unported License.
# More information: http://creativecommons.org/licenses/by-sa/3.0/
#
# Author: Onse <http://goo.gl/Qubl8>

PALETTE="#101010101010:#E8E84F4F4F4F:#B8B7D6D68C8C:#E1E1AAAA5D5D:#7D7DC1C1CFCF:#9B9B6464FBFB:#6D6D87878D8D:#DDDDDDDDDDDD:#404040404040:#D2D23D3D3D3D:#A09FCFCF5D5D:#F3F39D9D2120:#4E4E9F9FB1B1:#85844241FFFF:#424271707B7B:#DDDDDDDDDDDD"
BG_COLOR="#222222222222"
FG_COLOR="#EEEEEEEEECEC"
gconftool-2 --set "/apps/gnome-terminal/profiles/Default/use_theme_background" --type bool false
gconftool-2 --set "/apps/gnome-terminal/profiles/Default/use_theme_colors" --type bool false
gconftool-2 --set "/apps/gnome-terminal/profiles/Default/palette" --type string "$PALETTE"
gconftool-2 --set "/apps/gnome-terminal/profiles/Default/background_color" --type string "$BG_COLOR"
gconftool-2 --set "/apps/gnome-terminal/profiles/Default/foreground_color" --type string "$FG_COLOR"
