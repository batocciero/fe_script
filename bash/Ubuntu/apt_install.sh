#!/usr/bin/env bash

# Start the Ubuntu_apt_install
Ubuntu_apt_install_git() {
  sudo add-apt-repository ppa:git-core/ppa -y
  sudo apt update
  sudo apt install -y git
}

Ubuntu_apt_install_chrome() {
  cd "$HOME/Downloads/" || exit
  felib_installed wget
  case $? in
  1)
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo apt install ./google-chrome-stable_current_amd64.deb -y
    rm google-chrome-stable_current_amd64.deb
    cd .. || exit
    ;;
  0)
    sudo apt install -y wget
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo apt install ./google-chrome-stable_current_amd64.deb -y
    rm google-chrome-stable_current_amd64.deb
    cd .. || exit
    ;;
  esac
}

Ubuntu_apt_install_flatpak() {
  felib_installed flatpak
  case $? in
  1) flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo ;;
  0)
    sudo apt install flatpak -y
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    ;;
  esac
}
