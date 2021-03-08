#!/usr/bin/env bash

# 21/feb/2020
# This started with the IDE script.
# I did it to automatize the way that I did simple bootstrap web sites.
# This Follow script just does the mostly used things that I usually do on my operating system
# or the pos installation.
#
# It is in under construction.

source felib.sh
source menu.sh

source general_installer.sh
source general_cmd.sh

BASH_INCLUDE="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source "$BASH_INCLUDE/Ubuntu/cmd.sh"
source "$BASH_INCLUDE/Ubuntu/apt_install.sh"

# Start the main
while [[ "$1" ]]; do
  case "$1" in
  -ssh)
    general_cmd_ssh
    exit 0
    ;;

  -github-nopass | -github)
    # general_cmd
    general_cmd_github
    exit 0
    ;;

  -node | -node-install)
    # general_installers
    general_installer_node "${2}"
    exit 0
    ;;

  -git | -install-git)
    # Ubuntu_apt_install
    Ubuntu_apt_install_git
    exit 0
    ;;

  -nvim-flatpak)
    # general_installer
    general_installer_nvim-flatpak
    exit 0
    ;;

  -go)
    shift
    # general_installer
    general_installer_go "${1}"
    exit 0
    ;;

  -nvim-appimg)
    # general_installer
    general_installer_nvim-appimage
    exit 0
    ;;

  -chrome)
    # Ubuntu_apt_install
    Ubuntu_apt_install_chrome
    exit 0
    ;;

  -flatpak)
    # Ubuntu_apt_install
    Ubuntu_apt_install_flatpak
    exit 0
    ;;

  -up)
    # Ubuntu/cmd
    Ubuntu_cmd_update
    exit 0
    ;;

  -help | -man | man)
    _menu "$YELLOW"
    exit 0
    ;;

  *)
    _menu "$RED"
    exit 0
    ;;

  esac
done

if [[ -z "${1}" ]]; then
  _menu "$GREEN"
fi
