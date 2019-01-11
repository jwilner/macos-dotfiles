function dcmp {
  docker-compose "${@}"
}

function jmp {
  local found=$(fzf --preview='bat --color=always {}') || return 1
  "${EDITOR:-vi}" "${found}"
}
