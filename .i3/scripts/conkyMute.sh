#!/bin/bash

# This work is licensed under a Creative Commons Attribution-ShareAlike 3.0 Unported License.
# More information: http://creativecommons.org/licenses/by-sa/3.0/
#
# Author: Martin Koerner (http://mkoerner.de/)

mute=`amixer get Master | egrep 'Playback.*?\[o' | egrep -o '\[o.+\]'`
if [ $mute == "[on]" ]
then
  vol=`amixer get Master | egrep 'Playback.*\%' | egrep -o '\[.*%'`
  vol=${vol//[/}
  echo $vol
else
  echo "-1%"
fi
