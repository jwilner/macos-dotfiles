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

sandr() {
  local search="${1}" replace="${2}"
  if [[ -z "${search}" ]] || [[ -z "${replace}" ]]; then
    echo "Usage: sandr SEARCH REPLACE" >&2
    return 1
  fi

  while read -r fname; do
    vim -c '%s!'"${search}"'!'"${replace}"'!gc' -c 'wq' "${fname}"
  done < <(rg -l "${search}")
}
