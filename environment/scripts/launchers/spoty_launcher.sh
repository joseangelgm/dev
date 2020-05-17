#!/bin/bash

proc_spotify=$(pgrep spotify)

if [[ ! -z "$proc_spotify" ]]; then
    rofi -e "Spotify have already been launched.."
    exit 1
fi

# launch spotify
spotify &

# make sure it is stable
sleep 5

send_signal_spotify(){
    pkill -SIGRTMIN+4 i3blocks
}

SPOTIFY_DEST="org.mpris.MediaPlayer2.spotify"
SPOTIFY_PATH="/org/mpris/MediaPlayer2"
SPOTIFY_CONTROLLER="org.mpris.MediaPlayer2.Player"

TITLE="xesam:title"

output='dbus-send --print-reply --dest=$SPOTIFY_DEST $SPOTIFY_PATH org.freedesktop.DBus.Properties.Get string:$SPOTIFY_CONTROLLER string:Metadata'

song_title(){
    title=$(eval "$output" | grep -w $TITLE -C 1 | grep 'variant' | grep -o '\"\([^"]*\)\"'| sed 's/\"//g')
    echo $title
}

title=""
while [ -z "$title" ]
do
title=$(song_title)
done


pid_spotify=$(pgrep spotify)
aux_title=""
while [ -n "$pid_spotify" ]
do
    sleep 1
    if [[ "$aux_title" != "$title" ]]; then
        send_signal_spotify
        aux_title=$title
    else
        title=$(song_title)
    fi
    pid_spotify=$(pgrep spotify)
done
send_signal_spotify
pkill -9 spotify
exit 0

# get all methods
# dbus-send --session --type=method_call --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Introspectable.Introspect

# get property
# dbus-send --dest=org.mpris.MediaPlayer2.spotify --print-reply /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:interface string:<Property>
