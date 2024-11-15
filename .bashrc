export EDITOR=vim

export PATH="${HOME}/.local/bin:${PATH}"

[[ -x /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"

GPG_TTY=$(tty)
export GPG_TTY

export RIPGREP_CONFIG_PATH="${HOME}/.ripgreprc"

# golang
export GOPATH="${HOME}/go"
export GOBIN="${GOPATH}/bin" # default val but being explicit
export PATH="${PATH}:${GOBIN}"

# rust
export CARGO_HOME="${HOME}/.cargo" # default val but being explicit
# shellcheck source=.cargo/env
[[ -f "${CARGO_HOME}" ]] && . "${CARGO_HOME}/env"
export PATH="${PATH}:${CARGO_HOME}/bin"

# kitty
# shellcheck source=/Applications/kitty.app/Contents/Resources/kitty/shell-integration/bash/kitty.bash
# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

# git completion
. "${HOME}/.config/git/completion.sh"

# custom shortcuts
. "${HOME}/.config/shortcuts.sh"

alias ls=lsd
alias tree="ls --tree"

eval "$(gdircolors --bourne-shell "${HOME}"/.config/LS_COLORS)"

eval "$(fzf --bash)"
eval "$(starship init bash)"
eval "$(zoxide init bash)"
eval "$(direnv hook bash)"
