#!/bin/bash

# require files
path_file="$(dirname $(realpath $0))"
path_utils="$path_file/../../utils"

source $path_utils/package.sh
source $path_utils/symlink.sh

# variables
CONFIG_DIR="$path_file/config"

echo
echo "Setting up compton..."
create_symbolic_link "$CONFIG_DIR/compton.conf" "$HOME/.config/compton.conf"