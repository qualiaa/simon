##########################
## functions
##########################

# these are the functions available to your profile.
# go hog wild!

function suspend() {
    systemctl suspend
}

function backlight_off() {
    xset dpms force off
}

function set_backlight_percent() {
    xbacklight -set $1
}

function get_backlight_percent() {
    xbacklight -get | cut -d. -f1
}

function reduce_backlight() {
    if [ $(get_backlight_percent) -gt "$1" ]; then
        set_backlight_percent "$1"
    fi
}

function increase_backlight() {
    if [ $(get_backlight_percent) -lt "$1" ]; then
        set_backlight_percent "$1"
    fi
}
