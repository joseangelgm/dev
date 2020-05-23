#!/bin/bash

usage(){
    echo
    echo " Usage: $(basename $0) [-l] [-s] [-h]"
    echo " -l: install launchers. Located in scripts/launchers folder. Installed in /usr/bin symbolic link."
    echo " -s: install autostarts scripts. Located in scripts/autostart folder. Installed in /etc/profile.d symbolic link"
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

    files=$(ls $LAUNCHERS)
    for file in $files
    do
        echo "Installing $file"
        create_symbolic_link $LAUNCHERS/$file /usr/bin/$file "yes"
    done
fi

if [ "$INSTALL_AUTOSTART" = "yes" ]; then

    files=$(ls $AUTOSTART)
    for file in $files
    do
        echo "Installing $file"
        create_symbolic_link $AUTOSTART/$file /etc/profile.d/$file "yes"
    done

fi