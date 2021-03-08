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

general_installer_nvim-flatpak() {
  felib_installed flatpak
  case $? in
  0)
    echo "Flatpak is not installed"
    echo "This nvim installation uses flatpak try install it first"
    ;;
  1)
    shift
    felib_installed git
    case $? in
    0)
      echo "You don have git installed"
      ;;
    1)
      flatpak install io.neovim.nvim
      git clone https://github.com/batocciero/config_nvim.git \
        ~/.var/app/io.neovim.nvim/config/nvim
      if [ -f "$HOME"/.bashrc ]; then

        echo "# alias added by $0" >>"$HOME"/.bashrc
        echo "alias vim='flatpak run io.neovim.nvim'" >>"$HOME"/.bashrc

        # ROOT
        sudo sh -c "echo \" \" >> /root/.bashrc"
        sudo sh -c "echo \"# alias added by $0\" >> /root/.bashrc"
        sudo sh -c "echo \"alias vim='flatpak run io.neovim.nvim'\"  >> /root/.bashrc"
      else
        echo "there is no .bashrc file"
      fi
      ;;
    esac
    ;;
  esac
}

general_installer_go() {
  argv=$1

  if [ -z "$argv" ]; then
    echo ""
    echo "Type the version, like: $0 1.14.6"
    echo ""
  else
    GO="go$argv.linux-amd64.tar.gz"

    wget https://golang.org/dl/"$GO" -P /home/"$USER"/Downloads/

    cd /home/"$USER"/Downloads && sudo tar -C /usr/local -xzf "$GO" || exit
    sudo tar -C /usr/local -xzf /home/"$USER"/Downloads/"$GO"

    rm /home/"$USER"/Downloads/"$GO"

    cd .. || exit

    felib_file_exists /home/"$USER"/.bashrc
    case $? in
    1)
      echo "# Added by $0 script" >>/home/"$USER"/.bashrc
      echo "export PATH=$PATH:/usr/local/go/bin" >>/home/"$USER"/.bashrc
      ;;
    0)
      echo "There is no .bashrc"
      ;;
    esac

    felib_file_exists /home/"$USER"/.zshrc
    case $? in
    1)
      echo "# Added by $0 script" >>/home/"$USER"/.zshrc
      echo "export PATH=$PATH:/usr/local/go/bin" >>/home/"$USER"/.zshrc
      ;;
    0)
      echo "There is no .zshrc"
      ;;
    esac

  fi
}

general_installer_nvim-appimage() {
  ZSH=/home/"$USER"/.zshrc
  BASH=/home/"$USER"/.bashrc

  felib_installed git
  case $? in
  1)
    git -C /home/"$USER"/.config/ clone https://github.com/batocciero/config_nvim.git nvim
    ;;

  0)
    echo "Git is not installed"
    exit 1
    ;;
  esac

  wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage -P /home/"$USER"/Downloads/
  sudo mv /home/"$USER"/Downloads/nvim.appimage /usr/local/bin/
  sudo chmod +x /usr/local/bin/nvim.appimage

  #zsh
  felib_file_exists "$ZSH"
  case $? in
  1)
    {
      echo "#"
      echo "# Line by $0"
      echo "alias vim='nvim.appimage'"
    } >>"$ZSH"

    echo "# " | sudo tee -a /root/.zshrc
    echo "# Line by $0" | sudo tee -a /root/.zshrc
    echo "alias vim='nvim.appimage'" | sudo tee -a /root/.zshrc

    ;;

  0)
    echo "zsh is not installed"
    ;;
  esac

  # bash
  felib_file_exists "$BASH"
  case $? in
  1)
    {
      echo "#"
      echo "# Line by $0"
      echo "alias vim='nvim.appimage'"
    } >>"$BASH"

    echo "# " | sudo tee -a /root/.bashrc
    echo "# Line by $0" | sudo tee -a /root/.bashrc
    echo "alias vim='nvim.appimage'" | sudo tee -a /root/.bashrc

    ;;

  0)
    echo "Bash is not installed"
    ;;
  esac
}
