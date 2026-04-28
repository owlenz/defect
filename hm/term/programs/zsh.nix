{ pkgs, ... }:
let
  editor = "emacsclient -c";
in
{
  programs.fzf.enableZshIntegration = true;
  programs.direnv.enableZshIntegration = true;

  home.packages = with pkgs; [ nix-zsh-completions ];
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    autocd = true;
    defaultKeymap = "vicmd";
    enableCompletion = true;
    sessionVariables = {
      EDITOR = "emacs";
      PS1 = "%F{#FD43B7}%n%f@%F{cyan}%m%f-> %1~ $ "; # # BASH-like prompt
    };
    history = {
      ignoreAllDups = true;
      extended = true;
      save = 3000;
    };

    initContent = ''
      DISABLE_MAGIC_FUNCTIONS="true"

      ENABLE_CORRECTION="true"

      COMPLETION_WAITING_DOTS="true"
    '';

    shellAliases = {
      ### config files shortcut ###
      kittyC = "${editor} ~/.config/kitty/kitty.conf";
      hyprC = "${editor} ~/.config/hypr/hyprland.conf";
      tmuxC = "${editor} ~/.tmux.conf";
      barC = "cd ~/.config/waybar/ ; ${editor}";
      nvimC = "cd ~/.config/nvim/ ;  ${editor} nvim";
      vimC = "cd ~/.config/nvim/ ; ${editor} nvim";
      i3C = "cd ~/.config/i3/ ; ${editor}";
      zshC = "${editor} ~/.zshrc";
      starC = "${editor} ~/.config/starship/starship.toml";

      ### QOL aliases ###
      ".." = "cd ..";
      vim = "nvim";
      nivm = "nvim";
      pick = "hyprpicker | tail -c +2 | head -c -1 |wl-copy";
      xpick = "xcolor | xclip -sel clip";
      ### eza ###
      ls = "eza --icons=always --group-directories-first --no-user";
      ll = "eza -blF --icons";
      tree = "eza --tree --icons";

      # nix aliases
      nrf = "sudo nixos-rebuild switch --flake ~/dotfiles";
      nr = "sudo nixos-rebuild switch";
      nsp = "nix search nixpkgs";
      nlp = "nix-store --query --requisites /run/current-system | cut -d- -f2- | sort -u";

      ### personal aliases ###
      passC = "cat ~/Documents/xdd/pass | wl-copy";
      notes = "cd ~/Documents/notes; nvim";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "command-not-found"
        "zsh-users/zsh-syntax-highlighting"
        "zsh-users/zsh-completions"
      ];

    };
  };
}
