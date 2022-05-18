# https://en.jeffprod.com/blog/2020/create-your-own-i3-sway-status-bar/
# is a good starting point / reference.

# Use sway's json status bar, first sending a version prompt,
# Then starting an endless array.

battery_path=/sys/class/power_supply/BAT0/capacity
echo "{ \"version\": 1 }"
echo "["
echo "[]"

while :;
do
    echo ",[
                {
                    \"name\": \"battery\",
                    \"full_text\": \"$(test -f $battery_path && printf "Battery: %s%%" $(cat $battery_path))\"
                },
                {
                    \"name\": \"brightness\",
                    \"full_text\": \"Brightness: $(light -G)%\"
                },
                {
                    \"name\": \"date_time\",
                    \"full_text\": \"$(date +%x\ %X)\"
                },
                {
                    \"name\": \"volume\",
                    \"full_text\": \"Volume: $(pulsemixer --get-volume | sed -e 's/\s.*$//')%\" 
                }
        ]" # https://unix.stackexchange.com/a/65967 for the above sed prompt.
    sleep 1
done

