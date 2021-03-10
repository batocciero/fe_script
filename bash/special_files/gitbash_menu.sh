#!/usr/bin/env bash

# 10/03/2021

# shellcheck disable=SC2034
BLACK="\u001b[30m"
RED="\u001b[1;31m"
GREEN="\u001b[1;32m"
YELLOW="\u001b[1;33m"
BLUE="\u001b[34m"
MAGENTA="\u001b[35m"
CYAN="\u001b[36m"
WHITE="\u001b[37m"
RESET="\u001b[0m"

_menu() {
  arg=$1
  echo -e "${arg}"
  echo -e '-ssh\t\t\t\t| Setting up the ssh key.'
  echo -e '-github-nopass or -github\t| Github push without password on project.'
  echo -e "${RESET}"
}
