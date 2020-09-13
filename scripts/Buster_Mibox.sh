#!/bin/bash

sudo apt update && sudo apt -y upgrade

default_user=$(logname 2>/dev/null || echo ${SUDO_USER:-${USER}})
HOME="/home/${default_user}"

mkdir ~/.config

sudo chmod 777 ~/.config

mkdir ~/.config/openbox

mkdir ~/.config/tint2

mkdir ~/.scripts

sudo apt-get install -y software-properties-common && sudo apt-add-repository contrib && sudo apt-add-repository non-free

sudo apt-get update

sudo apt-get install -y openbox obmenu firefox-esr pcmanfm tint2 menu pulseaudio pavucontrol mlocate lxappearance arandr apt-file synaptic firmware-linux firmware-linux-nonfree xutils mesa-utils xarchiver htop wicd gnome-disk-utility python3-pip python-pip ttf-mscorefonts-installer fonts-ubuntu fonts-ubuntu-console suckless-tools simplescreenrecorder geany gdebi fbxkb mpv curl gmrun xscreensaver  pnmixer sxiv scrot xsettingsd ffmpeg git qbittorrent wmctrl xinit xorg xserver-xorg

echo "exec openbox-session" >> ~/.xinitrc

sudo chmod 777 ~/.xinitrc

cp ~/Buster_Mibox/dotfiles/tint2rc ~/.config/tint2

cp ~/Buster_Mibox/dotfiles/autostart.sh ~/.config/openbox

cp ~/Buster_Mibox/dotfiles/.Xresources ~/

cp ~/Buster_Mibox/dotfiles/rc.xml ~/.config/openbox

cp ~/Buster_Mibox/dotfiles/menu.xml ~/.config/openbox

cp ~/Buster_Mibox/dotfiles/keyboard.sh ~/

sudo cp ~/Buster_Mibox/dotfiles/rs.png /usr/share/fbxkb/images/rs.png

mkdir ~/.config/mpv

cp ~/Buster_Mibox/dotfiles/mpv.conf ~/.config/mpv

sudo cp ~/Buster_Mibox/dotfiles/ncmpcpp_48x48.png /usr/share/icons

sudo chmod 777 /usr/share/icons/ncmpcpp_48x48.png



# korekcija autorizacije za gdebi
sudo sed -i 's/<allow_active>auth_admin/<allow_active>yes/' /usr/share/polkit-1/actions/com.ubuntu.pkexec.gdebi-gtk.policy


# korekcija autorizacije za synaptic
sudo sed -i 's/<allow_active>auth_admin/<allow_active>yes/' /usr/share/polkit-1/actions/com.ubuntu.pkexec.synaptic.policy

sudo chmod --recursive 777 ~/.config/openbox
sudo chmod 777 ~/keyboard.sh

mkdir -p ~/Documents/DEB

## instalacija ncmpcpp
sudo apt install -y mpd ncmpcpp
mkdir ~/.mpd
mkdir ~/.ncmpcpp
cp ~/Buster_Mibox/dotfiles/config ~/.ncmpcpp
cp ~/Buster_Mibox/dotfiles/mpd.conf ~/.mpd
touch ~/.mpd/mpd.db ~/.mpd/mpd.log ~/.mpd/mpd.pid
sudo chmod --recursive 777 ~/.mpd
sudo chmod --recursive 777 ~/.ncmpcpp
echo "Exec=x-terminal-emulator -T 'ncmpcpp' -e ncmpcpp" > /tmp/ncmpcpp_replacement
sudo sed -i "s/^.*Exec=ncmpcpp.*$/$(cat /tmp/ncmpcpp_replacement)/" /usr/share/applications/ncmpcpp.desktop
sudo sed -i 's!Terminal=true!Terminal=false!' /usr/share/applications/ncmpcpp.desktop
echo "Icon=/usr/share/icons/ncmpcpp_48x48.png" >> /usr/share/applications/ncmpcpp.desktop

## screeny
cp ~/Buster_Mibox/scripts/screeny ~/.scripts

## script for reinstall youtube-dl
cp ~/Buster_Mibox/scripts/reinstall_youtube-dl.sh ~/.scripts

## obmenu-generator
cp ~/Buster_Mibox/scripts/obmenu-generator.sh ~/.scripts

mkdir ~/projects
cd ~/projects
git clone https://github.com/speja969/debian-openbox.git

sudo chmod --recursive 777 ~/projects
sudo chmod --recursive 777 ~/.scripts

cd ~/projects/debian-openbox/10_openbox_terminator
sudo ./install.sh

cd ~/projects/debian-openbox/10_openbox_arc-theme-gtk
sudo ./install.sh

cd ~/projects/debian-openbox/10_openbox_numix-paper-icons
sudo ./install.sh

cd ~/projects/debian-openbox/install_wpsoffice
sudo ./install.sh

cd ~/projects/debian-openbox/script_install_dt-dark-theme
sudo ./install.sh

cd ~/projects/debian-openbox/config_shortcut-kill-x
sudo ./install.sh

cd ~/projects/debian-openbox/script_loginfetch
sudo ./install.sh

cd ~/projects/debian-openbox/config_disable-services
sudo ./install.sh

cd ~/projects/debian-openbox/config_bash-prompt
sudo ./install.sh

cd ~/projects/debian-openbox/10_openbox_nomacs-viewer
sudo ./install.sh
sudo chmod --recursive 777 ~/.config/nomacs

cd ~/projects/debian-openbox
#sudo ./install -a grub

# Copy wallpapers folderes
sudo cp -r ~/Buster_Mibox/WALLPAPERS/Wallpapers_Debian /usr/share/backgrounds
sudo cp -r ~/Buster_Mibox/WALLPAPERS/wallpapers-pixabay /usr/share/backgrounds

sudo sed -i 's!wallpapers-pack1!wallpapers-pixabay!' ~/projects/debian-openbox/15_openbox_wallpaper-packs/install.sh
sudo sed -i 's!bl-colorful-aptenodytes-forsteri-by-nixiepro.png!kuala-lumpur-1820944_1920.jpg!' ~/projects/debian-openbox/15_openbox_wallpaper-packs/install.sh
sudo sed -i 's!/usr/share/backgrounds/wallpapers-pack1/bl-colorful-aptenodytes-forsteri-by-nixiepro.png!/usr/share/backgrounds/wallpapers-pixabay/kuala-lumpur-1820944_1920.jpg!' ~/projects/debian-openbox/15_openbox_wallpaper-packs/bg-saved.cfg

# ACTION: Install nitrogen tool, copy more wallpapers pack and set default wallpaper to all users
cd ~/projects/debian-openbox/15_openbox_wallpaper-packs
sudo ./install.sh

#sudo cp ~/Buster_Mibox/WALLPAPERS/Wallpapers_Debian/lightdm_login.jpg /usr/share/images/desktop-base
#sudo chmod 777 /usr/share/images/desktop-base/lightdm_login.jpg

sudo chmod --recursive 777 ~/.config/nitrogen

sudo chown --recursive $USER:$USER .

## setting default text editor
xdg-mime default pcmanfm.desktop inode/directory


## settings htop.desktop
echo "Exec=x-terminal-emulator -T 'htop task manager' -e htop" > /tmp/htop_replacement

sudo sed -i "s/^.*Exec=htop.*$/$(cat /tmp/htop_replacement)/" /usr/share/applications/htop.desktop

sudo sed -i 's!Terminal=true!Terminal=false!' /usr/share/applications/htop.desktop


