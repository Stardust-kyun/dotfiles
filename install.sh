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


echo -e "\nUpdating system\n"
sudo pacman --noconfirm -Syu 

echo -e "\nInstalling base packages\n"
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

echo "\nInstalling required packages from official repos\n" && sleep 3
sudo pacman -S --noconfirm --needed alacritty rxvt-unicode bspwm sxhkd i3-gaps obconf dunst picom xsettingsd lightdm-webkit2-greeter firefox nitrogen nautilus mousepad vim maim polkit-gnome network-manager-applet blueberry lxappearance xorg ttf-fira-code ttf-roboto noto-fonts noto-fonts-cjk noto-fonts-emoji npm nodejs rustup xdg-user-dirs

echo "1) yay	2) paru"
read -r -p "What AUR helper would you like? (default 1) " helper

if [[ $helper = "1" ]]; then
	git clone https://aur.archlinux.org/yay.git ~/yay
	cd ~/yay
	makepkg -si
	rm -rf ~/yay
	cd ~/

	aur="yay"
fi

if [[ $helper = "2" ]]; then
	git clone https://aur.archlinux.org/paru.git ~/paru
	cd ~/paru
	makepkg -si
	rm -rf ~/paru
	cd ~/

	aur="paru"
fi

echo -e "\nInstalling required packages from AUR\n" && sleep 3
$aur -S --noconfirm --needed polybar betterlockscreen discord-canary zentile nerd-fonts-fira-code nerd-fonts-iosevka gtk3-nocsd-git

echo -e "\nInstalling patched openbox\n" && sleep 3
git clone https://github.com/Stardust-kyun/openbox ~/openbox
cd ~/openbox
./bootstrap
./configure --prefix=/usr --sysconfdir=/etc
make
sudo make install
rm -rf ~/openbox
cd ~/

echo -e "\nInstalling patched dmenu\n" && sleep 3
git clone https://github.com/Stardust-kyun/dmenu ~/dmenu
cd ~/dmenu
sudo make clean install
rm -rf ~/dmenu
cd ~/

echo -e "\nInstalling powercord\n" && sleep 3
mkdir ~/.config
git clone https://github.com/powercord-org/powercord ~/.config/powercord
cd ~/.config/powercord
npm i
sudo npm run plug

echo -e "\nInstalling eww\n" && sleep 3
git clone https://github.com/elkowar/eww ~/eww
cd ~/eww
cargo build --release
cd target/release
chmod +x eww
sudo cp eww /bin
rm -rf ~/eww
cd ~/

echo "Copying dotfiles"
cd ~/dotfiles
rsync -a home/ ~/
sudo rsync -a bin/ /bin/
sudo rsync -a usr/share/ /usr/share/

echo "Miscellaneous setup"
cd /usr/share/icons
tar -xzf Arch.tar.gz
tar -xzf Cabin.tar.gz
tar -xzf NoelRed.tar.gz
rm *.tar.gz
sudo sed -i 's/greeter-session = .*/greeter-session = lightdm-webkit2-greeter/' /etc/lightdm/lightdm.conf
sudo systemctl enable lightdm
xdg-user-dirs-update
gsettings set org.gnome.nautilus.preferences always-use-location-entry true

echo -e "\n\n\nInstallation complete! Reboot to apply changes. Thank you for using my dotfiles!\n\n\n"


fi
