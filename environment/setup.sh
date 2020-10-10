#!/bin/bash

################################################################################
# Created by Jose Angel Garrido Montoya                                        #
#                                                                              #
# This scripts allow you to install this development repository                #
################################################################################

usage(){
    echo
    echo " Usage: $(basename $0) [-a] [-g] [-v] [-z] [-i] [-n] [-c] [-t] [-r] [-m] [-l] [-s] [-h]"
    echo " -a: install all. (Not included tmux)"
    echo " -g: install git configuration: gitconfig"
    echo " -v: install vim. Include .vimrc, .vim folder and plugins(gitsubmodules)"
    echo " -z: install zsh. Include .zshrc, .oh_my_zsh folder and terminator config file."
    echo " -i: install i3. Include i3config, i3blocks (not included i3status, not using)."
    echo " -n: install nitrogen configs files."
    echo " -c: install compton config file."
    echo " -t: install tmux. Package and config file."
    echo " -r: install rofi. Package and config file."
    echo " -m: install NetworkManager scripts to handle wifi and ethernet."
    echo " -l: install launchers. These files are located in scripts/launchers folder."
    echo " -s: install autostarts scripts. These files are located in scripts/autostart folder."
    echo " -h: prints this help."
}

if [[ $# -eq 0 ]]; then
    usage;
    exit 1;
fi

#### VARIABLES ####
ROOT_DIR=$(dirname $0)
COMPONENTS=$ROOT_DIR/components
SCRIPTS=$ROOT_DIR/scripts

INSTALL_GIT="no"
INSTALL_VIM="no"
INSTALL_ZSH="no"
INSTALL_I3="no"
INSTALL_NITROGEN="no"
INSTALL_COMPTON="no"
INSTALL_TMUX="no"
INSTALL_ROFI="no"
INSTALL_NETWORK="no"
INSTALL_LAUNCHERS="no"
INSTALL_AUTOSTART="no"

PARAMETERS="avzinctrmlsh"

while getopts $PARAMETERS opt; do
    case $opt in
        a)  INSTALL_VIM="yes"; INSTALL_ZSH="yes"; INSTALL_I3="yes";
            INSTALL_NITROGEN="yes"; INSTALL_COMPTON="yes"; INSTALL_TMUX="yes";
            INSTALL_ROFI="yes"; INSTALL_NETWORK="yes"; INSTALL_GIT="yes"
            ;;
        g) INSTALL_GIT="yes";;
        v) INSTALL_VIM="yes";;
        z) INSTALL_ZSH="yes";;
        i) INSTALL_I3="yes";;
        n) INSTALL_NITROGEN="yes";;
        c) INSTALL_COMPTON="yes";;
        t) INSTALL_TMUX="yes";;
        r) INSTALL_ROFI="yes";;
        m) INSTALL_NETWORK="yes";;
        l) INSTALL_LAUNCHERS="yes";;
        s) INSTALL_AUTOSTART="yes";;
        h) usage; exit 0;;
        ?) usage; exit 1;; # invalid option, not included in PARAMETERS
    esac
done

if [ "$INSTALL_GIT" = "yes" ]; then
    $ROOT_DIR/$COMPONENTS/git/install.sh
fi

if [ "$INSTALL_VIM" = "yes" ]; then
    $ROOT_DIR/$COMPONENTS/vim/install.sh
fi

if [ "$INSTALL_ZSH" = "yes" ]; then
    $ROOT_DIR/$COMPONENTS/shell/install.sh -z
fi

if [ "$INSTALL_I3" = "yes" ]; then
    $ROOT_DIR/$COMPONENTS/i3/install.sh
fi

if [ "$INSTALL_NITROGEN" = "yes" ]; then
    $ROOT_DIR/$COMPONENTS/nitrogen/install.sh
fi

if [ "$INSTALL_COMPTON" = "yes" ]; then
    $ROOT_DIR/$COMPONENTS/compton/install.sh
fi

if [ "$INSTALL_ZSH" = "yes" ]; then
    $ROOT_DIR/$COMPONENTS/shell/install.sh -z
fi

if [ "$INSTALL_TMUX" = "yes" ]; then
    $ROOT_DIR/$COMPONENTS/shell/install.sh -t
fi

if [ "$INSTALL_ROFI" = "yes" ]; then
    $ROOT_DIR/$COMPONENTS/rofi/install.sh
fi

if [ "$INSTALL_NETWORK" = "yes" ]; then
    $ROOT_DIR/$COMPONENTS/network/install.sh
fi

if [ "$INSTALL_LAUNCHERS" = "yes" ]; then
    $SCRIPTS/install.sh -l
fi

if [ "$INSTALL_AUTOSTART" = "yes" ]; then
    $SCRIPTS/install.sh -s
fi
