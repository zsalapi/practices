#!/bin/bash
#Írd be a saját felhasználói nevedet :)
USER_TO_CONFIGURE="zsolt"
# Frissítjük a csomaglistát
echo "Frissítjük a csomaglistát..."
sudo apt update

# Telepítjük a szükséges csomagokat
echo "Telepítjük a szükséges csomagokat..."
sudo apt install -y php-cli php-mbstring unzip curl

# Composer telepítése
echo "Composer letöltése és telepítése..."
curl -sS https://getcomposer.org/installer | php

# A Composer fájl áthelyezése globálisan elérhető helyre
echo "A Composer áthelyezése /usr/local/bin könyvtárba..."
sudo mv composer.phar /usr/local/bin/composer

# Ellenőrizzük a telepítést
echo "Composer verzió ellenőrzése..."
composer --version

# Befejezés
echo "A Composer telepítése sikeresen befejeződött!"

#echo "Laravel CLI telepítése..."
sudo -u $USER_TO_CONFIGURE composer global require laravel/installer
#.zshrc-ben már beállítottam de ha bash-t használsz kommentezd ki
#echo 'export PATH="$HOME/.config/composer/vendor/bin:$PATH"' >> /home/$USER_TO_CONFIGURE/.bashrc

#Sajnos szükséges a cli-ben hogy a php-nak legyen joga a composernek kell!
#Állítsd be!
#The allow_url_fopen setting is incorrect.
#Add the following to the end of your `php.ini`:
#    allow_url_fopen = On
