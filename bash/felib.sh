#!/usr/bin/env bash

# Fe lib March/2020
# This lib have some of functions used on main.sh
# I just put some code here become the main file has becomes very large
#
# Return 1 == Already Installed
#

# Start felib
felib_installed() {
  arg=$1
  if [ -x "$(command -v "$arg")" ]; then
    return 1
  else
    return 0
  fi
}

felib_file_exists() {
  arg=$1
  if [ -f "$arg" ]; then
    return 1
  else
    return 0
  fi
}

felib_dir_exists() {
  arg=$1
  if [ -d "$arg" ]; then
    return 1
  else
    return 0
  fi
}
