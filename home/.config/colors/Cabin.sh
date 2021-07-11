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



#   ____      _     _       
#  / ___|__ _| |__ (_)_ __  
# | |   / _` | '_ \| | '_ \ 
# | |__| (_| | |_) | | | | |
#  \____\__,_|_.__/|_|_| |_|



# Change Polybar
sed -i -e 's/bg = .*/bg = #201e1a/g' $POLY/Cabin/config.ini
sed -i -e 's/fg = .*/fg = #79695a/g' $POLY/Cabin/config.ini
sed -i -e 's/fg-alt = .*/fg-alt = #4f453b/g' $POLY/Cabin/config.ini
sed -i -e 's/border-bottom-size = .*/border-bottom-size = 3/g' $POLY/Cabin/config.ini
sed -i -e 's/border-color = .*/border-color = #5D6051/g' $POLY/Cabin/config.ini
sed -i -e 's/.*#Launch/polybar -c $HOME\/.config\/polybar\/Cabin\/config.ini main \& #Launch/g' $POLY/launch.sh

# Change Wallpaper
nitrogen --set-zoom-fill $WALL/ForestCabin1.png --save && betterlockscreen -u $WALL/ForestCabin1.png &

# Change Notifs
sed -i -e 's/background = .*/background = "#201e1a"/g' $NOTI/dunstrc
sed -i -e 's/foreground = .*/foreground = "#79695a"/g' $NOTI/dunstrc
sed -i -e 's/frame_width = .*/frame_width = 3/g' $NOTI/dunstrc
sed -i -e 's/frame_color = .*/frame_color = "#5D6051"/g' $NOTI/dunstrc
sed -i -e 's/geometry = .*/geometry = "310x100-25+70"/g' $NOTI/dunstrc

# Restart Dunst
sleep 1 && killall dunst

# Change URxvt
sed -i -e 's/#define FG .*/#define FG #79695a/g' $HOME/.Xresources
sed -i -e 's/#define BG .*/#define BG #201e1a/g' $HOME/.Xresources
sed -i -e 's/#define R .*/#define R #674441/g' $HOME/.Xresources
sed -i -e 's/#define G .*/#define G #5d6051/g' $HOME/.Xresources
sed -i -e 's/#define Y .*/#define Y #84694e/g' $HOME/.Xresources
sed -i -e 's/#define B .*/#define B #545e5e/g' $HOME/.Xresources
sed -i -e 's/#define M .*/#define M #614c4c/g' $HOME/.Xresources
sed -i -e 's/#define C .*/#define C #4d5c5c/g' $HOME/.Xresources

# Change Dmenu
sed -i -e 's/dmenu.background: .*/dmenu.background: #201e1a/g' $HOME/.Xresources
sed -i -e 's/dmenu.foreground: .*/dmenu.foreground: #79695a/g' $HOME/.Xresources
sed -i -e 's/dmenu.selbackground: .*/dmenu.selbackground: #5D6051/g' $HOME/.Xresources
sed -i -e 's/dmenu.selforeground: .*/dmenu.selforeground: #201e1a/g' $HOME/.Xresources

# Update URxvt and Dmenu
xrdb $HOME/.Xresources

# Change Alacritty
sed -i -e 's/.*#BG/    "#201e1a" #BG/g' $ALAC/alacritty.yml
sed -i -e 's/.*#FG/    "#79695a" #FG/g' $ALAC/alacritty.yml
sed -i -e 's/.*#BL/    "#443a36" #BL/g' $ALAC/alacritty.yml
sed -i -e 's/.*#WH/    "#867564" #WH/g' $ALAC/alacritty.yml
sed -i -e 's/.*#R /    "#674441" #R /g' $ALAC/alacritty.yml
sed -i -e 's/.*#G /    "#5d6051" #G /g' $ALAC/alacritty.yml
sed -i -e 's/.*#Y /    "#84694e" #Y /g' $ALAC/alacritty.yml
sed -i -e 's/.*#B /    "#545e5e" #B /g' $ALAC/alacritty.yml
sed -i -e 's/.*#M /    "#614c4c" #M /g' $ALAC/alacritty.yml
sed -i -e 's/.*#C /    "#4d5c5c" #C /g' $ALAC/alacritty.yml

# Change GTK
sed -i -e 's/gtk-theme-name=.*/gtk-theme-name=Cabin/g' $GTK3/settings.ini
sed -i -e 's/gtk-theme-name=.*/gtk-theme-name="Cabin"/g' $HOME/.gtkrc-2.0
sed -i -e 's/gtk-icon-theme-name=.*/gtk-icon-theme-name=Cabin/g' $GTK3/settings.ini
sed -i -e 's/gtk-icon-theme-name=.*/gtk-icon-theme-name="Cabin"/g' $HOME/.gtkrc-2.0
sed -i -e 's/Net\/ThemeName .*/Net\/ThemeName "Cabin"/g' $HOME/.xsettingsd
sed -i -e 's/Net\/IconThemeName .*/Net\/IconThemeName "Cabin"/g' $HOME/.xsettingsd

# Apply GTK
xsettingsd & disown

