# Fix the Java Problem
export _JAVA_AWT_WM_NONREPARENTING=1

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

# PATH qtile para Ubuntu
#PATH=$PATH:/home/vice/.local/bin

# Requiere scrub y shred, funcion para eliminar por completo un fichero
function rmk(){
	scrub -p dod $1
	shred -zun 10 -v $1
}


#function theme(){
#	if [ $# -eq 1 ]; then
#		if [ $(ls ~/.config/qtile/themes | grep ".json" | cut -d "." -f 1 | grep -w $1) ]; then
#			  actual=$(sed -e "s/}//g" -e 's/"//g' .config/qtile/config.json | awk 'NF{print $NF}') #theme
#        sed -i "s/${actual}/${1}/g" ~/.config/qtile/autostart.sh    			
#			  sed -i "s/${actual}/${1}/g" ~/.config/qtile/config.json
#    	  feh --bg-fill ~/.config/qtile/themes/$1.png
#    	  sed -i "s/${actual}/${1}/g" ~/.config/kitty/kitty.conf	
#        echo -e "\t${yellowColour}[!]${endColour} Recuerda reiniciar qtile con ${yellowColour}win+ctrl+r${endColour} o cerrar sesión con ${yellowColour}win+ctrl+q${endColour}."
#  	else
#		  echo -e "\t${redColour}[!]${endColour} El tema indicado no existe"			
#    fi
#  elif [ $# -eq 0 ]; then
#  	echo -e "\t${greenColour}[.]${endColour} Temas disponibles:"
#  	echo -e "$(ls ~/.config/qtile/themes | grep ".json" | cut -d "." -f 1)"
#	else
#   		echo -e "\t${redColour}[!]${endColour} Numero de argumentos invalido
#			\n\tEjemplo: theme [THEME]"
#  fi	
#}


# alias
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
#####################################################
# Auto completion / suggestion
# Mixing zsh-autocomplete and zsh-autosuggestions
# Jobs: suggest files / foldername / histsory bellow the prompt
# Requires: zsh-autosuggestions (packaging by Debian Team)
# Jobs: Fish-like suggestion for command history
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# Select all suggestion instead of top on result only
zstyle ':autocomplete:tab:*' insert-unambiguous yes
zstyle ':autocomplete:tab:*' widget-style menu-select
zstyle ':autocomplete:*' min-input 2


##################################################
# Fish like syntax highlighting
# Requires "zsh-syntax-highlighting" 

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-sudo/sudo.plugin.zsh

# Vi mode
#bindkey -v
#export KEYTIMEOUT=1

# Save type history for completion and easier life
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
# setopt appendhistory
setopt histignorealldups sharehistory

source /home/vice/.config/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Custom Aliases
alias cat='bat'
alias catnp='bat --no-paging'
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'
alias img='kitty +kitten icat'

bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/vice/Documents/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/vice/Documents/etc/profile.d/conda.sh" ]; then
        . "/home/vice/Documents/etc/profile.d/conda.sh"
    else
        export PATH="/home/vice/Documents/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

