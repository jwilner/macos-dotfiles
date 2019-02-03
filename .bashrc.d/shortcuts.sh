# because docker-compose is a long f'ing name
function dcmp {
  docker-compose "${@}"
}

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
  local found=$(fl "${@}") || return 1
  "${EDITOR:-vi}" "${found}"
}
