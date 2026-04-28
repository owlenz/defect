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
    ./fuzzel.nix
  ];

  home.packages =
    hyprland-eco
    ++ niri-eco
    ++ (with pkgs; [
      waybar
      mako
      wl-clipboard
    ]);

}
