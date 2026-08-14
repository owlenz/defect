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
        tmux
      ];
      programs.fzf = {
        enable = true;
        enableZshIntegration = true;
      };

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
        ripgrep
        tokei
        unar
        zip
        unzip
        feh
        ## man pages
        man-pages
        man-pages-posix

        ## network
        lsof
        iotop
      ];
    };
}
