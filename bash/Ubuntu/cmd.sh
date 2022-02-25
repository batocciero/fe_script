#!/usr/bin/env bash

# Start the Ubuntu_cmd
Ubuntu_cmd_update() {
  sudo apt update
  sudo apt upgrade -y
  sudo apt clean
  sudo apt autoclean
  sudo apt autoremove -y
}
