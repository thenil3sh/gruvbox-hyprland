#! /bin/bash

CAMERA="/dev/video0"
KEY="/sys/class/leds/asus::camera/brightness"

accessible () {
    MODE=$(stat -c "%a" "$CAMERA")
    if [ "$MODE" == "660" ]; then
        return 0
    else
        return 1
    fi
}

if [ "$1" == "--change" ]; then
    if accessible; then
        sudo chmod 000 /dev/video0
        echo "LMaoi"
        echo 1 | sudo tee $KEY
    else
        sudo chmod 660 /dev/video0
        echo 0 | sudo tee $KEY
    fi
else
    if accessible; then
        echo "lamo"
        echo 0 | sudo tee $KEY
    else
        echo 1 | sudo tee $KEY
    fi
fi
