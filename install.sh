#!/bin/bash


##################################################
## Author - DN-debug
## Description - Peux riverwm setup 
##################################################

# copy configurations

if zenity --question --text="Want to copy the configurations?"
then
    echo "changing directory"
    cd ../
    mkdir $HOME/tmp
    cp -r Peux-river-2203/ $HOME/tmp/
    rm -rf $HOME/tmp/Peux-river-2203/install.sh
    rm -rf $HOME/tmp/Peux-river-2203/.git
    rm -rf $HOME/tmp/Peux-river-2203/details.md
    rm -rf $HOME/tmp/Peux-river-2203/*.png
    notify-send "Copied the configurations to $HOME/tmp/"
else
    notify-send "skipping the setup!"
fi

# cleanup

rm -rf /tmp/fetcher/Peux-river-2203
notify-send "Done!"