# Change Powercord
sed -i -e 's/--background-primary: .*/--background-primary: #201e1a !important;/g' $CORD/discord.theme.css
sed -i -e 's/--background-secondary: .*/--background-secondary: #201e1a !important;/g' $CORD/discord.theme.css
sed -i -e 's/--background-secondary-alt: .*/--background-secondary-alt: #201e1a !important;/g' $CORD/discord.theme.css
sed -i -e 's/--background-tertiary: .*/--background-tertiary: #201e1a !important;/g' $CORD/discord.theme.css
sed -i -e 's/--background-accent: .*/--background-accent: #201e1a !important;/g' $CORD/discord.theme.css
sed -i -e 's/--background-floating: .*/--background-floating: #201e1a !important;/g' $CORD/discord.theme.css
sed -i -e 's/--text-muted: .*/--text-muted: #b6b6b6 !important;/g' $CORD/discord.theme.css
sed -i -e 's/--text-normal: .*/--text-normal: #fbfbfb !important;/g' $CORD/discord.theme.css
sed -i -e 's/--interactive-normal: .*/--interactive-normal: #c8c8c8 !important;/g' $CORD/discord.theme.css
sed -i -e 's/--interactive-hover: .*/--interactive-hover: #dcddde !important;/g' $CORD/discord.theme.css
sed -i -e 's/--interactive-active: .*/--interactive-active: #fff !important;/g' $CORD/discord.theme.css
sed -i -e 's/--header-primary: .*/--header-primary: white !important;/g' $CORD/discord.theme.css
sed -i -e 's/--header-secondary: .*/--header-secondary: #c9c9c9 !important;/g' $CORD/discord.theme.css

# Change LightDM 
sed -i -e 's/wallpapers\/.*/wallpapers\/ForestCabin1.png)";/g' /usr/share/lightdm-webkit/themes/arch/main.js
sed -i -e 's/ color: .*/ color: #ededed;/g' /usr/share/lightdm-webkit/themes/arch/index.css

# Change Firefox
sed -i -e 's/--srf-color-primary: .*/--srf-color-primary: #201e1a;/g' $CHRO/userChrome.css
sed -i -e 's/--srf-color-transparent: .*/--srf-color-transparent: #ffffff7f;/g' $CHRO/userChrome.css

# Change Picom
sed -i -e '59 s/shadow = .*/shadow = false;/g' $CONF/picom.conf

# Change Eww
sed -i -e 's/$bg: .*/$bg: #201e1a;/g' $EWW/eww.scss
sed -i -e 's/$bo: .*/$bo: #5D6051;/g' $EWW/eww.scss
sed -i -e 's/$fg: .*/$fg: #79695a;/g' $EWW/eww.scss
sed -i -e 's/$fgalt: .*/$fgalt: #4f453b;/g' $EWW/eww.scss

#
# i3
#

# Change Gaps + Borders
sed -i -e 's/gaps top .*/gaps top 43/g' $i3/config
sed -i -e 's/gaps inner .*/gaps inner 14/g' $i3/config
sed -i -e 's/default_border .*/default_border pixel 3/g' $i3/config
sed -i -e 's/default_floating_border .*/default_floating_border pixel 3/g' $i3/config
sed -i -e 's/set $bg-color .*/set $bg-color #5D6051/g' $i3/config
sed -i -e 's/set $inactive-bg-color .*/set $inactive-bg-color #191A16/g' $i3/config

# Restart i3
pkill picom && i3-msg restart && picom -b &

#
# bsp
#

# Change Gaps + Borders
sed -i -e 's/top_padding.*/top_padding 43/g' $BSP/bspwmrc
sed -i -e 's/window_gap .*/window_gap 12/g' $BSP/bspwmrc
sed -i -e 's/border_width .*/border_width 3/g' $BSP/bspwmrc
sed -i -e 's/focused_border_color .*/focused_border_color "#5D6051"/g' $BSP/bspwmrc
sed -i -e 's/normal_border_color .*/normal_border_color "#191a16"/g' $BSP/bspwmrc
sed -i -e 's/presel_feedback_color .*/presel_feedback_color "#5D6051"/g' $BSP/bspwmrc

# Restart bsp
bspc wm -r

#
# openbox
#

# Change Theme
sed -i -e 's/<theme><name>.*/<theme><name>Cabin<\/name>/g' $OBOX/rc.xml
sed -i -e 's/<titleLayout>.*/<titleLayout>LIMC<\/titleLayout>/g' $OBOX/rc.xml

# Change Window Bounds
sed -i -e 's/<top>.*/<top>55<\/top>/g' $OBOX/rc.xml
sed -i -e 's/<bottom>.*/<bottom>12<\/bottom>/g' $OBOX/rc.xml
sed -i -e 's/<left>.*/<left>12<\/left>/g' $OBOX/rc.xml
sed -i -e 's/<right>.*/<right>12<\/right>/g' $OBOX/rc.xml

# Reconfigure openbox
openbox --reconfigure
$OBOX/autostart

# Notify
sleep 1.3 && notify-send 'Color Script' 'Set "Cabin" Scheme'
