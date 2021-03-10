#!/usr/bin/env bash

# 10/March/2021

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
