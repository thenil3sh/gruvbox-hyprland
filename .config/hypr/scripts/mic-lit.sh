if grep -q yes; then
    echo "1"
else
    echo "0"
fi | sudo tee /sys/class/leds/platform::micmute/brightness
