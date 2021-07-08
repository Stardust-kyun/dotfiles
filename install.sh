#!/bin/bash

echo -e "\n\n\nWelcome to Stardust-kyun's dotfiles! \nThis script will install them to your current user, and may overwrite existing files.\n\n1) Yes [yes/y]	2) No [no/n]" 

read -r -p "Are you sure you want to proceed? " start 
case $start in 
	[yY][eE][sS]|[yY]) 
		start="true"
		;;
	
	[nN][oO]|[nN])
		start="false"
		;;
esac

if [[ $start = "true" ]]; then


echo "Updating system"
sudo pacman --noconfirm -Syu 

echo "Installing base packages"
sudo pacman -S --noconfirm --needed base-devel git rsync

echo "1) xf86-video-intel	2) xf86-video-amdgpu	3) none"
read -r -p "Select your graphics drivers (default 3): " video

case $video in
	[1])
		driver="xf86-video-intel"
		;;

	[2])
		driver="xf86-video-amdgpu"
		;;

	[3])
		driver=""
		;;

	[*])
		driver=""
		;;

esac

sudo pacman -S --noconfirm --needed $driver

echo "Installing required packages from official repos"
sudo pacman -S --noconfirm --needed alacritty rxvt-unicode bspwm sxhkd i3-gaps obconf dunst picom xsettingsd lightdm-webkit2-greeter firefox nitrogen nautilus mousepad vim maim polkit-gnome network-manager-applet blueberry lxappearance xorg ttf-fira-code ttf-roboto noto-fonts noto-fonts-cjk noto-fonts-emoji npm nodejs rustup xdg-user-dirs

echo "Installing yay"
git clone https://aur.archlinux.org/yay.git ~/yay
cd ~/yay
makepkg -si
rm -rf ~/yay

echo "Installing required packages from AUR"
yay -S --noconfirm --needed polybar betterlockscreen discord-canary zentile nerd-fonts-fira-code nerd-fonts-iosevka gtk3-nocsd-git

echo "Installing patched openbox"
git clone https://github.com/Stardust-kyun/openbox ~/openbox
cd ~/openbox
./bootstrap
./configure --prefix=/usr --sysconfdir=/etc
make
sudo make install
rm -rf ~/openbox

echo "Installing patched dmenu"
git clone https://github.com/Stardust-kyun/dmenu ~/dmenu
cd ~/dmenu
sudo make clean install
rm -rf ~/dmenu

echo "Installing powercord"
mkdir ~/.config
git clone https://github.com/powercord-org/powercord ~/.config/powercord
cd ~/.config/powercord
npm i
sudo npm run plug

echo "Installing eww"
git clone https://github.com/elkowar/eww ~/eww
cd ~/eww
cargo build --release
cd target/release
chmod +x eww
sudo cp eww /bin
rm -rf ~/eww

echo "Copying dotfiles"
cd ~/dotfiles
rsync -a home/ ~/
sudo rsync -a bin/ /bin/
sudo rsync -a usr/share/ /usr/share/

echo "Miscellaneous setup"
cd /usr/share/
tar -xzf Arch.tar.gz
tar -xzf Cabin.tar.gz
tar -xzf NoelRed.tar.gz
rm *.tar.gz
sudo sed -i '103 s/greeter-session = .*/greeter-session = lightdm-webkit2-greeter/' /etc/lightdm/lightdm.conf
sudo systemctl enable lightdm
mv ~/.mozilla/firefox/default-release/chrome ~/.mozilla/firefox/*.default-release/
xdg-user-dirs-update
gsettings set org.gnome.nautilus.preferences always-use-location-entry true

echo -e "\n\n\nInstallation complete! Reboot to apply changes. Thank you for using my dotfiles!\n\n\n"


fi
