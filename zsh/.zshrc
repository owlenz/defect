# zmodload zsh/zprof
export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=( 
    tmux
    git
    kitty
    bun
    golang
    zsh-autosuggestions
    zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh


SAVEHIST=10000  # Save most-recent 1000 lines
HISTFILE=~/.zsh_history

# Vi Mode
bindkey -v

# Aliases

alias passC="cat ~/Documents/xdd/pass | wl-copy"
if [[ "$(loginctl show-session $(awk '/tty/ {print $1}' <(loginctl)) -p Type | awk -F= '{print $2}')" == "wayland" ]]; then
fi


alias kittyC="nvim ~/.config/kitty/kitty.conf"
alias hyprC="nvim ~/.config/hypr/hyprland.conf"
alias tmuxC="nvim ~/.tmux.conf"
alias barC="cd ~/.config/waybar/ ; nvim"
alias nvimC="cd ~/.config/nvim/ ; nvim"
alias vimC="cd ~/.config/nvim/ ; nvim"
alias i3C="cd ~/.config/i3/ ; nvim"
alias zshC="nvim ~/.zshrc"
alias starC="nvim ~/.config/starship.toml"

## QOL aliases
alias cls='printf "\033c"'
alias ..="cd .."
alias grep='grep --color=auto'
alias pac="sudo pacman"
alias icat="kitten icat"
alias themes="kitten themes"
alias vim="nvim"
alias nivm="nvim"
alias ls="eza"
alias notes="cd ~/Documents/notes; nvim"
alias pick="hyprpicker | wl-copy" 
alias xpick="xcolor | xclip -sel clip" 
alias cat="bat"
alias ls="eza --icons=always --no-time --group-directories-first --no-permissions --no-user"

export PKG_CONFIG_PATH=/usr/lib/pkgconfig:/usr/share/pkgconfig:/lib/pkgconfig:$PKG_CONFIG_PATH

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

# . "$HOME/.cargo/env"

eval "$(atuin init zsh)"
eval "$(fzf --zsh)"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/home/saif/.bun/_bun" ] && source "/home/saif/.bun/_bun"
export EDITOR='nvim'

## android studio
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

## vcpkg
export VCPKG_ROOT=~/vcpkg
export PATH=$VCPKG_ROOT:$PATH


export TERM='xterm-256color'

export PATH="$PATH:$(go env GOBIN):$(go env GOPATH)/bin"
# export BROWSER='chromium'
# zprof

[ -f "/home/saif/.ghcup/env" ] && . "/home/saif/.ghcup/env" # ghcup-env