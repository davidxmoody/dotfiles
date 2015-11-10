# Setup fzf
# ---------
if [[ ! "$PATH" == *$HOME/p/fzf/bin* ]]; then
  export PATH="$PATH:$HOME/p/fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == *$HOME/p/fzf/man* && -d "$HOME/p/fzf/man" ]]; then
  export MANPATH="$MANPATH:$HOME/p/fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOME/p/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "$HOME/p/fzf/shell/key-bindings.bash"
