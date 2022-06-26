#               __            
# .-----.-----.|  |--.----.----.
# |-- __|__ --||     |   _|  __|
# |_____|_____||__|__|__| |____|

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:/sbin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:/root/.cargo/bin
export PATH=$PATH:/home/dilip/.scripts
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export EDITOR="nvim"
export TERMINAL="st"
export PAGER="less"
export FZF_DEFAULT_OPTS="--layout=reverse
						 --border rounded
						 --prompt=' '
						 --pointer='>>'"

# For colored output
export LESS_TERMCAP_mb=$'\E[01;34m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;37m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;33m'

setopt autocd              # change directory just by typing its name
autoload -Uz vcs_info

# ENABLE COMPLETION FEATURES
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # case insensitive tab completion

# Loading custom aliases
source ~/.aliases


# CUSTOM HEADER
fm6000 -c $(shuf -e red green yellow blue magenta | head -n 1)

# CUSTOM HEADER
PURPLE='\033[1;34m'
# WHITE_ITALIC='\033[3;37m'
NORMAL='\033[0;37m'
# # WHITE_BLINKING='\033[5;37m'
# fortune > /tmp/fortune
# while read -r line ; do
# 	echo -e "${PURPLE}┃${WHITE_ITALIC} $line ${NORMAL}"
# done < /tmp/fortune
# echo ""

# ZSH Plugin
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# if [[ "$(pwd)" == "/home/dilip" ]] ; then
# PS1='%F{green} %F{blue}%B%b '
# else
PS1='%F{green}%~ %F{blue}%B%b '
# fi
PS2='%F{green}┃ '
# PS2='%F{green} '
RPS1='%B %T%b'

# ENABLE AUTO-SUGGESTIONS BASED ON THE HISTORY
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    . /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    # change suggestion color
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'
fi

# HISTORY CONFIGURATIONS
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it

# VI MODE
bindkey -v

# COLOR SCRIPT
# colorscript --random
# colorscript --exec bars
# colorscript --exec alpha
# colorscript --exec blocks1
# colorscript --exec crunch
# colorscript --exec crunchbang-mini
# colorscript --exec dna
# colorscript --exec elfman
# colorscript --exec faces
# colorscript --exec fade
# colorscript --exec jangofett
# colorscript --exec panes
# colorscript --exec rails
# colorscript --exec square
# colorscript --exec tanks
# colorscript --exec tiefighter1row
# colorscript --exec tux

