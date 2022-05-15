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
                    \"full_text\": \"$(test -f $battery_path && printf "%s%%" $(cat $battery_path))\"
                },
                {
                    \"name\": \"brightness\",
                    \"full_text\": \"$(light -G)%\"
                },
                {
                    \"name\": \"date_time\",
                    \"full_text\": \"$(date +%x\ %X)\"
                }
                ]"
    sleep 1
done

