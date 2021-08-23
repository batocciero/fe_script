#!/bin/bash
# August 23 2021

GREEN="\u001b[1;32m"
YELLOW="\u001b[1;33m"
RESET="\u001b[0m"

BUILD_FOLDER="compiled"
BUILDED_FILE="auto"

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
source "$DIR/bash/felib.sh"

# Installer add on bash path only
installer() {
  #bash/felib.sh
  felib_dir_exists "$BUILD_FOLDER"
  case "$?" in
  0)
    echo -e "${YELLOW}The project is not compiled. Please run the ${GREEN}'builder.sh'${RESET}${YELLOW} first.${RESET}"
    exit 1
    ;;
  1)
    felib_dir_exists "$HOME"/.bin
    case "$?" in 
      0) mkdir "$HOME"/.bin ;; 
    esac
    echo "# Added by $0 script" >>/home/"$USER"/.bashrc
    echo "export PATH=$PATH:/usr/local/go/bin" >>/home/"$USER"/.bashrc
    exit 1
    ;;
  esac
}

while [[ "$1" ]]; do
  case "$1" in
  -c)
    installer
    exit 0
    ;;
  *)
    installer
    exit 0
    ;;
  esac
done

if [[ -z "${1}" ]]; then
  installer
fi
