#!/bin/sh

cp .gtkrc-2.0 ~/
mkdir -p ~/.local/share/themes/
cp -r Orion ~/.local/share/themes/
mkdir -p ~/.local/share/icons/
cp -rd ubuntu-mono-light ~/.local/share/icons/

sudo apt purge catfish orage sgt-launcher sgt-puzzles

xfconf-query -c xsettings -p /Gtk/FontName -s "DejaVu Sans 10"
xfconf-query -c xsettings -p /Net/ThemeName -s "Adwaita"
xfconf-query -c xsettings -p /Net/IconThemeName -s "ubuntu-mono-light"
xfconf-query -c xfwm4 -p /general/theme -s "Orion"
xfconf-query -c xfwm4 -p /general/title_font -s "DejaVu Sans 10"
xfconf-query -c thunar-volman -p /automount-drives/enabled -s false
xfconf-query -c thunar-volman -p /automount-media/enabled -s false


echo "Don't forget to install userChrome.css"
