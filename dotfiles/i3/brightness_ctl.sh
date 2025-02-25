#!/bin/bash
# /sys/class/backlight/intel_backlight/brightness needs to have permisions to write
# chmod u+w /sys/class/backlight/intel_backlight/brightness

option=$1
echo "$option"
if [ "$option" == "up" ]; then
  constant=5000
elif [ "$option" == "down" ]; then
  constant=-5000
else
  echo "wrong argument" && exit 1
fi

current_brightness=$(cat /sys/class/backlight/intel_backlight/brightness)
max_brightness=$(cat /sys/class/backlight/intel_backlight/max_brightness)
next_brightness=$((current_brightness+constant))

if (( $next_brightness > 0 && $next_brightness < $max_brightness )) 
then
  echo "$next_brightness" | tee /sys/class/backlight/intel_backlight/brightness
else
  if (( $constant > 0 )); then
    echo "$max_brightness" | tee /sys/class/backlight/intel_backlight/brightness
  else
    echo "5000" | tee /sys/class/backlight/intel_backlight/brightness
  fi
fi

