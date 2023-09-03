#!/usr/bin/env bash

function install_brew {
  if ! command -v brew >&2; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    echo "brew is already installed" >&2
  fi
}

function install_kitty {
  if ! command -v kitty >&2; then
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
  else
    echo "kitty is already installed" >&2
  fi
}

function install_awscliv2 {
  if ! command -v aws >&2; then
    curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
    sudo installer -pkg AWSCLIV2.pkg -target /
  else
    echo "aws is already installed" >&2
  fi
}

function load_brew {
    brew bundle install --global
}

function main {
  install_brew
  install_kitty
  install_awscliv2
  load_brew
}

main

