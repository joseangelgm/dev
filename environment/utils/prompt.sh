#!/bin/bash

# $1 -> file
prompt_choose_option(){
    local path=$1
    read -p "Do you want to remove $path? (y/n/d=yes) $(echo $'\n> ')" -n 1 -r opt
    local option="no"
    case $opt in
        [yY]) option="yes";;
        [nN]) option="no";;
        *) option="yes";;
    esac
    echo $option
}