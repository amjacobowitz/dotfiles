# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/aaronjacobowitz/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/aaronjacobowitz/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/aaronjacobowitz/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/aaronjacobowitz/.fzf/shell/key-bindings.bash"
