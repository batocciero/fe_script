#!/usr/bin/env bash

# Start installer
general_installer_node() {
  argv=$1

  if [[ -z "$argv" ]]; then
    echo "$argv "
    echo "Type the node version like | $0 -node 13.9.0"
    echo ""
    exit 1
  else
    #echo "Type the version of node"
    #read NODEVERSION
    cd "$HOME"/Downloads || exit
    wget https://nodejs.org/dist/v"$argv"/node-v"$argv"-linux-x64.tar.xz
    tar -xvf node-v"$argv"-linux-x64.tar.xz
    rm -r node-v"$argv"-linux-x64.tar.xz
    mv node-v"$argv"-linux-x64 node
    sudo cp -r node/{bin,include,lib,share} /usr/
    rm -rf node
    cd || exit
    exit 0
  fi
}

