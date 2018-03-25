
function dot_install_brew {
  if ! command -v brew >&2; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    echo "brew is already installed" >&2
  fi
}

function dot_dump_brew {
  (cd ~/.requirements && brew bundle dump --force)
}

function dot_load_brew {
  (cd ~/.requirements && brew bundle install)
}

function dot_update_fasd {
  (cd ~/.fasd/fasd && PREFIX="${HOME}" make install)
}

function dot_update_blackbox {
  (cd ~/.blackbox && make symlinks-install)
}

function dot_update_macpaste {
  (cd ~/.macpaste && make macpaste)
  osascript -e "tell application \"System Events\" to make login item at end with properties {path:\"${HOME}/.macpaste/macpaste\", hidden:true}"
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
