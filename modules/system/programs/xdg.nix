{ pkgs, ... }:
{
  xdg = {
    portal = {
      enable = true;
      config = {
        common.default = "*";
        hyprland.default = [ "gtk" "hyprland" ];
        # niri.default = [ "gtk" "gnome" ];
      };
      extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-hyprland pkgs.xdg-desktop-portal-gnome ];
    };
    mime = {
      enable = true;
      defaultApplications = {
        "application/pdf" = "org.pwmt.zathura.desktop";
        "image/png" = "feh.desktop";
      };
    };
  };
}
