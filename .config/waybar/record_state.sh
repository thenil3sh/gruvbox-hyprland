#!/bin/bash
if pgrep -x 'wf-recorder' > /dev/null; 
then
printf '󰑊'
else
printf ''
fi