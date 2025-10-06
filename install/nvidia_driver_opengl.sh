#!/bin/bash

# Rendszer csomaglistájának frissítése
echo "Frissítjük a csomaglistát..."
sudo apt update

# Vulkan és OpenGL csomagok telepítése
echo "Telepítjük a Vulkan és OpenGL csomagokat..."
sudo apt install -y \
    vulkan-tools \
    mesa-vulkan-drivers \
    mesa-utils \
    libvulkan1 \
    libvulkan-dev \
    libx11-dev \
    libxrandr-dev \
    libxi-dev \
    libglu1-mesa \
    x11-utils \
    libglvnd-dev

# Frissítjük az összes csomagot
echo "Frissítjük az összes csomagot..."
sudo apt upgrade -y

# Vulkan telepítésének ellenőrzése
echo "A Vulkan telepítése után ellenőrizzük a verziót..."
vulkaninfo | head -n 20

# OpenGL verzió ellenőrzése
echo "OpenGL verzió ellenőrzése..."
glxinfo | grep "OpenGL version"

# Újraindítás javasolt, hogy minden frissítés életbe lépjen
echo "A telepítés befejeződött. Javasolt egy újraindítás a változások érvényesítéséhez."
