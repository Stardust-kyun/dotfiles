#!/bin/bash

CONF="$HOME/.config"
POLY="$CONF/polybar"
WALL="$HOME/Pictures/Wallpaper"
NOTI="$CONF/dunst"
ALAC="$CONF/alacritty"
GTK3="$CONF/gtk-3.0"
CORD="$CONF/powercord/src/Powercord/themes/discord"
CHRO="$HOME/.mozilla/firefox/*.default-release/chrome"
EWW="$HOME/.config/eww"
i3="$CONF/i3"
BSP="$CONF/bspwm"
OBOX="$CONF/openbox"



#     _             _       _     _       _     _   
#    / \   _ __ ___| |__   | |   (_) __ _| |__ | |_ 
#   / _ \ | '__/ __| '_ \  | |   | |/ _` | '_ \| __|
#  / ___ \| | | (__| | | | | |___| | (_| | | | | |_ 
# /_/   \_\_|  \___|_| |_| |_____|_|\__, |_| |_|\__|
#                                   |___/           



# Change Polybar
sed -i -e 's/bg = .*/bg = #fefefe/g' $POLY/Arch/config.ini
sed -i -e 's/fg = .*/fg = #111111/g' $POLY/Arch/config.ini
sed -i -e 's/fg-alt = .*/fg-alt = #787878/g' $POLY/Arch/config.ini
sed -i -e 's/.*#Launch/polybar -c $HOME\/.config\/polybar\/Arch\/config.ini main \& #Launch/g' $POLY/launch.sh

# Change Wallpaper
nitrogen --set-zoom-fill $WALL/WhiteMountains.jpg --save && betterlockscreen -u $WALL/WhiteMountains.jpg &

# Change Notifs
sed -i -e 's/background = .*/background = "#fefefe"/g' $NOTI/dunstrc
sed -i -e 's/foreground = .*/foreground = "#111111"/g' $NOTI/dunstrc
sed -i -e 's/frame_width = .*/frame_width = 0/g' $NOTI/dunstrc
sed -i -e 's/frame_color = .*/frame_color = "#b9b9b9"/g' $NOTI/dunstrc
sed -i -e 's/geometry = .*/geometry = "310x100-35+95"/g' $NOTI/dunstrc

# Restart Dunst
sleep 1 && killall dunst

# Change URxvt
sed -i -e 's/#define FG .*/#define FG #464646/g' $HOME/.Xresources
sed -i -e 's/#define BG .*/#define BG #fefefe/g' $HOME/.Xresources
sed -i -e 's/#define R .*/#define R #7c7c7c/g' $HOME/.Xresources
sed -i -e 's/#define G .*/#define G #8e8e8e/g' $HOME/.Xresources
sed -i -e 's/#define Y .*/#define Y #a0a0a0/g' $HOME/.Xresources
sed -i -e 's/#define B .*/#define B #686868/g' $HOME/.Xresources
sed -i -e 's/#define M .*/#define M #747474/g' $HOME/.Xresources
sed -i -e 's/#define C .*/#define C #868686/g' $HOME/.Xresources

# Change Dmenu
sed -i -e 's/dmenu.background: .*/dmenu.background: #fefefe/g' $HOME/.Xresources
sed -i -e 's/dmenu.foreground: .*/dmenu.foreground: #787878/g' $HOME/.Xresources
sed -i -e 's/dmenu.selbackground: .*/dmenu.selbackground: #fefefe/g' $HOME/.Xresources
sed -i -e 's/dmenu.selforeground: .*/dmenu.selforeground: #111111/g' $HOME/.Xresources

# Update URxvt and Dmenu
xrdb $HOME/.Xresources

# Change Alacritty
sed -i -e 's/.*#BG/    "#fefefe" #BG/g' $ALAC/alacritty.yml
sed -i -e 's/.*#FG/    "#464646" #FG/g' $ALAC/alacritty.yml
sed -i -e 's/.*#BL/    "#525252" #BL/g' $ALAC/alacritty.yml
sed -i -e 's/.*#WH/    "#b9b9b9" #WH/g' $ALAC/alacritty.yml
sed -i -e 's/.*#R /    "#7c7c7c" #R /g' $ALAC/alacritty.yml
sed -i -e 's/.*#G /    "#8e8e8e" #G /g' $ALAC/alacritty.yml
sed -i -e 's/.*#Y /    "#a0a0a0" #Y /g' $ALAC/alacritty.yml
sed -i -e 's/.*#B /    "#686868" #B /g' $ALAC/alacritty.yml
sed -i -e 's/.*#M /    "#747474" #M /g' $ALAC/alacritty.yml
sed -i -e 's/.*#C /    "#868686" #C /g' $ALAC/alacritty.yml

# Change GTK
sed -i -e 's/gtk-theme-name=.*/gtk-theme-name=ArchLight/g' $GTK3/settings.ini
sed -i -e 's/gtk-theme-name=.*/gtk-theme-name="ArchLight"/g' $HOME/.gtkrc-2.0
sed -i -e 's/gtk-icon-theme-name=.*/gtk-icon-theme-name=Arch/g' $GTK3/settings.ini
sed -i -e 's/gtk-icon-theme-name=.*/gtk-icon-theme-name="Arch"/g' $HOME/.gtkrc-2.0
sed -i -e 's/Net\/ThemeName .*/Net\/ThemeName "ArchLight"/g' $HOME/.xsettingsd
sed -i -e 's/Net\/IconThemeName .*/Net\/IconThemeName "Arch"/g' $HOME/.xsettingsd

