# Stolen from i3blocks website.

#!/bin/bash
BAT1=$(cat /sys/class/power_supply/BAT0/capacity)
BAT2=$(cat /sys/class/power_supply/BAT1/capacity)


# Full and short texts
echo "B1: $BAT1% B2: $BAT2%"

# Set urgent flag below 5% or use orange below 20%
if [ $(cat /sys/class/power_supply/BATT/status) = "Full" ]
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

