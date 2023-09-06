export EDITOR=vim
export PATH="${PATH}:${HOME}/bin"

# golang
export GOPATH="${HOME}/go"
export GOBIN="${GOPATH}/bin" # default val but being explicit
export PATH="${PATH}:${GOBIN}"

# rust
export CARGO_HOME="${HOME}/.cargo" # default val but being explicit
# shellcheck source=.cargo/env
. "${CARGO_HOME}/env"
export PATH="${PATH}:${CARGO_HOME}/bin"

# python
# PYENV
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# kitty
# shellcheck source=/Applications/kitty.app/Contents/Resources/kitty/shell-integration/bash/kitty.bash
# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

# fzf
. ".config/fzf/fzf.bash"

# git completion
. ".config/git/completion.sh"

# custom shortcuts
. ".config/shortcuts.sh"

eval "$(starship init bash)"
eval "$(zoxide init bash)"
eval "$(direnv hook bash)"
