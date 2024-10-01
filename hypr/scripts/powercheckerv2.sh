battery_status=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep state | awk '{print $2}')
battery_level=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | awk '{print $2}')

if [[ $battery_status == "charging" || $battery_status == "full" ]]; then
  echo "Reload Hyprland config"
elif [[ $battery_status == "discharging" && $battery_level -lt 50 ]]; then
  echo "Battery low and not charging, battery saving mode"
else
  echo "No action needed"
fi
