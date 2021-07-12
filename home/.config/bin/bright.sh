#!/bin/bash

# You can call this script like this:
# $./bright.sh up
# $./bright.sh down
currentlight=$(light)

function get_light {
    light | awk '{print int($1+0.5)}'
}


function send_notification {
    light=`get_light`
    # Make the bar with the special character ─ (it's not dash -)
    # https://en.wikipedia.org/wiki/Box-drawing_character
    bar="─"$(seq -s "─" $(($light / 5)) | sed 's/[0-9]//g')
    echo $bar
    echo $light
	if [ $light -lt 6 ]
    then
        bar='─'
    fi
    # Send the notification
    sh ~/.config/bin/notify-send.sh -i notification-display-brightness-low "$light%"" ""$bar" -t 2000 -h string:synchronous:"$bar" --replace=555

    # CUSTOM NOTIFICATION BY STARDUST-KYUN
    # sh ~/.config/bin/notify-send.sh -i notification-display-brightness-low "$light%" --replace=555 -t 2000

}

case $1 in
    up)
	light -A 10
	send_notification
	;;
    down)
	light -U 10
	send_notification
	;;
esac
