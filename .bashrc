# add local path
PATH="${PATH}:${HOME}/bin"
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"

# go path
GOPATH="${HOME}/go"
PATH="${PATH}:${GOPATH}/bin/"
PATH="${PATH}:${HOME}/.cargo/bin"

# for dot file maintenance
function config {
  git --git-dir=$HOME/.cfg --work-tree=$HOME "${@}"
}

# source stuff in order
for path in "${HOME}"/.bashrc.d/*.{,ba}sh; do
  [[ -r "${path}" ]] && . "${path}"
done

eval "$(starship init bash)"

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

# PYENV
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
