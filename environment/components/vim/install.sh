#!/bin/bash

# require files
path_file="$(dirname $(realpath $0))"
path_utils="$path_file/../../utils"

source $path_utils/package.sh
source $path_utils/symlink.sh

#### Functions ####
install_modules() {
    echo "Installing submodules..."
    git submodule init
    git submodule update --recursive
}

# packages
VIM_PACKAGE="vim"

# variabless
CONFIG_DIR="$path_file/config"

echo
echo "Setting up vim..."
result=$(check_package_install $VIM_PACKAGE)
if [[ "$result" = "no" ]]; then
    install_package $VIM_PACKAGE
fi

install_modules
create_symbolic_link "$CONFIG_DIR/.vimrc" "$HOME/.vimrc"
create_symbolic_link "$CONFIG_DIR/.vim" "$HOME/.vim"