# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/wilner/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/wilner/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/wilner/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/wilner/.fzf/shell/key-bindings.bash"

