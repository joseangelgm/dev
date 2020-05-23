#!/bin/bash

usage(){
    echo
    echo " Usage: $(basename $0) [-i] [-n]"
    echo " -i: Use only the laptop screen"
    echo " -n: Use screen connected via hdmi"
    echo " -h: prints this help."
}

if [[ $# -eq 0 ]]; then
    usage;
    exit 1;
fi

INTEL="no"
NVIDIA="no"

PARAMETERS="inh"

while getopts $PARAMETERS opt; do
    case $opt in
        i) INTEL="yes";;
        n) NVIDIA="yes";;
        h) usage; exit 0;;
        ?) usage; exit 1;; # invalid option, not included in PARAMETERS
    esac
done

# variables
path_file="$(dirname $(realpath $0))"
LAYOUT_DIR="$path_file/layouts"

if [ "$INTEL" = "yes" ]; then
    $LAYOUT_DIR/"screenLayoutIntel.sh"
    exit 0;
fi

if [ "$NVIDIA" = "yes" ]; then
    $LAYOUT_DIR/"screenLayoutNvidia.sh"
    exit 0;
fi