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



#  _   _            _   ____          _ 
# | \ | | ___   ___| | |  _ \ ___  __| |
# |  \| |/ _ \ / _ \ | | |_) / _ \/ _` |
# | |\  | (_) |  __/ | |  _ <  __/ (_| |
# |_| \_|\___/ \___|_| |_| \_\___|\__,_|



# Change Polybar
sed -i -e 's/.*#Launch/polybar -c $HOME\/.config\/polybar\/NoelRed\/config.ini left \& polybar -c $HOME\/.config\/polybar\/NoelRed\/config.ini right \& #Launch/g' $POLY/launch.sh

# Change Wallpaper
nitrogen --set-zoom-fill $WALL/NoelLemonadeRed.png --save && betterlockscreen -u $WALL/NoelLemonadeRed.png &

# Change Notifs
sed -i -e 's/background = .*/background = "#403B47"/g' $NOTI/dunstrc
sed -i -e 's/foreground = .*/foreground = "#E8D4CF"/g' $NOTI/dunstrc
sed -i -e 's/frame_width = .*/frame_width = 3/g' $NOTI/dunstrc
sed -i -e 's/frame_color = .*/frame_color = "#CD9B96"/g' $NOTI/dunstrc
sed -i -e 's/geometry = .*/geometry = "310x100-35+120"/g' $NOTI/dunstrc

# Restart Dunst
sleep 1 && killall dunst

# Change URxvt
sed -i -e 's/#define FG .*/#define FG #E8D4CF/g' $HOME/.Xresources
sed -i -e 's/#define BG .*/#define BG #403B47/g' $HOME/.Xresources
sed -i -e 's/#define R .*/#define R #CE9C97/g' $HOME/.Xresources
sed -i -e 's/#define G .*/#define G #B6A4A0/g' $HOME/.Xresources
sed -i -e 's/#define Y .*/#define Y #D1AD8D/g' $HOME/.Xresources
sed -i -e 's/#define B .*/#define B #B9B9C4/g' $HOME/.Xresources
sed -i -e 's/#define M .*/#define M #B68F95/g' $HOME/.Xresources
sed -i -e 's/#define C .*/#define C #675D72/g' $HOME/.Xresources

# Change Dmenu
sed -i -e 's/dmenu.background: .*/dmenu.background: #403B47/g' $HOME/.Xresources
sed -i -e 's/dmenu.foreground: .*/dmenu.foreground: #E8D4CF/g' $HOME/.Xresources
sed -i -e 's/dmenu.selbackground: .*/dmenu.selbackground: #CD9B96/g' $HOME/.Xresources
sed -i -e 's/dmenu.selforeground: .*/dmenu.selforeground: #403B47/g' $HOME/.Xresources

# Update URxvt and Dmenu
xrdb $HOME/.Xresources

# Change Alacritty
sed -i -e 's/.*#BG/    "#403B47" #BG/g' $ALAC/alacritty.yml
sed -i -e 's/.*#FG/    "#E8D4CF" #FG/g' $ALAC/alacritty.yml
sed -i -e 's/.*#BL/    "#443a36" #BL/g' $ALAC/alacritty.yml
sed -i -e 's/.*#WH/    "#867564" #WH/g' $ALAC/alacritty.yml
sed -i -e 's/.*#R /    "#CD9C97" #R /g' $ALAC/alacritty.yml
sed -i -e 's/.*#G /    "#B6A4A0" #G /g' $ALAC/alacritty.yml
sed -i -e 's/.*#Y /    "#D1AD8D" #Y /g' $ALAC/alacritty.yml
sed -i -e 's/.*#B /    "#B9B9C4" #B /g' $ALAC/alacritty.yml
sed -i -e 's/.*#M /    "#B68F95" #M /g' $ALAC/alacritty.yml
sed -i -e 's/.*#C /    "#675D72" #C /g' $ALAC/alacritty.yml

# Change GTK
sed -i -e 's/gtk-theme-name=.*/gtk-theme-name=NoelRed/g' $GTK3/settings.ini
sed -i -e 's/gtk-theme-name=.*/gtk-theme-name="NoelRed"/g' $HOME/.gtkrc-2.0
sed -i -e 's/gtk-icon-theme-name=.*/gtk-icon-theme-name=NoelRed/g' $GTK3/settings.ini
sed -i -e 's/gtk-icon-theme-name=.*/gtk-icon-theme-name="NoelRed"/g' $HOME/.gtkrc-2.0
sed -i -e 's/Net\/ThemeName .*/Net\/ThemeName "NoelRed"/g' $HOME/.xsettingsd
sed -i -e 's/Net\/IconThemeName .*/Net\/IconThemeName "NoelRed"/g' $HOME/.xsettingsd

# Apply GTK
xsettingsd & disown

