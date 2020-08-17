#!/usr/bin/bash

##################################################################
# The script has to be located in /etc/profile.d/ in order to be #
# execute when manjaro start                                     #
# Another paths can be:                                          #
# ~/.config/autostart                                            #
# See info https://wiki.archlinux.org/index.php/Autostarting     #
##################################################################

#### Turn on monitor if it is connected ####

env | grep SSH_CLIENT

# when we connect thought ssh, we have SSH_CLIENT env variable
if [[ $? -eq 1 ]]; then
    hdmi_state=$(xrandr | grep HDMI | awk '{print $2}')

    if [ $hdmi_state = "connected" ]; then
        /home/$USER/Workspace/dev/environment/components/screen/install.sh -n
    else
        /home/$USER/Workspace/dev/environment/components/screen/install.sh -i
    fi

    #### Turn off wifi card if lan cable is plugged in
    LAN_CARD="enp3s0"

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
#############################################