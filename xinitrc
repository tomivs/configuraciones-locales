#!/bin/bash

## UTILIDADES ##
xbindkeys &
#feh --bg-fill $HOME/Imágenes/fondos/wallpaper-2165941.jpg &
feh --bg-fill $HOME/Imágenes/fondos/wallpaper-536598.jpg &
#conky -c $HOME/.conkyrc-console | while read -r; do xsetroot -name "$REPLY"; done &
conky &
#while sleep 1; do xsetroot -name "`date +\"%a, %Y\"`"; done &
lxpanel -p dwm &
#tint2 &
guake &

#Don't use xcompmgr anymore, found compton to be a much better alternative
#but I still hold there commands here just incase
#xcompmgr -CcfF -I-.015 -O-.03 -D4 -t-5 -l-5 -r4.2 -o.75 &
#xcompmgr -c -C -t-5 -l-5 -r4.2 -o.55 &


#compton -GCc -e .60 --vsync drm --refresh-rate 60.1 --dbe --vsync-aggressive --unredir-if-possible -b &

## GESTOR DE VENTANA ##
GV=dwm
exec dbus-launch $GV


