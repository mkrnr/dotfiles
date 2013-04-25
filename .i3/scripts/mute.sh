#!/bin/bash

# This work is licensed under a Creative Commons Attribution-ShareAlike 3.0 Unported License.
# More information: http://creativecommons.org/licenses/by-sa/3.0/
#
# Author: Martin Koerner <http://mkoerner.de/>

CURRENT_STATE=`amixer get Master | egrep 'Playback.*?\[o' | egrep -o '\[o.+\]'`
if [[ $CURRENT_STATE == '[on]' ]]; then
 amixer set Master 0+ mute
else
 amixer set Master unmute
 amixer set Speaker unmute
 amixer set Headphone unmute
fi
