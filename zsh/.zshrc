if [ -d ~/.config/zsh/.zshrc.d ]; then
    for rc in ~/.config/zsh/.zshrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi

if [[ -z $ZELLIJ ]]; then
    exec zj
fi

# Location where zinit and plugins are stored
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Bootstrap zinit
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Load zinit
source "${ZINIT_HOME}/zinit.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(fzf --zsh)"

set -o AUTO_CD

# Initialize
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/drag.toml)"

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Load
autoload -U compinit && compinit

# Keybindings
bindkey -e
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward

# Enable history
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion style
zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"
zstyle ":completion:*" menu no
zstyle ":fzf-tab:complete:cd:*" fzf-preview 'ls --color $realpath'
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=60"

# Aliases
alias parrot="curl parrot.live"
alias cat="batcat"

alias ls="eza --icons"
alias lss="eza"
alias ll="eza -lh --icons"
alias la="eza -lah --icons"
alias lt="eza -T --icons"
alias l2="eza -T --icons -L 2"

alias update-omp="curl -s https://ohmyposh.dev/install.sh | sudo bash -s"

alias python="python3"

alias tux='ssh sb4339@drexel.edu@tux.cs.drexel.edu'

alias rga="rg --no-ignore"

alias fd="fdfind"

alias scargo="RUSTC_WRAPPER=sccache cargo"

alias npm="echo 'use pnpm'"

# make apt (up)grade again
alias maga="echo 'make apt (up)grade again'; sudo apt update && sudo apt upgrade -y"

function mkcd() {
    mkdir -p $1 && cd $_
}

# Variables
export DEFAULT_USER=drag
export SHELL=/bin/zsh
export BAT_THEME="TwoDark"
# export JAVA_HOME="/usr/lib/jvm/jdk-23-oracle-x64/"

# PATH
# export PATH=$PATH:/home/drag/.cargo/bin
export PATH=$PATH:/home/drag/.local/bin
# export PATH=$PATH:/home/drag/.anaconda3/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/opt/gradle/gradle-8.10.2/bin

# zoxide
eval "$(zoxide init --cmd cd zsh)"

# Automatic stuff
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/drag/.anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/drag/.anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/drag/.anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/drag/.anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<
#
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
# export PNPM_HOME="/home/drag/.local/share/pnpm"
# case ":$PATH:" in
#   *":$PNPM_HOME:"*) ;;
#   *) export PATH="$PNPM_HOME:$PATH" ;;
# esac
# pnpm end

# . "/home/drag/.deno/env"

fastfetch
