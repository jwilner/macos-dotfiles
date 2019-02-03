# add local path
PATH="${PATH}:${HOME}/bin"
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"

# go path
GOPATH="${HOME}/go"
PATH="${PATH}:${GOPATH}/bin/"

PATH="${PATH}:${HOME}/.cargo/bin"

alias git=hub

# for dot file maintenance
function config {
  git --git-dir=$HOME/.cfg --work-tree=$HOME "${@}"
}

# source stuff in order
for path in ~/.bashrc.d/*.{,ba}sh; do
  [ -r "${path}" ] && . "${path}"
done

