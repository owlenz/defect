{ config, ...}:
{
  flake.modules.homeManager.wayland =
    { pkgs, ... }:
    let
      hyprland-eco = with pkgs; [
        hyprpicker
        hyprpaper
        hyprsunset
        hypridle
        hyprlock

        # screenshot
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
      ];
      home.packages =
        hyprland-eco
        ++ niri-eco
        ++ (with pkgs; [
          waybar
          mako
          wl-clipboard
        ]);

    };
}
