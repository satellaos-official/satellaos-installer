#!/bin/bash
# Fluent GTK tema kurulumu (XFCE, saydamlık yok) - Sisteme kurulum (/usr/share/themes)

# Gereken paketleri yükle
sudo apt update
sudo apt install -y git

# Repo'yu klonla
git clone https://github.com/vinceliuice/Fluent-gtk-theme.git "$HOME/satellaos-installer/themes/Fluent-gtk-theme/"

# Klasöre geç
cd $HOME/satellaos-installer/themes/Fluent-gtk-theme/ || exit

# GTK temasını /usr/share/themes içine yükle (tüm temalar, saydamlık yok)
sudo ./install.sh --dest /usr/share/themes --theme all --tweaks solid
