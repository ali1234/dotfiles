#!/bin/sh

cp .gtkrc-2.0 ~/
mkdir -p ~/.local/share/themes/
cp -r Orion ~/.local/share/themes/

xfconf-query -c xsettings -p /Gtk/FontName -s "DejaVu Sans 10"
xfconf-query -c xsettings -p /Gtk/ThemeName -s "Adwaita"
xfconf-query -c xsettings -p /Gtk/IconThemeName -s "ubuntu-mono-light"
xfconf-query -c xfwm4 -p /general/theme -s "Orion"
xfconf-query -c xfwm4 -p /general/title-font -s "DejaVu Sans 10"
xfconf-query -c thunar-volman -p /automount-drives/enabled -s False
xfconf-query -c thunar-volman -p /automount-media/enabled -s False


echo "Don't forget to install userChrome.css"
