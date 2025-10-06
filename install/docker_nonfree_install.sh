#!/bin/bash

# Frissítjük a csomaglistát
echo "Frissítjük a csomaglistát..."
sudo apt update

# Telepítjük a szükséges csomagokat
echo "Szükséges csomagok telepítése..."
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Hozzáadjuk a Docker repository-t
echo "Docker GPG kulcs hozzáadása..."
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo tee /etc/apt/trusted.gpg.d/docker.asc

echo "Docker repository hozzáadása..."
echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Frissítjük újra a csomaglistát
echo "Újra frissítjük a csomaglistát..."
sudo apt update

# Telepítjük a Docker-t
echo "Docker telepítése..."
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Ellenőrizzük, hogy a Docker sikeresen telepítve lett-e
echo "Docker verzió ellenőrzése..."
sudo docker --version

# Opció: Docker csoport hozzáadása a felhasználóhoz
echo "Felhasználó hozzáadása a Docker csoporthoz (nem szükséges root jogokhoz)"
sudo usermod -aG docker $USER

echo "A Docker telepítése befejeződött. A rendszer újraindítása után a felhasználó hozzáférhet a Dockerhez."
