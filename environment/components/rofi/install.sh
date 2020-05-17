#!/bin/bash

# require files
path_file="$(dirname $(realpath $0))"
path_utils="$path_file/../../utils"

source $path_utils/package.sh
source $path_utils/symlink.sh

# packages
ROFI_PACKAGE="rofi"

# variables
CONFIG_DIR="$path_file/config"

echo
echo "Setting up rofi..."
result=$(check_package_install $ROFI_PACKAGE)
if [ $result = "no" ]; then
    install_package $ROFI_PACKAGE
fi

if [ ! -d "$HOME/.config/rofi/" ]; then
    mkdir "$HOME/.config/rofi/"
fi
create_symbolic_link "$CONFIG_DIR/rofi.conf" "$HOME/.config/rofi/config"