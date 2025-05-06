# zmodload zsh/zprof
export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"


plugins=( 
    zsh-syntax-highlighting
    tmux
    git
    zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh


## PROMPT ##
export PS1="%F{#FD43B7}%n%f@%F{cyan}%m%f-> %1~ $ " ## BASH-like prompt


SAVEHIST=10000 
HISTFILE=~/.zsh_history

# Vi Mode
bindkey -v

## Aliases ##
alias passC="cat ~/Documents/xdd/pass | wl-copy"
if [[ "$(loginctl show-session $(awk '/tty/ {print $1}' <(loginctl)) -p Type | awk -F= '{print $2}')" == "wayland" ]]; then
	alias passC="cat ~/Documents/xdd/pass | wl-copy"
fi

### Config Aliases ###
alias kittyC="nvim ~/.config/kitty/kitty.conf"
alias hyprC="nvim ~/.config/hypr/hyprland.conf"
alias tmuxC="nvim ~/.tmux.conf"
alias barC="cd ~/.config/waybar/ ; nvim"
alias nvimC="cd ~/.config/nvim/ ; nvim"
alias vimC="cd ~/.config/nvim/ ; nvim"
alias i3C="cd ~/.config/i3/ ; nvim"
alias zshC="nvim ~/.zshrc"
alias starC="nvim ~/.config/starship/starship.toml"


### QOL aliases ###
alias cls='printf "\033c"'
alias ..="cd .."
alias grep='grep --color=yes'
alias pac="sudo pacman"
alias vim="nvim"
alias nivm="nvim"
alias notes="cd ~/Documents/notes; nvim"
alias pick="hyprpicker | tail -c +2 | head -c -1 |wl-copy" 
alias xpick="xcolor | xclip -sel clip" 
alias cat="bat"
alias ls="eza --icons=always --no-time --group-directories-first --no-user"
alias icat="kitten icat"
alias themes="kitten themes"

export PKG_CONFIG_PATH=/usr/lib/pkgconfig:/usr/share/pkgconfig:/lib/pkgconfig:$PKG_CONFIG_PATH

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
# . "$HOME/.cargo/env"

eval "$(fzf --zsh)"
# eval "$(ssh-agent -s)"

export STARSHIP_CONFIG=~/.config/starship/starship.toml

# bun completions
[ -s "/home/saif/.bun/_bun" ] && source "/home/saif/.bun/_bun"
export EDITOR='nvim'

## android studio
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools


export PATH="$PATH:$(go env GOBIN):$(go env GOPATH)/bin"

[ -f "/home/saif/.ghcup/env" ] && . "/home/saif/.ghcup/env" # ghcup-env

. "/home/saif/.deno/env"
# zprof

## arm-linux cross-compile
export PATH=$HOME/x-tools/arm-balls-linux-musleabihf/bin:$PATH
export ARCH=arm
export CROSS_COMPILE=arm-linux-

export PATH=$HOME/.config/emacs/bin:$PATH
