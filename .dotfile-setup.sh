#!/usr/bin/env bash

# installs primary executables

function install_brew {
	if ! command -v brew >/dev/null; then
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	else
		echo "brew is already installed" >&2
	fi
}

function load_brew {
	brew bundle install --global
}

function main {
	install_brew
	load_brew
}

main
