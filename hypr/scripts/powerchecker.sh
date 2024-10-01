while true; do
if [[ $(cat /sys/class/power_supply/ACAD/online) -eq 0 ]]; then
  hyprctl keyword decoration:blur:enabled false
  hyprctl keyword decoration:drop_shadow false
else
  hyprctl keyword decoration:blur:enabled true
  hyprctl keyword decoration:drop_shadow true
fi
sleep 10
done
