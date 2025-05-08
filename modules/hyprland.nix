{ pkgs, ... }:

let
  balls = 10;
in
{
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  hardware.graphics = {
    package = pkgs.mesa;
    package32 = pkgs.pkgsi686Linux.mesa;
  };
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };
  environment.systemPackages = with pkgs; [
    # hypr ecosystem
    hyprpicker
    hyprpaper
    hyprsunset
    hyprcursor
    waybar
    nwg-look

    mako
    libnotify
    playerctl
    pavucontrol
    # screenshot
    grim
    slurp
  ];
}
