# Stolen from i3blocks website.

#!/bin/bash
BAT=$(cat /sys/class/power_supply/BAT0/capacity)

# Full and short texts
echo "Battery: $BAT%"
echo "BAT: $BAT%"

# Set urgent flag below 5% or use orange below 20%
if [ $(cat /sys/class/power_supply/BAT0/status) = "Full" ]
then
    echo "#1CB34B"
elif [ ${BAT} -le 20]
then
    echo "#F81118"
elif [ ${BAT} -le 5 ]
then
    exit 33
fi

exit 0

