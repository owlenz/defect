{ config, ...}:
{
  flake.modules.homeManager.root = {pkgs,  ... }: {
    imports = [
      config.flake.modules.homeManager.term
      config.flake.modules.homeManager.wayland
      config.flake.modules.homeManager.emacs
      config.flake.modules.homeManager.gtk
      config.flake.modules.homeManager.browsers
      config.flake.modules.homeManager.media
      config.flake.modules.homeManager.dev
      config.flake.modules.homeManager.desktop
    ];
    home.sessionVariables = {
      TYPESCRIPT_SDK = "${pkgs.typescript}/lib";
    };
    programs.home-manager.enable = true;
  };
}
