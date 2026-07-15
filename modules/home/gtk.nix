{ ... }:
{
  flake.modules.homeManager.gtk =
    { pkgs, ... }:
    {
      home.pointerCursor = {
        package = pkgs.bibata-cursors;
        name = "Bibata-Original-Ice";
        size = 24;
        gtk.enable = true;
        x11.enable = true;
      };

      gtk = {
        enable = true;
        colorScheme = "dark";
        iconTheme = {
          name = "Adwaita";
          package = pkgs.adwaita-icon-theme;
        };

        gtk4.theme = null;

        theme = {
          name = "adw-gtk3";
          package = pkgs.adw-gtk3;
        };
      };
      home.packages = with pkgs; [
        nwg-look
        nautilus

        libnotify
        playerctl
        gobject-introspection
      ];
    };
}
