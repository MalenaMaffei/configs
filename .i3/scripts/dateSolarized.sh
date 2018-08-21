
#!/bin/bash

################################
# Shows current date
#
# @param {String} format: The format of the date
# @return {Date}: Current date
################################

format=${BLOCK_INSTANCE:-"%a %d %b"}

date +"$format"

#date +"%m-%d"
#echo "<span weight='bold' background=\"#002b36\" foreground=\"#2aa198\">  $fecha </span>"

case $BLOCK_BUTTON in
	# right click: show packages
	1)
        calendar=$(cal -m -n 2)
		notify-send "<span  background='#2f343f' font_family='monospace'>$calendar</span>"
	;;
esac
