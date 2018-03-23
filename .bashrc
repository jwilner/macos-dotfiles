
readonly GIT_PATH=/usr/local/bin/git

# for dot file maintenance
function config {
  ${GIT_PATH} --git-dir=$HOME/.cfg --work-tree=$HOME "${@}"
}

