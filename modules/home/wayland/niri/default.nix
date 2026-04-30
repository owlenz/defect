{ ... }:
{
  flake.modules.homeManager.niri =
    { pkgs, lib, ... }:
    {
      home.packages = with pkgs; [
        xwayland-satellite
        swaylock
        swaybg
        swayidle
        udiskie
      ];
      programs.niri = {
        settings = {
        };
      };
    };
}
