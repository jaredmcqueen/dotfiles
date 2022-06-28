export ZSH="$HOME/.oh-my-zsh"
export npm_config_prefix="$HOME/.local"
export EDITOR=nvim
export PATH="${PATH}:${HOME}/.krew/bin"
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.config/scripts
export PATH=$PATH:$HOME/go/bin
export ANSIBLE_NOCOWS=1
export ANSIBLE_HOST_KEY_CHECKING=False

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

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
alias gp="git pull"

alias wgu="wg-quick up ~/wg.conf"
alias wgd="wg-quick down ~/wg.conf"

mercury="20:18:11:1a:04:94"
apollo="20:18:11:1a:05:f2"
gemini="20:19:12:1a:01:8c"
alias wolm="wol $mercury"
alias wola="wol $apollo"
alias wolg="wol $gemini"
alias wolall="wolm; wola; wolg"

# zsh-completions
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi

plugins=(
    zsh-completions
    fzf
    # vi-mode
    command-not-found
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
eval "$(starship init zsh)"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
