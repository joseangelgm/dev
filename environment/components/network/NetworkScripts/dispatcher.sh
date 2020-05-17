#!/bin/bash

# Network manager pass as arguments the interface $1 and the status $2
interface=$1
status=$2

echo "I: $interface S: $status" >> /tmp/log.network

full_path=$(dirname $(realpath $0))

`"$full_path/$interface/$status"`

pkill -SIGRTMIN+5 i3blocks
