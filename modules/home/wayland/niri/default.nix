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
          screenshot-path = "~/Pictures/Screenshots/sc_%Y-%m-%d_%H-%M-%S.png";
          spawn-at-startup = "waybar";
        };
      };
    };
}
