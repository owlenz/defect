{ config, ...}:
{
  flake.modules.homeManager.dev = { ... }: {
    imports = [
      config.flake.modules.homeManager.web
      config.flake.modules.homeManager.java
    ];
    programs.home-manager.enable = true;
  };
}
