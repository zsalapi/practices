#!/bin/bash

set -e
#Írd be a saját felhasználói nevedet :)
USER_TO_CONFIGURE="zsolt"

echo "Frissítés és alap csomagok telepítése..."
sudo apt update && sudo apt upgrade -y
#kérdezzen mindenről dialog low
sudo dpkg-reconfigure debconf -plow
sudo apt install -y curl wget git unzip gnupg2 apt-transport-https ca-certificates lsb-release build-essential at net-tools curl

#Tűzfal
sudo apt-get install ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw deny proto tcp from any to any port 80
sudo ufw deny proto tcp from any to any port 443
sudo ufw allow from 127.0.0.1 to any port 80
sudo ufw deny 80
sudo systemctl start ufw
sudo systemctl restart ufw
sudo ufw enable
sudo ufw start
sudo systemctl enable ufw
sudo systemctl status ufw
sudo iptables -L
sudo apt-get install -y rkhunter clamav-daemon clamav-base clamav-docs clamav-freshclam clamdscan clamav-testfiles clamtk sshfs pwgen expect seahorse gpg nmap tmux zsh rcs
sudo apt install apparmor apparmor-utils
sudo systemctl enable apparmor
sudo systemctl start apparmor
sudo apt update
sudo apt upgrade
sudo apt dist-upgrade
sudo apt install unattended-upgrades
sudo dpkg-reconfigure --priority=low unattended-upgrades

#csomagkezelők
sudo apt-get install -y aptitude synaptic

#rendszer melegedést figyelő programok gui-s
sudo apt-get install xsensors cpu-x htop

echo "Git telepítése..."
sudo apt install -y git gitk git-gui gitg

echo "Wecam telepítése.."
sudo apt-get install -y guvcview

echo "PHP + Composer telepítése..."
sudo apt install -y php php-cli php-mbstring php-xml php-curl php-mysql php-zip php-gd php-intl php-bcmath php-imagick php-soap php-sqlite3



echo "NVM (Node Version Manager) telepítése..."
sudo -u $USER_TO_CONFIGURE bash <<EOF
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
echo 'export NVM_DIR="\$HOME/.nvm"' >> /home/$USER_TO_CONFIGURE/.bashrc
echo '[ -s "\$NVM_DIR/nvm.sh" ] && \. "\$NVM_DIR/nvm.sh"' >> /home/$USER_TO_CONFIGURE/.bashrc
echo '[ -s "\$NVM_DIR/bash_completion" ] && \. "\$NVM_DIR/bash_completion"' >> /home/$USER_TO_CONFIGURE/.bashrc
source /home/$USER_TO_CONFIGURE/.nvm/nvm.sh
nvm install --lts
nvm use --lts
EOF


echo "Irodai és levelező programok telepítése..."
sudo apt install -y libreoffice thunderbird evolution gnote fbreader xchm dos2unix

echo "Multimédiás programok telepítése..."
sudo apt install -y vlc ffmpeg obs-studio gimp kdenlive audacity lame vorbis-tools espeak simplescreenrecorder

echo "Zenelejátszók telepítése..."
sudo apt install -y rhythmbox audacious streamtuner2

echo "DVD / Blu-ray író programok telepítése..."
sudo apt install -y brasero k3b brasero gddrescue testdisk android-file-transfer 

sudo apt-get install -y gnucash 

sudo apt update

# ZIP fájlokhoz
sudo apt install -y zip unzip

# TAR fájlokhoz és ARJ
sudo apt install -y tar arj

# 7zip fájlokhoz (7z)
sudo apt install -y p7zip-full

# RAR fájlokhoz
sudo apt install -y rar unrar

# Gzip fájlokhoz
sudo apt install -y gzip

# Bzip2 fájlokhoz
sudo apt install -y bzip2

#non-free rar unrar
sudo apt-get install -y rar unrar

echo "Játékok telepítése..."

# FPS játékok
sudo apt install -y quake3 quake quake2 openarena redeclipse freedoom chocolate-doom chocolate-heretic openmohaa quakespasm

# Arcade játékok
sudo apt install -y extremetuxracer supertux supertuxkart neverball

# Autóverseny
sudo apt install -y trigger-rally torcs

