{ pkgs, ... }:
{

  imports = [
    ./git.nix
    ./zsh.nix
    ./direnv.nix
  ];

  home.packages = with pkgs; [
    # killall command and more
    psmisc

    at
    bat
    btop
    man
    bc
    dust
    eza
    fasd
    fd
    nil
    fzf
    ripgrep
    tokei
    unar
    zip
    feh
    ## man pages
    man-pages
    man-pages-posix
  ];

}
