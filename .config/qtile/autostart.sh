#!/bin/bash

nm-applet &
nitrogen --restore &
picom --experimental-backends &
nm-applet &
dunst &
kdeconnect-indicator &
urxvtd -q -o -f &
#wal -R &
#telegram-desktop -startintray &
usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
