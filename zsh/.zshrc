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

alias k="kubectl"
alias h="helm"
alias t="terraform"
alias v="nvim"
alias ta="sh ~/.config/scripts/tmux.sh"
alias gp="git pull"
alias vpnstop="launchctl unload /Library/LaunchAgents/com.paloaltonetworks.gp.pangpa.plist; \
               launchctl unload /Library/LaunchAgents/com.paloaltonetworks.gp.pangps.plist"

alias vpnstart="launchctl load /Library/LaunchAgents/com.paloaltonetworks.gp.pangpa.plist; \
                launchctl load /Library/LaunchAgents/com.paloaltonetworks.gp.pangps.plist"
alias wgu="wg-quick up ~/wg.conf"
alias wgd="wg-quick down ~/wg.conf"

mercury="20:18:11:1a:04:94"
apollo="20:18:11:1a:05:f2"
gemini="20:19:12:1a:01:8c"
alias wolm="wakeonlan $mercury"
alias wola="wakeonlan $apollo"
alias wolg="wakeonlan $gemini"
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
