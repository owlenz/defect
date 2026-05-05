{ ... }:
{
  flake.modules.homeManager.niri =
    { pkgs, lib, ... }:
    {
      home.packages = with pkgs; [
        xwayland-satellite
        swaylock
        swaybg
        swayidle
        udiskie
        awww
      ];
      programs.niri = {
        settings = {
          screenshot-path = "~/Pictures/Screenshots/sc_%Y-%m-%d_%H-%M-%S.png";
          spawn-at-startup = [
            { argv = ["waybar"]; }
            { argv = ["systemctl" "--user" "import-environment" "WAYLAND_DISPLAY" "XDG_CURRENT_DESKTOP" "XDG_SESSION_TYPE" "DISPLAY"]; }
            { argv = [ "awww-daemon" ]; }
          ];
          environment = {
            XDG_CURRENT_DESKTOP = "GNOME";
            XDG_SESSION_TYPE = "wayland";
            WAYLAND_DISPLAY = "wayland-1";
          };
          prefer-no-csd = true;
        };
      };
    };
}
