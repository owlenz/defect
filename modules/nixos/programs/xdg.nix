{ ... }:
{
  flake.modules.nixos.xdg =
    { pkgs, ... }:
    {
      xdg = {
        portal = {
          enable = true;
          config = {
            common.default = "*";
            hyprland.default = [
              "gtk"
              "hyprland"
            ];
            niri.default = [
              "gnome"
              "gtk"
            ];
          };
          extraPortals = [
            pkgs.xdg-desktop-portal-gtk
            pkgs.xdg-desktop-portal-hyprland
            pkgs.xdg-desktop-portal-gnome
          ];
        };
      };
    };
}
