{ config, ...}:
{
  flake.modules.homeManager.root = { ... }: {
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
    programs.home-manager.enable = true;
  };
}
