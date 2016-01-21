#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

#change keyboard mapping
setxkbmap -layout us -variant altgr-intl

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap

if [ -f $userresources ]; then
    xrdb -merge $userresources
fi

if [ -f $usermodmap ]; then
    xmodmap $usermodmap
fi


# disable the beep
xset -b

pulseaudio --start

# start gpg-agent deamon
eval $(gpg-agent --daemon) &

# run autocutsel
autocutsel -fork &
autocutsel -selection PRIMARY -fork &

# unclutter to remove mouse from screen when not used
unclutter -idle 1 -noevents -grab -not Java &

#start ibus-daemon

#ibus-daemon --xim -d

# i3:
exec dbus-launch --exit-with-session i3

