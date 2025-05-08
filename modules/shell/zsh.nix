{pkgs, ...}:
let

in {
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    promptInit = "";
    ohMyZsh = {
      enable = true;
      plugins = [
        "git"
      ];
    };
  };
  
  users.defaultUserShell = pkgs.zsh; 

  environment.systemPackages = with pkgs; [
    at
    bat      # a better cat
    bc
    dust     # a better du
    eza      # a better ls
    fasd
    fd
    fzf
    gnumake
    libqalculate  # calculator cli w/ currency conversion
    nix-zsh-completions
    ripgrep  # a better grep
    tokei    # for code statistics
    unar
  ];
}
