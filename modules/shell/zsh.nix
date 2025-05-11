{pkgs, config, ...}:
let

in {
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    promptInit = "";
    ohMyZsh = {
      enable = true;
      custom = "${config.users.users.saif.home}/.config/oh-my-zsh";
      plugins = [
        "git"
        "direnv"
        "nix-shell"
      ];
    };
  };
  users.defaultUserShell = pkgs.zsh; 

  documentation = {
    enable = true;
    man = {
      man-db.enable = false;
      mandoc.enable = true;
    };
    info.enable = true;
    doc.enable = true;
    dev.enable = true;
  };

  environment.systemPackages = with pkgs; [
    at
    bat
    man
    bc
    dust
    eza
    fasd
    fd
    nil
    fzf
    gnumake
    nix-zsh-completions
    ripgrep  
    tokei    
    unar
    zip
    feh
    ## man pages
    man-pages
    man-pages-posix
    mpi
  ];
}
