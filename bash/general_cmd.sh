#!/usr/bin/env bash

# Start general_cmd
general_cmd_github() {
  echo "Type the username."
  read -r USERNAME
  echo "Type the password."
  read -r PASSWORD
  echo "Type the repository name."
  read -r REPONAME
  git config remote.origin.url https://"${USERNAME}":"${PASSWORD}"@github.com/"${USERNAME}"/"${REPONAME}".git
}

general_cmd_ssh() {
  DIR="$HOME/.ssh/"
  FILE="$HOME/.ssh/id_ed25519.pub"
  if [ -d "$DIR" ] && [ -f "$FILE" ]; then
    echo "You already have an SSH key Here it is:"
    echo ""
    cat "$HOME"/.ssh/id_ed25519.pub
    exit 0
  elif [ -d "$DIR" ] && [ ! -f "$FILE" ]; then
    echo "You do have the folder but not the ssh file 'id_ed25519.pub"
    echo " "
    echo "Type Your Email "
    read -r EMAIL
    echo "Is this your email address correct? [y/n] : $EMAIL"
    read -r right
    if [[ $right == "y" ]]; then
      ssh-keygen -t ed25519 -C "$EMAIL"
      echo " "
      echo "This is your SSH Key."
      cat ~/.ssh/id_ed25519.pub
    fi
    exit 0
  else
    echo "You don't have a ssh key. Lets Create one"
    echo "Type Your Email "
    read -r EMAIL
    echo "Is this your email address correct? [y/n] : $EMAIL"
    read -r right
    if [[ $right == "y" ]]; then
      ssh-keygen -t ed25519 -C "$EMAIL"
      echo " "
      echo "This is your SSH Key."
      cat ~/.ssh/id_ed25519.pub
    fi
  fi
}
