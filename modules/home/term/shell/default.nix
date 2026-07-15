{ config, ... }:
{
  flake.modules.homeManager.shell =
    { pkgs, ... }:
    {
      imports = with config.flake.modules.homeManager; [
        git
        zsh
        direnv
        nix
      ];

      home.packages = with pkgs; [
        # killall command and more
        psmisc
        just
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
        unzip
        feh
        tmux
        ## man pages
        man-pages
        man-pages-posix
      ];
    };
}
