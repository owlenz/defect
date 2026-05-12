{ config, ...}:
{
  flake.modules.homeManager.wayland =
    { pkgs, ... }:
    let
      hyprland-eco = with pkgs; [
        hyprpicker
        hyprsunset
        hypridle
        hyprlock

        grim
        slurp
      ];

      niri-eco = with pkgs; [
        alacritty
      ];

    in
    {
      imports = [
        config.flake.modules.homeManager.fuzzel
        config.flake.modules.homeManager.niri
        config.flake.modules.homeManager.hyprland
        config.flake.modules.homeManager.waybar
        config.flake.modules.homeManager.mako
      ];
      home.packages =
        hyprland-eco
        ++ niri-eco
        ++ (with pkgs; [
          wl-clipboard
        ]);

    };
}
