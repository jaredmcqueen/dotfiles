export ZSH="/usr/share/oh-my-zsh"
export npm_config_prefix="$HOME/.local"
export EDITOR=nvim
export PATH="${PATH}:${HOME}/.krew/bin"
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.config/scripts:$PATH
export ANSIBLE_NOCOWS=1
export ANSIBLE_HOST_KEY_CHECKING=False

alias cdp="cd ~/Projects"
alias pipes="pipes.sh -p 10 -t 1 -r 0 -R"
alias matrix="unimatrix -n -s 96 -l o"
alias k="kubectl"
alias t="terraform"
alias v="nvim"
alias ta="sh ~/.config/scripts/tmux.sh"
alias vi3="nvim ~/.config/i3/config"
alias vnv="nvim ~/.config/nvim/init.lua"
alias ds="source ~/.config/scripts/deepsky.sh"
alias vzs="nvim ~/.zshrc"

mercury="20:18:11:1a:04:94"
apollo="20:18:11:1a:05:f2"
gemini="20:19:12:1a:01:8c"
alias wolm="wol $mercury"
alias wola="wol $apollo"
alias wolg="wol $gemini"
alias wolall="wolm; wola; wolg"


plugins=(
    fzf
    # vi-mode
    command-not-found
    zsh-autosuggestions
)

# bindkey '^ ' autosuggest-accept
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# plugins need to be sourced BEFORE oh-my-zsh.sh
source $ZSH/oh-my-zsh.sh


eval "$(starship init zsh)"
