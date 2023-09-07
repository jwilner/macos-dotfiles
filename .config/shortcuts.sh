# file list -- primes fzf with my defaults when you're looking at files
function fl {
  if [ "${#}" -gt 0 ]; then
    fzf --preview='bat --color=always {}' --query="${1}"
  else
    fzf --preview='bat --color=always {}'
  fi
}

# jump to editing a file from a list
function jmp {
  local found
  found=$(fl "${@}") || return 1
  "${EDITOR:-vi}" "${found}"
}

# for dot file maintenance
function config {
  case "${1}" in
    brew)
      brew bundle --describe --global "${@:2}"
      ;;
    *)
      git --git-dir="$HOME/.cfg" --work-tree="$HOME" "${@}"
      ;;
  esac
}

