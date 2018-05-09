#!/bin/bash

sudo apt purge catfish orage sgt-launcher sgt-puzzles gnome-software thunderbird
sudo apt install mpv terminator synaptic dconf-cli

# set terminator as default terminal
cp helpers.rc ~/.config/xfce4/

# make mpv the default player for all video mimetypes
echo [Default Applications] > ~/.config/mimeapps.list
rm mimeapps.list
cat /usr/share/applications/mpv.desktop | grep MimeType \
    | cut -d= -f2 | tr \; \\\n | grep ^video \
    | awk '{print $1."=mpv.desktop"}' >> mimeapps.list
cat /usr/share/applications/org.xfce.Parole.desktop | grep MimeType \
    | cut -d= -f2 | tr \; \\\n | grep ^video \
    | awk '{print $1."=mpv.desktop"}' >> mimeapps.list
cat /usr/share/xubuntu/applications/defaults.list | grep ^video \
    | sed -e 's/parole.desktop/mpv.desktop/' >> mimeapps.list
cat mimeapps.list | sort | uniq >> ~/.config/mimeapps.list

# install themes and icons
cp .gtkrc-2.0 ~/
mkdir -p ~/.local/share/themes/
cp -r Orion ~/.local/share/themes/
mkdir -p ~/.local/share/icons/
cp -rd ubuntu-mono-light ~/.local/share/icons/

# set misc appearence settings
xfconf-query -c xsettings -p /Gtk/FontName -s "DejaVu Sans 9.5"
xfconf-query -c xsettings -p /Net/ThemeName -s "Adwaita"
xfconf-query -c xsettings -p /Net/IconThemeName -s "ubuntu-mono-light"
xfconf-query -c xfwm4 -p /general/theme -s "Orion"
xfconf-query -c xfwm4 -p /general/title_font -s "DejaVu Sans Bold 9.5"
xfconf-query -c thunar-volman -p /automount-drives/enabled -s false
xfconf-query -c thunar-volman -p /automount-media/enabled -s false

# set same, for gnome
dconf write /org/gnome/desktop/interface/font-name "'DejaVu Sans 9.5'"
dconf write /org/gnome/desktop/interface/monospace-font-name "'Monospace 9.5'"
dconf write /org/gnome/desktop/interface/gtk-theme "'Adwaita'"
dconf write /org/gnome/desktop/interface/icon-theme "'ubuntu-mono-light'"


NMONITORS=$(xrandr --listactivemonitors | head -n 1 | cut -d\  -f 2)
echo $NMONITORS monitors found.

if [ "$NMONITORS" == "3" ]
then xfpanel-switch load panels/18.04-3-monitor.tar.bz2
else xfpanel-switch load panels/18.04-1-monitor.tar.bz2
fi

echo "Don't forget to install userChrome.css and panel switch"
