#!/bin/bash

local PACKAGE_MANAGER="pacman"
local LIST_PARAMETERS="-Q"
local INSTALL_PARAMETERS="-S"

# $1 -> package
check_package_install() {
    local package=$1
    $PACKAGE_MANAGER $LIST_PARAMETERS $package > /dev/null
    # $? is the exit code of last command executed
    if [[ $? -ne 0 ]]; then
        echo "no"
    else
        echo "yes"
    fi
}

# $1 -> package
install_package(){
    local package=$1
    echo "Installing $package"
    sudo $PACKAGE_MANAGER $INSTALL_PARAMETERS $package
}