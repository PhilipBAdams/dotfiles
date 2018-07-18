#!/bin/sh

redshift -l 38.6272:-90.1978 -t 6200:4200 -m randr &
unclutter -idle 3 -jitter 5 &
xset +fp /usr/share/fonts/local/
xset fp rehash
xrdb ~/.Xresources &
####### hsetroot -tile documents/wallpapers/subtle_orange_emboss.png -tint #6d9cbe
xsetroot -bg \#42717b -mod 2 2 &
xsetroot -cursor_name left_ptr &
urxvtd -q -f -o
# mpd &
#sxhkd &
#[ ! -s ~/.config/mpd/pid ] && mpd
#pidof mpdscribble >& /dev/null
#if [ $? -ne 0 ]; then
# mpdscribble &
# mpdr -d &
#fi
mpd && mpdscribble && mpdr -d &
# mpd &
######## mocp -S			     
#xset -dpms
#xset s off
xset -b
emacs --daemon &
######## mocscrobble.py -d
#########xrandr --output DVI-I-3 --primary
setxkbmap -option ctrl:nocaps &
xhost +
xbacklight -set 25 &			
#indicator-kdeconnect &
#/usr/lib/kdeconnectd &
#indicator-kdeconnect &
tint2 &
nm-applet &
#dunst &
/lib/xfce4/notifyd/xfce4-notifyd &

#exec bspwm
#exec openbox
#exec i3
exec stumpwm			
#exec emacs
#exec awesome
#exec xmonad
#exec startxfce4