# RTS játékok
sudo apt install -y 0ad warzone2100 wesnoth openttd opencity freeciv freecol

# Klasszikus játékcsomagok
sudo apt install -y games-minesweeper games-tetris ltris dosbox freedink

# Filemanagers
echo "Filemanagers"
sudo apt-get install ranger mc krusader gnome-commander krename kget kate

# Telepítjük az új grafikai eszközöket
echo "Grafikai eszközök telepítése: GIMP, Inkscape, FontForge, Krita, Blender, Darktable"
sudo apt install -y gimp ksnip inkscape fontforge krita blender darktable imagemagick feh gthumb ristretto tuxpaint shotwell gnome-backgrounds

# Fejlesztői eszközök telepítése
echo "Fejlesztői eszközök telepítése: Emacs, Vim, PHP, GCC"
sudo apt install -y emacs php gcc build-essential vim codeblocks bluefish geany geany-plugins filezilla

# Python fejlesztési környezet
echo "Python fejlesztési környezet telepítése..."
sudo apt install -y python3 python3-pip python3-venv

# C++ fejlesztési környezet
echo "C++ fejlesztési környezet telepítése..."
sudo apt install -y g++ clang

# Java fejlesztési környezet
echo "Java fejlesztési környezet telepítése..."
sudo apt install -y openjdk-25-jdk maven gradle

# Böngészők telepítése
echo "Böngészők telepítése: Firefox, Chromium, Ungoogled Chromium, Brave"
sudo apt install -y firefox firejail falkon deluge wget

#Chat IRC
sudo apt-get install kvirc dino-im pidgin

# Flatpak telepítése
echo "Flatpak telepítése..."
sudo apt-get install flatpak
sudo apt install gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak update

# Telepítjük az Ungoogled Chromium-ot
if ! command -v ungoogled-chromium &> /dev/null
then
    echo "Ungoogled Chromium telepítése..."
    
    flatpak install Ungoogled Chromium
else
    echo "Ungoogled Chromium már telepítve van."
fi
#https://www.osradar.com/install-chromium-using-flatpak/
flatpak install flathub org.chromium.Chromium

#Permissions állítgathatom flatpak-ben plusz biztonság
flatpak install flathub com.github.tchx84.Flatseal
#API teszteléshez
flatpak install Insomnia

# Telepítünk játékokat Flatpak-ból (pl. Doom 3)
echo "Telepítjük a Flatpak játékokat: Doom 3"
flatpak install Doom3

# Visual Studio Code telepítése a saját repo-ból
echo "Visual Studio Code telepítése a Microsoft repo-ból..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc
sudo apt update
sudo apt install -y code

### Apache2, PHP 8.4, MariaDB és phpMyAdmin telepítése

# Apache2 telepítése
echo "Apache2 telepítése..."
sudo apt install -y apache2

# PHP 8.4 telepítése
echo "PHP 8.4 telepítése..."
sudo apt install -y php8.4 php8.4-cli php8.4-mbstring php8.4-xml php8.4-curl php8.4-mysql php8.4-zip php8.4-gd php8.4-intl php8.4-bcmath php8.4-imagick php8.4-soap php8.4-sqlite3

# Apache2 + PHP 8.4 konfigurálása
echo "Apache2 konfigurálása PHP 8.4-tel..."
sudo a2enmod php8.4
sudo systemctl restart apache2

# MariaDB telepítése
echo "MariaDB telepítése..."
sudo apt install -y mariadb-server mariadb-client

# Apache2 újraindítása
echo "Apache2 újraindítása..."
sudo systemctl restart apache2

# Rendszer tisztítása
echo "Rendszer tisztítása..."
sudo apt autoremove -y
sudo apt autoclean

### LibreWolf telepítése a saját repo-jából

echo "LibreWolf telepítése a saját repository-ból (Debian Trixie)..."
# LibreWolf repository hozzáadása
sudo apt update && sudo apt install extrepo -y
sudo extrepo enable librewolf
sudo apt update && sudo apt install librewolf -y

echo "✅ A telepítés kész!"
echo "💡 A felhasználónak újra kell jelentkeznie a 'docker' csoportba való bekerüléshez."

