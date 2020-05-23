#!/bin/bash

# variables
path_file="$(dirname $(realpath $0))"
lan_interface=$LAN_IFACE
network_path="/etc/NetworkManager/dispatcher.d"

network_scripts="$path_file/NetworkScripts" # use dirname because this script is call from ../setup.sh
network_dest="$network_path/$lan_interface"

if [ -d "$network_path" ]; then
    if [ ! -d "$network_dest" ]; then

        echo "Copying scripts from $network_scripts to $network_path"
        sudo cp -R "$network_scripts/"* $network_path

        echo "Renaming $network_path/ethernet to $network_dest"
        sudo mv "$network_path/ethernet" $network_dest

        echo "Changing owner to root. It is needed to execute them"
        sudo chown root:root "$network_dest/"*

        echo "Changing permissions to 755"
        sudo chmod -R 755 "$network_dest/"*
    else
        echo "$network_dest exists. Remove first and then execute again the script."
    fi
else
    echo "$network_path dpesnt exists. Create it first and the execute the script again."
fi