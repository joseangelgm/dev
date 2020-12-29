#!/bin/bash

# require files
path_file="$(dirname $(realpath $0))"
path_utils="$path_file/../../utils"

source $path_utils/package.sh
source $path_utils/symlink.sh

# packages
ZSH_PACKAGE="zsh"
TERMINATOR_PACKAGE="terminator"
TMUX_PACKAGE="tmux"

# variables
CONFIG_DIR="$path_file/config"
INSTALL_TMUX="no"
INSTALL_ZSH="no"

PARAMETERS="zt"
while getopts $PARAMETERS opt; do
    case $opt in
        z) INSTALL_ZSH="yes";;
        t) INSTALL_TMUX="yes";;
        ?) usage; exit 1;; # invalid option, not included in PARAMETERS
    esac
done

if [ $INSTALL_ZSH = "yes" ]; then
    # installing zsh
    echo
    echo "Setting up zsh..."
    result=$(check_package_install $ZSH_PACKAGE)
    if [[ "$result" = "no" ]]; then
        install_package $ZSH_PACKAGE
    fi

    create_symbolic_link "$CONFIG_DIR/.profile" "$HOME/.profile"
    create_symbolic_link "$CONFIG_DIR/.zshrc" "$HOME/.zshrc"
    create_symbolic_link "$CONFIG_DIR/.oh-my-zsh" "$HOME/.oh-my-zsh"

    shell=$(echo $SHELL)
    if [ "$sheel" != "$(which zsh)" ]; then
        echo "Setting shell to zsh"
        echo "Executing chsh -s $(which zsh)"
        chsh -s $(which zsh)
    fi
    ####################

    # installing terminator
    echo
    echo "Setting up terminator..."
    result=$(check_package_install $TERMINATOR_PACKAGE)
    if [[ $result = "no" ]]; then
        install_package $TERMINATOR_PACKAGE
    fi

    # check if the location of terminator exists exists
    if [ ! -d "$HOME/.config/terminator" ]; then
        mkdir "$HOME/.config/terminator"
    fi
    create_symbolic_link "$CONFIG_DIR/terminator.conf" "$HOME/.config/terminator/config"
    ####################

    # installing .warprc for wd zsh plugin
    echo
    echo "Setting up warprcs"
    create_symbolic_link "$CONFIG_DIR/.warprc" "$HOME/.warprc"
    ######################################
fi

if [ $INSTALL_TMUX = "yes" ]; then
    echo
    echo "Setting up tmux..."
    result=$(check_package_install $TMUX_PACKAGE)
    if [[ $result = "no" ]]; then
        install_package $TMUX_PACKAGE
    fi
    create_symbolic_link "$CONFIG_DIR/tmux.conf" "$HOME/.tmux.conf"
fi
