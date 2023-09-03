
function dot_install_brew {
  if ! command -v brew >&2; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    echo "brew is already installed" >&2
  fi
}

function dot_install_kitty {
  if ! command -v kitty >&2; then
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
  else
    echo "kitty is already installed" >&2
  fi
}

function dot_dump_brew {
  brew bundle dump --force --file ~/.requirements/Brewfile
}

function dot_load_brew {
    brew bundle install --file ~/.requirements/Brewfile
}

function dot_update_fasd {
  PREFIX="${HOME}" make -C ~/.fasd/fasd install
}

function dot_pip_install {
  pip install -r ~/.requirements/requirements.txt
}

function dot_set_up {
  dot_install_brew
  dot_load_brew
  dot_update_fasd
}

function dot_finish_set_up {
  dot_pip_install
}
