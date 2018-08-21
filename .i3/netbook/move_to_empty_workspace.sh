#!/bin/bash
#TODO: que encuentre el 1er gap entre los numeros y que ahi abra el nuevo workspace
#i3-msg workspace $(($(i3-msg -t get_workspaces | tr , '\n' | grep '"num":' | cut -d : -f 2 | sort -rn | head -1) + 1))
for i in {1..10}; do
    w=$(i3-msg -t get_workspaces | tr , '\n' | grep "\"num\":$i")
    if [ -z "$w" ]
    then
         xdotool key --clearmodifiers Super_L+Shift_L+$i
        break
    fi
done
