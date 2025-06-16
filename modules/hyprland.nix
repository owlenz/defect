{ pkgs, bibata-hyprcursor, ... }:

let
in
{
  programs.hyprland = {
    enable = true;
    # withUWSM = true;
    xwayland.enable = true;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  hardware.graphics = {
    package = pkgs.mesa;
    package32 = pkgs.pkgsi686Linux.mesa;
  };

  environment.sessionVariables = {
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
    MOZ_ENABLE_WAYLAND = "1";
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSOR = "1";
  };

  environment.systemPackages = with pkgs; [
    # hypr ecosystem
    hyprpicker
    hyprpaper
    hyprsunset
    bibata-hyprcursor
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
