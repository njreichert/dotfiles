# https://en.jeffprod.com/blog/2020/create-your-own-i3-sway-status-bar/
# is a good starting point / reference.

# Use sway's json status bar, first sending a version prompt,
# Then starting an endless array.

get_battery() {
    if [ -f $1capacity ]
    then
        capacity=$(cat $1capacity)
        printf "%s%%" $capacity
    fi
}

bat_one=/sys/class/power_supply/BAT0/
bat_two=/sys/class/power_supply/BAT1/
chg=/sys/class/power_supply/AC/online
echo "{ \"version\": 1 }"
echo "["
echo "[]"

while :;
do
    echo ",[
                {
                    \"name\": \"chg\",
                    \"full_text\": \"$([ $(cat $chg | tr -d '\n') -gt 0 ] && echo ⚡)\"
                },
                {
                    \"name\": \"bat0\",
                    \"full_text\": \"$(get_battery $bat_one)\"
                },
                {
                    \"name\": \"bat1\",
                    \"full_text\": \"$(get_battery $bat_two)\"
                },
                {
                    \"name\": \"brightness\",
                    \"full_text\": \"Brightness: $(brightnessctl -m | awk -F, '{print $4}')\"
                },
                {
                    \"name\": \"volume\",
                    \"full_text\": \"$(if [ "$(pactl get-sink-mute @DEFAULT_SINK@)" = "Mute: yes" ]; then echo -n "Muted:"; else echo -n "Volume:"; fi) $(pactl get-sink-volume @DEFAULT_SINK@ | awk -F/ '{print $2}' | xargs)\" 
                },
                {
                    \"name\": \"date_time\",
                    \"full_text\": \"$(date +%x\ %I:%M\ %p)\"
                }
        ]" # https://unix.stackexchange.com/a/65967 for the above sed prompt.
    sleep 0.1
done

