# run on log in
eval $(keychain --eval --inherit any id_rsa)

# delegate to bashrc
[ -r ".bashrc" ] && . ~/.bashrc
