#!/bin/bash
pgrep -x "wf-recorder" && pkill -INT -x wf-recorder && notify-send --icon=replay-record-error -h string:wf-recorder:record -t 1000 "Finished Recording" && exit 0

NID=$(notify-send --icon=replay-record -h string:wf-recorder:record -t 1500 "Recording in:" "<span color='#ebdbb2' font='26px'><b>3</b></span>" -p)

echo $NID
sleep 1

NID=$(notify-send --icon=replay-record -h string:wf-recorder:record -t 1500 "Recording in:" "<span color='#ebdbb2' font='26px'><b>2</b></span>" -r $NID -p)

echo $NID

sleep 1

notify-send --icon=replay-record -h string:wf-recorder:record -t 950 "Recording in:" "<span color='#ebdbb2' font='26px'><b>1</b></span>" -r $NID

echo $NID
sleep 1

dateTime=$(date +%m-%d-%Y-%H:%M:%S)
wf-recorder --bframes 40 -f "$HOME/Videos/$dateTime.mp4"
