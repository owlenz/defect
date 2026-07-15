{ config, ... }:
{
  flake.modules.homeManager.editors = { pkgs, ... }: {
    imports = with config.flake.modules.homeManager; [
      emacs
      zed
    ];
    home.packages = with pkgs; [
      neovim
      vim
    ];
  };
}
