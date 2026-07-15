{ ... }:
{
  flake.modules.nixos.xdg =
    { pkgs, ... }:
    {
      xdg = {
        portal = {
          enable = true;
          xdgOpenUsePortal = true;
          extraPortals = [
            pkgs.xdg-desktop-portal-gtk
            pkgs.xdg-desktop-portal-hyprland
            pkgs.xdg-desktop-portal-gnome
            pkgs.xdg-desktop-portal-wlr
          ];
          config = {
            common = {
              default = [ "gtk" ];
            };
            hyprland = {
              default = [ "gtk" "hyprland" ];
            };
            niri = {
              default = [ "gnome" "gtk" ];
              "org.freedesktop.impl.portal.ScreenCast" = [ "gnome" ];
              "org.freedesktop.impl.portal.Screenshot" = [ "gnome" ];
              "org.freedesktop.impl.portal.RemoteDesktop" = [ "gtk" ];
            };
          };
        };
      };
    };
}
