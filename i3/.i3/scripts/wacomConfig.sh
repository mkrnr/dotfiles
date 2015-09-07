#!/bin/bash

# This work is licensed under a Creative Commons Attribution-ShareAlike 3.0 Unported License.
# More information: http://creativecommons.org/licenses/by-sa/3.0/
#
# Author: Martin Koerner <http://mkoerner.de/>

# This script configures a wacom tablet

# Usage: ./wacomConfig.sh <main display>
# e.g.: ./wacomConfig.sh HDMI2

stylus=`xsetwacom --list devices | grep STYLUS | awk -F "id: " '{print $2}' | awk -F " " '{print $1}'`
eraser=`xsetwacom --list devices | grep ERASER | awk -F "id: " '{print $2}' | awk -F " " '{print $1}'`

echo stylus: $stylus
echo eraser: $eraser
echo set both to $1


xsetwacom --set $stylus MapToOutput $1
xsetwacom --set $eraser MapToOutput $1



