#!/bin/bash

set -u
set -e

mkdir -p "$HOME/satellaos-packages"

echo "Available programs:"
echo " 1) Steam (Deb)"
echo " 2) Free Download Manager (Deb)"
echo " 3) LocalSend (Deb)"
echo " 4) LocalSend (Flatpak)"
echo " 5) KDiskMark (Deb)"
echo " 6) KDiskMark (Flatpak)"
echo " 7) VirtualBox 7.2.4 [Deb (Debian 13)]"
echo " 8) GIMP (Deb)"
echo " 9) GIMP (Flatpak)"
echo "10) Pinta (Flatpak)"
echo "11) PowerISO (Flatpak)"
echo "12) MenuLibre (Deb)"
echo "13) Sublime Text (Deb)"
echo "14) WineHQ [Deb (Debian 13)]"
echo "15) Mission Center (Flatpak)"
echo "16) Google Chrome (Deb)"
echo "17) opera stable 125.0.5729.49 (Deb)"
echo "18) vivaldi stable 7.7.3851.66-1 (Deb)"
echo "19) Brave Browser [Deb (Debian, Ubuntu, Mint)]"
echo "20) Firefox ESR [Deb (Debian)]"
echo
echo "Enter the numbers of the programs you want to install (e.g., 1 3 7 13):"
read -r selection

for num in $selection; do
  case $num in
    1)
      wget -P "$HOME/satellaos-packages" https://repo.steampowered.com/steam/archive/precise/steam_latest.deb
      sudo apt install -y "$HOME/satellaos-packages/steam_latest.deb"
      ;;
    2)
      wget -P "$HOME/satellaos-packages" https://files2.freedownloadmanager.org/6/latest/freedownloadmanager.deb
      sudo apt install -y "$HOME/satellaos-packages/freedownloadmanager.deb"
      ;;
    3)
      wget -P "$HOME/satellaos-packages" https://github.com/localsend/localsend/releases/download/v1.17.0/LocalSend-1.17.0-linux-x86-64.deb
      sudo apt install -y "$HOME/satellaos-packages/LocalSend-1.17.0-linux-x86-64.deb"
      ;;
    4)
      flatpak install -y flathub org.localsend.localsend_app
      ;;
    5)
      wget -P "$HOME/satellaos-packages" https://github.com/JonMagon/KDiskMark/releases/download/3.2.0/kdiskmark_3.2.0_amd64.deb
      sudo apt install -y "$HOME/satellaos-packages/kdiskmark_3.2.0_amd64.deb"
      ;;
    6)
      flatpak install -y flathub io.github.jonmagon.kdiskmark
      ;;
    7)
      wget -P "$HOME/satellaos-packages" https://download.virtualbox.org/virtualbox/7.2.4/virtualbox-7.2_7.2.4-170995~Debian~trixie_amd64.deb
      sudo apt install -y "$HOME/satellaos-packages/virtualbox-7.2_7.2.4-170995~Debian~trixie_amd64.deb"
      wget -P "$HOME/satellaos-packages" https://download.virtualbox.org/virtualbox/7.2.4/Oracle_VirtualBox_Extension_Pack-7.2.4.vbox-extpack
      sudo VBoxManage extpack install "$HOME/satellaos-packages/Oracle_VirtualBox_Extension_Pack-7.2.4.vbox-extpack" \
        --accept-license=eb31505e56e9b4d0fbca139104da41ac6f6b98f8e78968bdf01b1f3da3c4f9ae
      ;;
    8)
      sudo apt install -y gimp
      ;;
    9)
      flatpak install -y flathub org.gimp.GIMP
      ;;
    10)
      flatpak install -y flathub com.github.PintaProject.Pinta
      ;;
    11)
      flatpak install -y flathub com.poweriso.PowerISO
      ;;
    12)
      sudo apt install -y menulibre
      ;;
    13)
      wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo tee /etc/apt/keyrings/sublimehq-pub.asc > /dev/null
      echo -e 'Types: deb\nURIs: https://download.sublimetext.com/\nSuites: apt/stable/\nSigned-By: /etc/apt/keyrings/sublimehq-pub.asc' | sudo tee /etc/apt/sources.list.d/sublime-text.sources
      sudo apt-get update
      sudo apt-get install -y sublime-text
      ;;
    14)
      sudo mkdir -pm755 /etc/apt/keyrings
      wget -O - https://dl.winehq.org/wine-builds/winehq.key | sudo gpg --dearmor -o /etc/apt/keyrings/winehq-archive.key -
      sudo dpkg --add-architecture i386
      sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/trixie/winehq-trixie.sources
      sudo apt update
      sudo apt install -y --install-recommends winehq-stable
      ;;
    15)
      flatpak install -y flathub io.missioncenter.MissionCenter
      ;;
    16)
      wget -P "$HOME/satellaos-packages" https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
      sudo apt install -y "$HOME/satellaos-packages/google-chrome-stable_current_amd64.deb"
      ;;
    17)
      wget -P "$HOME/satellaos-packages" https://download5.operacdn.com/ftp/pub/opera/desktop/125.0.5729.49/linux/opera-stable_125.0.5729.49_amd64.deb
      sudo apt install -y "$HOME/satellaos-packages/opera-stable_125.0.5729.49_amd64.deb"
      ;;
    18)
      wget -P "$HOME/satellaos-packages" https://downloads.vivaldi.com/stable/vivaldi-stable_7.7.3851.66-1_amd64.deb
      sudo apt install -y "$HOME/satellaos-packages/vivaldi-stable_7.7.3851.66-1_amd64.deb"
      ;;
    19)
      sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
      sudo curl -fsSLo /etc/apt/sources.list.d/brave-browser-release.sources https://brave-browser-apt-release.s3.brave.com/brave-browser.sources
      sudo apt update
      sudo apt install -y brave-browser
      ;;
    20)
      sudo apt install -y firefox-esr
      ;;
    *)
      echo "Invalid number: $num"
      ;;
  esac
done
