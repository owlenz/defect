{ config, ... }:
{
  flake.modules.homeManager.root = { pkgs, ... }: {
    imports = [
      config.flake.modules.homeManager.term
      config.flake.modules.homeManager.wayland
      config.flake.modules.homeManager.editors
      config.flake.modules.homeManager.gtk
      config.flake.modules.homeManager.browsers
      config.flake.modules.homeManager.media
      config.flake.modules.homeManager.dev
      config.flake.modules.homeManager.desktop
      config.flake.modules.homeManager.stylix
    ];
    home.sessionVariables = {
      TYPESCRIPT_SDK = "${pkgs.typescript}/lib";
    };
    programs.home-manager.enable = true;
  };
}