# Change Powercord
sed -i -e 's/--background-primary: .*/--background-primary: #403B47 !important;/g' $CORD/discord.theme.css
sed -i -e 's/--background-secondary: .*/--background-secondary: #403B47 !important;/g' $CORD/discord.theme.css
sed -i -e 's/--background-secondary-alt: .*/--background-secondary-alt: #403B47 !important;/g' $CORD/discord.theme.css
sed -i -e 's/--background-tertiary: .*/--background-tertiary: #403B47 !important;/g' $CORD/discord.theme.css
sed -i -e 's/--background-accent: .*/--background-accent: #403B47 !important;/g' $CORD/discord.theme.css
sed -i -e 's/--background-floating: .*/--background-floating: #403B47 !important;/g' $CORD/discord.theme.css
sed -i -e 's/--text-muted: .*/--text-muted: #b6b6b6 !important;/g' $CORD/discord.theme.css
sed -i -e 's/--text-normal: .*/--text-normal: #fbfbfb !important;/g' $CORD/discord.theme.css
sed -i -e 's/--interactive-normal: .*/--interactive-normal: #c8c8c8 !important;/g' $CORD/discord.theme.css
sed -i -e 's/--interactive-hover: .*/--interactive-hover: #dcddde !important;/g' $CORD/discord.theme.css
sed -i -e 's/--interactive-active: .*/--interactive-active: #fff !important;/g' $CORD/discord.theme.css
sed -i -e 's/--header-primary: .*/--header-primary: white !important;/g' $CORD/discord.theme.css
sed -i -e 's/--header-secondary: .*/--header-secondary: #c9c9c9 !important;/g' $CORD/discord.theme.css

# Change LightDM
sed -i -e 's/wallpapers\/.*/wallpapers\/NoelLemonadeRed.png)";/g' /usr/share/lightdm-webkit/themes/arch/main.js
sed -i -e 's/ color: .*/ color: #121212;/g' /usr/share/lightdm-webkit/themes/arch/index.css

# Change Firefox
sed -i -e 's/--srf-color-primary: .*/--srf-color-primary: #403B47;/g' $CHRO/userChrome.css
sed -i -e 's/--srf-color-transparent: .*/--srf-color-transparent: #ffffff7f;/g' $CHRO/userChrome.css

# Change Picom
sed -i -e '59 s/shadow = .*/shadow = false;/g' $CONF/picom.conf

# Change Eww
sed -i -e 's/$bg: .*/$bg: #403B47;/g' $EWW/eww.scss
sed -i -e 's/$bo: .*/$bo: #CD9B96;/g' $EWW/eww.scss
sed -i -e 's/$fg: .*/$fg: #E8D4CF;/g' $EWW/eww.scss
sed -i -e 's/$fgalt: .*/$fgalt: #A89A96;/g' $EWW/eww.scss

#
# i3
#

# Change Gaps + Borders
sed -i -e 's/gaps top .*/gaps top 82/g' $i3/config
sed -i -e 's/gaps inner .*/gaps inner 19/g' $i3/config
sed -i -e 's/default_border .*/default_border pixel 3/g' $i3/config
sed -i -e 's/default_floating_border .*/default_floating_border pixel 3/g' $i3/config
sed -i -e 's/set $bg-color .*/set $bg-color #CD9B96/g' $i3/config
sed -i -e 's/set $inactive-bg-color .*/set $inactive-bg-color #4D4650/g' $i3/config

# Restart i3
pkill picom && i3-msg restart && picom -b &

#
# bsp
#

# Change Gaps + Borders
sed -i -e 's/top_padding.*/top_padding 82/g' $BSP/bspwmrc
sed -i -e 's/window_gap .*/window_gap 19/g' $BSP/bspwmrc
sed -i -e 's/border_width .*/border_width 3/g' $BSP/bspwmrc
sed -i -e 's/focused_border_color .*/focused_border_color "#CD9B96"/g' $BSP/bspwmrc
sed -i -e 's/normal_border_color .*/normal_border_color "#4D4650"/g' $BSP/bspwmrc
sed -i -e 's/presel_feedback_color .*/presel_feedback_color "#CD9B96"/g' $BSP/bspwmrc

# Restart bsp
bspc wm -r

#
# openbox
#

# Change Theme
sed -i -e 's/<theme><name>.*/<theme><name>NoelRed<\/name>/g' $OBOX/rc.xml
sed -i -e 's/<titleLayout>.*/<titleLayout>CL<\/titleLayout>/g' $OBOX/rc.xml

# Change Window Bounds
sed -i -e 's/<top>.*/<top>101<\/top>/g' $OBOX/rc.xml
sed -i -e 's/<bottom>.*/<bottom>19<\/bottom>/g' $OBOX/rc.xml
sed -i -e 's/<left>.*/<left>19<\/left>/g' $OBOX/rc.xml
sed -i -e 's/<right>.*/<right>19<\/right>/g' $OBOX/rc.xml

# Reconfigure openbox
openbox --reconfigure
$OBOX/autostart

# Notify
sleep 1.3 && notify-send 'Color Script' 'Set "Noel Red" Scheme'
