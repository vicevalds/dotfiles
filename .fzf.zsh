# Setup fzf
# ---------
if [[ ! "$PATH" == */home/vice/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/vice/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/vice/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/vice/.fzf/shell/key-bindings.zsh"
