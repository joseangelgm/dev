#!/bin/bash

# require files
path_file="$(dirname $(realpath $0))"
path_utils="$path_file/../../utils"

source $path_utils/package.sh
source $path_utils/symlink.sh

# variables
CONFIG_DIR="$path_file/config"

# packages
I3BLOCKS_PACKAGE="i3blocks"

# install i3block
echo
echo "Setting up i3blocks"
result=$(check_package_install $I3BLOCKS_PACKAGE)
if [ $result = "no" ]; then
    install_package $I3BLOCKS_PACKAGE
    # install_package "light"
fi
create_symbolic_link "$CONFIG_DIR/i3blocks.conf" "/etc/i3blocks.conf" "yes"
#######################

# install i3config
echo
echo "Setting up i3config..."
if [ ! -d "$HOME/.config/i3" ]; then
    echo "Creating $HOME/.config/i3"
    mkdir "$HOME/.config/i3"
fi
create_symbolic_link "$CONFIG_DIR/i3config.conf" "$HOME/.config/i3/config"
#######################

# echo
# echo "Setting up i3bar..."
# create_symbolic_link "$CONFIG_DIR/i3status.conf" "/etc/i3status.conf" "yes"