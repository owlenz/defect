export PATH=$HOME/bin:/usr/local/bin:$PATH

# comment if using nix
# export ZSH="$HOME/.oh-my-zsh"
# plugins=( 
#     zsh-syntax-highlighting
#     tmux
#     git
#     # zsh-autosuggestions
# )
# source $ZSH/oh-my-zsh.sh
#

## PROMPT ##
export PS1="%F{#FD43B7}%n%f@%F{cyan}%m%f-> %1~ $ " ## BASH-like prompt

SAVEHIST=3000
HISTFILE=~/.zsh_history


## antigen

source ~/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle command-not-found

antigen bundle zsh-users/zsh-syntax-highlighting
# antigen bundle zsh-users/zsh-completions
# antigen bundle zsh-users/zsh-autosuggestions

# Load the theme.
# antigen theme candy 

# Tell Antigen that you're done.
antigen apply

##

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
alias pac="sudo pacman"
alias vim="nvim"
alias nivm="nvim"
alias notes="cd ~/Documents/notes; nvim"
alias pick="hyprpicker | tail -c +2 | head -c -1 |wl-copy" 
alias xpick="xcolor | xclip -sel clip" 

if which eza &> /dev/null; then
	alias ls="eza --icons=always --no-time --group-directories-first --no-user"
	alias ll="eza -blF --icons"
	alias tree="eza --tree --icons"
fi

if which kitten &> /dev/null; then
	alias icat="kitten icat"
	alias themes="kitten themes"
fi

if which nix &> /dev/null; then
    alias nrf="sudo nixos-rebuild switch --flake ~/dotfiles"
    alias nr="sudo nixos-rebuild switch"
    alias nsp="nix search nixpkgs"
    alias nsp="nix search"
    alias nlp="nix-store --query --requisites /run/current-system | cut -d- -f2- | sort -u"
fi


export PKG_CONFIG_PATH=/usr/lib/pkgconfig:/usr/share/pkgconfig:/lib/pkgconfig:$PKG_CONFIG_PATH

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
# . "$HOME/.cargo/env"

eval "$(fzf --zsh)"

# SSH_AUTH_SOCK=/tmp/ssh-XXXXXXxsH8Mf/agent.206828;
# export SSH_AUTH_SOCK;
# SSH_AGENT_PID=206829;
# export SSH_AGENT_PID;


# bun completions
[ -s "/home/saif/.bun/_bun" ] && source "/home/saif/.bun/_bun"

export EDITOR='emacs'

## android studio ##
# export ANDROID_HOME=$HOME/Android/Sdk
# export PATH=$PATH:$ANDROID_HOME/emulator
# export PATH=$PATH:$ANDROID_HOME/platform-tools

## arm-linux cross-compile
# export PATH=$HOME/x-tools/arm-balls-linux-musleabihf/bin:$PATH
# export ARCH=arm
# export CROSS_COMPILE=arm-linux-

# export PATH=$HOME/.config/emacs/bin:$PATH

# Start SSH agent
# if [ -z "$SSH_AUTH_SOCK" ]; then
#     eval "$(ssh-agent -s)"
#     ssh-add ~/.ssh/id_rsa
# fi

# pnpm
export PNPM_HOME="/home/owlenz/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
