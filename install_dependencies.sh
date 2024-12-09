#!/bin/bash

# Update package lists
echo "Updating package lists..."
sudo dnf check-update
sudo dnf upgrade --refresh

# Install dependencies
echo "Install dependencies..."

sudo dnf install -y code
sudo dnf install -y python3.11 poetry 
sudo dnf install -y dotnet-sdk-8.0 aspnetcore-runtime-8.0 dotnet-runtime-8.0
sudo dnf install -y java-latest-openjdk.x86_64 java-23-openjdk.x86_64 kotlin
sudo dnf install gcc glibc-devel zlib-devel libstdc++-static
curl https://download.oracle.com/graalvm/23/latest/graalvm-jdk-23_linux-x86_64_bin.tar.gz
flatpak install flathub io.dbeaver.DBeaverCommunity
flatpak install flathub md.obsidian.Obsidian
flatpak install flathub com.discordapp.Discord
flatpak install flathub com.getpostman.Postman
flatpak install flathub com.vscodium.codium
flatpak install flathub io.missioncenter.MissionCenter
flatpak run com.github.tchx84.Flatseal
flatpak install flathub com.mattjakeman.ExtensionManager

# Setup docker
echo "Setting up docker..."

sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
sudo systemctl enable docker
sudo groupadd docker && sudo gpasswd -a ${USER} docker && sudo systemctl restart docker
newgrp docker