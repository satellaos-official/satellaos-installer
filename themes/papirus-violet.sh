#!/bin/bash

# Papirus-folders otomatik kurulum scripti
# Debian 13 + XFCE için hazırlanmıştır

echo ">>> Paket listesi güncelleniyor..."
sudo apt update

echo ">>> wget paketi kuruluyor (gerekliyse)..."
sudo apt install -y wget

echo ">>> Papirus ikon teması kuruluyor..."
sudo apt install -y papirus-icon-theme

echo ">>> papirus-folders kuruluyor..."
wget -qO- https://git.io/papirus-folders-install | sh

echo ">>> violet renk uygulanıyor..."
papirus-folders -C violet --theme Papirus

echo ">>> ikon önbelleği yenileniyor..."
sudo gtk-update-icon-cache -f /usr/share/icons/*

echo ">>> İşlem tamam! Oturumu kapatıp açarsanız değişiklikler görünür."
