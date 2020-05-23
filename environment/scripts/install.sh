#!/bin/bash

usage(){
    echo
    echo " Usage: $(basename $0) [-l] [-s] [-h]"
    echo " -l: install launchers. These files are located in scripts/launchers folder."
    echo " -s: install autostarts scripts. These files are located in scripts/autostart folder."
    echo " -h: prints this help."
}

if [[ $# -eq 0 ]]; then
    usage;
    exit 1;
fi

# require files
path_file="$(dirname $(realpath $0))"
path_utils="$path_file/../utils"

source $path_utils/symlink.sh

#### VARIABLES ####
AUTOSTART=$path_file/autostart
LAUNCHERS=$path_file/launchers

INSTALL_LAUNCHERS="no"
INSTALL_AUTOSTART="no"

PARAMETERS="lsh"

while getopts $PARAMETERS opt; do
    case $opt in
        l) INSTALL_LAUNCHERS="yes";;
        s) INSTALL_AUTOSTART="yes";;
        h) usage; exit 0;;
        ?) usage; exit 1;; # invalid option, not included in PARAMETERS
    esac
done

if [ "$INSTALL_LAUNCHERS" = "yes" ]; then
    # installing spoty_launcher.sh
    echo
    echo "Installing spoty_launcher.sh"
    create_symbolic_link $LAUNCHERS/spoty_launcher.sh /usr/bin/spoty_launcher "yes"
fi

if [ "$INSTALL_AUTOSTART" = "yes" ]; then
    # installing reconfigure.sh
    echo
    echo "Installing reconfigure.sh"
    create_symbolic_link $AUTOSTART/reconfigure.sh /etc/profile.d/reconfigure.sh "yes"
fi