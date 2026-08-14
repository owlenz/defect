{ config, ... }:
{
  flake.modules.homeManager.term =
    { ... }:
    {
      imports = with config.flake.modules.homeManager; [
        foot
        kitty
        ghostty
        alacritty
        shell
      ];
    };
}