# Apply GTK
xsettingsd & disown

# Change Powercord
sed -i -e 's/--background-primary: .*/--background-primary: #FEFEFE !important;/g' $CORD/discord.theme.css
sed -i -e 's/--background-secondary: .*/--background-secondary: #FEFEFE !important;/g' $CORD/discord.theme.css
sed -i -e 's/--background-secondary-alt: .*/--background-secondary-alt: #FEFEFE !important;/g' $CORD/discord.theme.css
sed -i -e 's/--background-tertiary: .*/--background-tertiary: #FEFEFE !important;/g' $CORD/discord.theme.css
sed -i -e 's/--background-accent: .*/--background-accent: #FEFEFE !important;/g' $CORD/discord.theme.css
sed -i -e 's/--background-floating: .*/--background-floating: #FEFEFE !important;/g' $CORD/discord.theme.css
sed -i -e 's/--text-muted: .*/--text-muted: #666666 !important;/g' $CORD/discord.theme.css
sed -i -e 's/--text-normal: .*/--text-normal: #111111 !important;/g' $CORD/discord.theme.css
sed -i -e 's/--interactive-normal: .*/--interactive-normal: #888 !important;/g' $CORD/discord.theme.css
sed -i -e 's/--interactive-hover: .*/--interactive-hover: #707070 !important;/g' $CORD/discord.theme.css
sed -i -e 's/--interactive-active: .*/--interactive-active: #000 !important;/g' $CORD/discord.theme.css
sed -i -e 's/--header-primary: .*/--header-primary: black !important;/g' $CORD/discord.theme.css
sed -i -e 's/--header-secondary: .*/--header-secondary: black !important;/g' $CORD/discord.theme.css

# Change LightDM
sed -i -e 's/wallpapers\/.*/wallpapers\/WhiteMountains.jpg)";/g' /usr/share/lightdm-webkit/themes/arch/main.js
sed -i -e 's/ color: .*/ color: #121212;/g' /usr/share/lightdm-webkit/themes/arch/index.css

# Change Firefox
sed -i -e 's/--srf-color-primary: .*/--srf-color-primary: #fefefe;/g' $CHRO/userChrome.css
sed -i -e 's/--srf-color-transparent: .*/--srf-color-transparent: #0000007f;/g' $CHRO/userChrome.css

# Change Picom
sed -i -e '59 s/shadow = .*/shadow = true;/g' $CONF/picom.conf

# Change Eww
sed -i -e 's/$bg: .*/$bg: #fefefe;/g' $EWW/eww.scss
sed -i -e 's/$bo: .*/$bo: #fefefe;/g' $EWW/eww.scss
sed -i -e 's/$fg: .*/$fg: #111111;/g' $EWW/eww.scss
sed -i -e 's/$fgalt: .*/$fgalt: #787878;/g' $EWW/eww.scss

#
# i3
#

# Change Gaps + Borders
sed -i -e 's/gaps top .*/gaps top 61/g' $i3/config
sed -i -e 's/gaps inner .*/gaps inner 19/g' $i3/config
sed -i -e 's/default_border .*/default_border none/g' $i3/config
sed -i -e 's/default_floating_border .*/default_floating_border none/g' $i3/config
sed -i -e 's/set $bg-color .*/set $bg-color #8c8c8c/g' $i3/config
sed -i -e 's/set $inactive-bg-color .*/set $inactive-bg-color #363636/g' $i3/config

# Restart i3
pkill picom && i3-msg restart && picom -b &

#
# bsp
#

# Change Gaps + Borders
sed -i -e 's/top_padding.*/top_padding 61/g' $BSP/bspwmrc
sed -i -e 's/window_gap .*/window_gap 19/g' $BSP/bspwmrc
sed -i -e 's/border_width .*/border_width 0/g' $BSP/bspwmrc
sed -i -e 's/focused_border_color .*/focused_border_color "#8c8c8c"/g' $BSP/bspwmrc
sed -i -e 's/normal_border_color .*/normal_border_color "#363636"/g' $BSP/bspwmrc
sed -i -e 's/presel_feedback_color .*/presel_feedback_color "#8c8c8c"/g' $BSP/bspwmrc

# Restart bsp
bspc wm -r

#
# openbox
#

# Change Theme
sed -i -e 's/<theme><name>.*/<theme><name>ArchLight<\/name>/g' $OBOX/rc.xml
sed -i -e 's/<titleLayout>.*/<titleLayout>MLC<\/titleLayout>/g' $OBOX/rc.xml

# Change Window Bounds
sed -i -e 's/<top>.*/<top>80<\/top>/g' $OBOX/rc.xml
sed -i -e 's/<bottom>.*/<bottom>19<\/bottom>/g' $OBOX/rc.xml
sed -i -e 's/<left>.*/<left>19<\/left>/g' $OBOX/rc.xml
sed -i -e 's/<right>.*/<right>19<\/right>/g' $OBOX/rc.xml

# Reconfigure openbox
openbox --reconfigure
$OBOX/autostart

# Notify
sleep 1.3 && notify-send 'Color Script' 'Set "Arch Light" Scheme'
