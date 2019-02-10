# Key bindings
# ------------
source "$HOME/.fzf/shell/key-bindings.bash"

# Custom settings
# ---------------
export FZF_DEFAULT_COMMAND='rg --files --sortr=modified'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
