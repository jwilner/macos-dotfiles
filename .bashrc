
# add local path
PATH="${PATH}:${HOME}/bin"

# for dot file maintenance
function config {
  git --git-dir=$HOME/.cfg --work-tree=$HOME "${@}"
}


function _conditional_source {
  [ -r "${1}" ] && . "${1}"
}

# add fzf stuff
_conditional_source ~/.bashrc.d/fzf.sh

# add git completion
_conditional_source ~/.bashrc.d/git-completion.bash

# wire in fasd jumping
_conditional_source ~/.bashrc.d/fasd-init.sh

# wire in git prompt
_conditional_source ~/.bashrc.d/git-prompt-init.sh

unset _conditional_source
