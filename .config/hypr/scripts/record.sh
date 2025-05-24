#!/bin/bash
pgrep -x "wf-recorder" && pkill -INT -x wf-recorder && notify-send --icon=replay-record-error -h string:wf-recorder:record -t 1000 "Finished Recording" "You can find it in Videos 󰉋"&& pkill -SIGRTMIN+10 waybar && exit 0

LAST=$(notify-send --icon=replay-record -h string:wf-recorder:record -t 1500 "Recording in:" "<span color='#e0def4' font='26px'><b>3</b></span>" -p)

sleep 1

LAST=$(notify-send --icon=replay-record -h string:wf-recorder:record -t 1500 "Recording in:" "<span color='#e0def4' font='26px'><b>2</b></span>" -r $LAST -p)

sleep 1

notify-send --icon=replay-record -h string:wf-recorder:record -t 950 "Recording in:" "<span color='#e0def4' font='26px'><b>1</b></span>" -r $LAST

sleep 1

dateTime=$(date +%m-%d-%Y-%H:%M:%S)
pkill -SIGRTMIN+10 waybar
wf-recorder --bframes 40 -f "$HOME/Videos/$dateTime.mp4"
