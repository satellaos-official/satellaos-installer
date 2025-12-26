#!/bin/bash

# --------------------------------------------------
# Core desktop packages and services setup
# Provides a usable XFCE-based system
# --------------------------------------------------
echo "Installing core system and XFCE desktop..."
sudo apt update

sudo apt install --no-install-recommends -y \
  xfce4 \
  xfce4-panel \
  xfce4-session \
  xfce4-settings \
  xfce4-terminal \
  xfce4-whiskermenu-plugin \
  xfce4-power-manager \
  xfce4-notifyd \
  xfce4-screenshooter \
  xfce4-screensaver \
  xfwm4 \
  xfdesktop4 \
  thunar \
  mousepad \
  xorg \
  dbus-x11 \
  x11-xserver-utils \
  lightdm \
  slick-greeter \
  lightdm-settings \
  network-manager \
  network-manager-gnome \
  ntfs-3g \
  gvfs \
  gvfs-backends \
  gvfs-fuse \
  pulseaudio \
  alsa-utils \
  pavucontrol

# --------------------------------------------------
# User utilities and desktop tools
# Not required for basic system operation
# --------------------------------------------------
echo "Installing user utilities and desktop tools..."
sudo apt install --no-install-recommends -y \
  menulibre \
  gnome-disk-utility \
  galculator \
  mtp-tools \
  jmtpfs \
  ristretto \
  gucharmap \
  unrar

# --------------------------------------------------
# Optional user applications
# General-purpose applications, user preference based
# --------------------------------------------------
echo "Installing optional user applications..."
sudo apt install --no-install-recommends -y \
  vlc \
  qbittorrent \
  grub-customizer

# --------------------------------------------------
# Fonts, themes, and visual customization
# Cosmetic and personalization packages
# --------------------------------------------------
echo "Installing fonts and visual customization..."
sudo apt install -y \
  fonts-noto \
  fonts-noto-extra \
  fonts-noto-cjk \
  fonts-noto-color-emoji \
  fonts-symbola \
  fonts-unifont \
  fonts-dejavu \
  fonts-liberation \
  fonts-nanum \
  fonts-unfonts-core \
  fonts-ipafont-mincho \
  fonts-ipafont-gothic \
  fonts-takao \
  fonts-wqy-zenhei \
  fonts-arphic-ukai \
  fonts-arphic-uming \
  fonts-bebas-neue \
  fonts-montserrat \
  adwaita-qt \
  gnome-themes-extra \
  bibata-cursor-theme

# --------------------------------------------------
# LightDM configuration
# --------------------------------------------------
echo "Configuring LightDM..."
sudo mkdir -p /etc/lightdm/lightdm.conf.d/
sudo bash -c 'cat > /etc/lightdm/lightdm.conf.d/10-slick.conf << "EOF"
[Seat:*]
greeter-session=slick-greeter
EOF'

# --------------------------------------------------
# Flatpak and Flathub (optional ecosystem)
# --------------------------------------------------
echo "Installing Flatpak and enabling Flathub..."
sudo apt install -y flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo "Installation completed. A system reboot is recommended."
