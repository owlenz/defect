{ config, ... }:
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
        xwayland-satellite
        swaylock
        swaybg
        swayidle
        udiskie
        awww
      ];
    in
    {
      imports = [
        config.flake.modules.homeManager.fuzzel
        config.flake.modules.homeManager.niri
        # config.flake.modules.homeManager.hyprland
        # config.flake.modules.homeManager.waybar
        config.flake.modules.homeManager.noctalia
        config.flake.modules.homeManager.mako
      ];
      home.packages =
        niri-eco
        ++ (with pkgs; [
          wl-clipboard
        ]);

    };
}
