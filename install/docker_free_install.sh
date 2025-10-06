#!/bin/bash

# Frissítjük a csomaglistát
echo "Frissítjük a csomaglistát..."
sudo apt update

# Telepítjük a szükséges csomagokat a Docker telepítéséhez
echo "Szükséges csomagok telepítése..."
sudo apt install -y apt-transport-https ca-certificates curl gnupg lsb-release

# Telepítjük a Docker csomagot Debian hivatalos tárolójából
echo "Docker telepítése a Debian hivatalos tárolóból..."
sudo apt install -y docker.io containerd runc

# Ellenőrizzük, hogy a Docker sikeresen telepítve lett-e
echo "Docker verzió ellenőrzése..."
docker --version

# Opció: Docker csoport hozzáadása a felhasználóhoz (nem szükséges root jogokhoz)
echo "Felhasználó hozzáadása a Docker csoporthoz..."
sudo usermod -aG docker $USER

echo "A Docker telepítése befejeződött. A rendszer újraindítása után a felhasználó hozzáférhet a Dockerhez."
