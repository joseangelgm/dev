#!/usr/bin/bash

##################################################################
# The script has to be located in /etc/profile.d/ in order to be #
# execute when manjaro start                                     #
# Another paths can be:                                          #
# ~/.config/autostart                                            #
# See info https://wiki.archlinux.org/index.php/Autostarting     #
##################################################################

#### Turn on monitor if it is connected ####

display=$(env | grep DISPLAY)

# when turn on, if ssh then DISPLAY is not set
if [[ $? -eq 0 ]]; then
    hdmi_state=$(xrandr | grep HDMI1 | awk '{print $2}')

    if [ $hdmi_state = "connected" ]
    then
        xrandr --output eDP1 --primary --mode 1366x768 --pos 277x1080 --rotate normal --output HDMI1 --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
        nitrogen --restore
    elif [ $hdmi_state = "disconnected" ]
    then
        xrandr --output HDMI1 --off --output VIRTUAL1 --off --output eDP1 --primary --mode 1366x768 --pos 0x0 --rotate normal
        nitrogen --restore
    else
        echo ""
    fi
fi

#############################################

#### Turn off wifi card if lan card is connected to the network

LAN_CARD="enp4s0"

if [[ "$(cat /sys/class/net/$LAN_CARD/operstate)" = 'up' ]]; then
    nmcli radio wifi off
else
    nmcli radio wifi on
fi

#####################################################

#### Disalbe touchscreen ############

# id_touchscreen=$(xinput | grep 'ELAN Touchscreen' | awk {'print $5'} | cut -d '=' -f 2)
# xinput disable "$id_touchscreen"

#####################################
sleep 2
i3-msg reload
fi

