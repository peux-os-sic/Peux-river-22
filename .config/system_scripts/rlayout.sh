#!/bin/bash

# Description : Peux OS river -- layout changer script

# use blank_condition file's existence in waybar/river directory to change the layout.
dir="$HOME/.config/waybar/river/"

if [ -e $dir/blank_condition ]
then

    notify-send "Switching to Default Layout. Re-apply a second time in case of issues." -i cube
    #move the condition file one directory up
    mv $dir/blank_condition $dir/layout2/blank_condition

     # if file doesn't exists, move to alternate layout
    killall waybar
    waybar -c ~/.config/waybar/river/config-river -s ~/.config/waybar/river/river_style.css

    # randomize wallpaper
    bash ~/.config/system_scripts/pkill_bc

    # modify river config
    sed -i '/waybar/c\riverctl spawn "waybar -c ~/.config/waybar/river/layout2/config-river -s ~/.config/waybar/river/layout2/river_style.css"
' $HOME/.config/river/init

    # modify wofi style
    cp -r ~/.config/wofi/change_style/alt_style.css ~/.config/wofi/style.css

    sleep 2

else

    notify-send "Switching to Alternate Layout. Re-apply a second time in case of issues." -i cube
    #move the condition file into sub-directory
    mv $dir/layout2/blank_condition $dir/blank_condition

    #  move to default layout
    killall waybar
    waybar -c ~/.config/waybar/river/layout2/config-river -s ~/.config/waybar/river/layout2/river_style.css

   # randomize wallpaper
    bash ~/.config/system_scripts/pkill_bc

    # modify river config
    sed -i '/waybar/c\riverctl spawn "waybar -c ~/.config/waybar/river/config-river -s ~/.config/waybar/river/river_style.css"
' $HOME/.config/river/init

    # modify wofi style
    cp -r ~/.config/wofi/change_style/main_style.css ~/.config/wofi/style.css

    sleep 2

fi
