#!/usr/bin/env bash

# Start the Ubuntu_apt_install
Ubuntu_apt_install_git() {
  sudo add-apt-repository ppa:git-core/ppa -y
  sudo apt update
  sudo apt install -y git
}

