
# for dot file maintenance
function config {
  /usr/local/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME "${@}"
}


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
