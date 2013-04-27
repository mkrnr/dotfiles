#!/bin/bash

# This work is licensed under a Creative Commons Attribution-ShareAlike 3.0 Unported License.
# More information: http://creativecommons.org/licenses/by-sa/3.0/
#
# Author: Martin Koerner <http://mkoerner.de/>

# This script detects an connected display and configures it via xrandr according the first parameter (notebook, external, or both).
# It also turns off an unused display.

# Usage: ./useDisplay [notebook|external|both] notebookDisplayName notebookResolutionWidth notebookResulutionHeight
# e.g.: ./useDisplay.sh both LVDS1 1366 768

# initialization
# mode [notebook|external|both]
mode=$1
# notebook info
nb=$2
nbResW=$3
nbResH=$4

# check for disconnected but still used display
zombie=`xrandr --current | grep 'disconnected' | grep -v 'disconnected (normal'`
zombie=`echo $zombie | awk '{print $1;}'`
if [[ ! -z $zombie ]]; then
    #kill zombie
    xrandr --output $zombie --off
fi

# check for connected external display
IFS="
"
extScrArray=(`xrandr --current | grep -A 1 ' connected' | grep -v ${nb}`)
for ((index=0; index<${#extScrArray[@]}; index++)); do
  if [[ ${extScrArray[$index]} == *connected* ]]; then
    extScr=`echo ${extScrArray[$index]} | awk '{print $1;}'`
    extScrResLine=`expr $index + 1`
    IFS=" "
    extScrRes=(${extScrArray[$extScrResLine]})
    extScrResW=${extScrRes%x*}
    extScrResH=${extScrRes##*x}
  fi
done

# do the magic
if [[  $mode == "notebook" ]]; then
  echo "mode notebook"
  xrandr --output $nb --mode ${nbResW}x$nbResH --pos 0x0 --primary --output $extScr --off
  exit
fi
if [[  -z $extScr ]]; then
  echo "no ext monitor"
  xrandr --output ${nb} --mode ${nbResW}x${nbResH} --pos 0x0 --primary
else
  if [[  $mode == "external" ]]; then
    echo "mode external"
    xrandr --output $nb --off --output ${extScr} --mode ${extScrResW}x${extScrResH} --pos 0x0 --primary
  fi
  if [[  $mode == "both" ]]; then
    nbPosOffset=`expr $extScrResH - $nbResH`
    if [[ nbPosOffset -lt 0 ]]; then
      nbPosOffset=0
    fi
    echo "mode both"
    xrandr --output ${nb} --mode ${nbResW}x${nbResH} --pos 0x${nbPosOffset} --output ${extScr} --mode ${extScrResW}x${extScrResH} --pos ${nbResW}x0 --primary
  fi
fi
