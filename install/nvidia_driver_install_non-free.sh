#!/bin/bash

# Ellenőrizzük, hogy root jogokkal fut-e
if [ "$(id -u)" -ne 0 ]; then
    echo "Ez a script root jogokat igényel. Futtasd sudo-val."
    exit 1
fi

#echo "Először eltávolítjuk a Nouveau drivert..."

# A Nouveau eltávolítása
echo "Blacklisting Nouveau..."
echo -e "blacklist nouveau\noptions nouveau modeset=0" > /etc/modprobe.d/blacklist-nouveau.conf

# A Nouveau és a szükséges modulok újratöltése
update-initramfs -u

# Rendszer újraindítása a módosítások érvényesítéséhez
echo "A Nouveau driver eltávolítása megtörtént, most újraindítjuk a rendszert a változások érvényesítéséhez..."
#reboot

#Biztos ami biztos letakarítjuk
apt-get purge -y xserver-xorg-video-nouveau libdrm-nouveau2

# Várunk az újraindításig
echo "A rendszer újraindul..."

# Az NVIDIA driver csomagok telepítése
echo "NVIDIA driver telepítése..."

# Frissítjük a csomaglistát
apt update
# Kell mert dkms-t bele kell fordítani a kernel-be, lehet hogy nálad más verzió kell uname-a nézd meg milyen kernel-ed van ez változik ahogy fejlesztik
apt-get install -y linux-headers-6.12.48+deb13-amd64

# A szükséges csomagok telepítése
apt-get reinstall -y nvidia-driver-full firmware-misc-nonfree
apt-get reinstall -y nvidia-kernel-dkms
apt-get reinstall -y xserver-xorg-video-nvidia
update-initramfs -u
update-grub
# A telepítés befejezése után újraindítjuk a rendszert
echo "Az NVIDIA driver telepítése sikeresen befejeződött, most újraindítjuk a rendszert."
#reboot

