#!/bin/bash

# use BASH_SOURCE to import another scripts because this file is always imported
path_sym="$(dirname $BASH_SOURCE)"
source $path_sym/prompt.sh

# $1 -> source
# $2 -> dest
# $3 -> yes/no. Root permission
create_symbolic_link(){
    source=$1
    dest=$2
    root=$3

    if [ -f "$dest" ] || [ -d "$dest" ] || [ -L "$dest" ]; then
        echo "Exists a file/folder in $dest"
        option=$(prompt_choose_option $dest)
        if [[ $option = "yes" ]]; then
            echo "Overwriting $dest"
            echo "Creating symlink from $source to $dest"
            if [[ "$root" = "yes" ]]; then
                sudo rm "$dest"
                sudo ln -s $source $dest
            else
                rm "$dest"
                ln -s $source $dest
            fi
        else
            echo "$dest is not going to be overwrited."
        fi
    else
        echo "$dest doesnt exists. Creating the file/folder"
        echo "Creating symlink from $source to $dest"
        if [[ "$root" = "yes" ]]; then
            sudo ln -s $source $dest
        else
            ln -s $source $dest
        fi
    fi
}