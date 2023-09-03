# run on log in
eval "$(keychain --eval --inherit any id_ed25519)"

# delegate to bashrc
[[ -r "${HOME}/.bashrc" ]] && . "${HOME}/.bashrc"
