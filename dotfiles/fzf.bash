# Setup fzf
# ---------
if [[ ! "$PATH" == *$HOME/.fzf/bin* ]]; then
  export PATH="$PATH:$HOME/.fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == *$HOME/.fzf/man* && -d "$HOME/.fzf/man" ]]; then
  export MANPATH="$MANPATH:$HOME/.fzf/man"
fi

complete -o bashdefault -o default -F _fzf_path_completion v

# Key bindings
# ------------
source "$HOME/.fzf/shell/key-bindings.bash"

# Custom settings
# ---------------
export FZF_DEFAULT_COMMAND='rg --files --sortr=modified'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
