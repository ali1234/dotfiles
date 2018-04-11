#!/bin/sh

cp .gtkrc-2.0 ~/
mkdir -p ~/.local/share/themes/
cp -r Orion ~/.local/share/themes/

echo "Don't forget to install userChrome.css"
