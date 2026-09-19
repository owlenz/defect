{
  flake.modules.homeManager.niri =
    { ... }:
    {
      programs.niri = {
        settings = {
          screenshot-path = "~/Pictures/Screenshots/sc_%Y-%m-%d_%H-%M-%S.png";
          spawn-at-startup = [
            { argv = [ "waybar" ]; }
            # { argv = [ "noctalia" ]; }
            { argv = [ "awww-daemon" ]; }
            { argv = [ "awww-daemon --namespace backdrop" ]; }
          ];
          environment = {
            XDG_CURRENT_DESKTOP = "niri";
            XDG_SESSION_TYPE = "wayland";
            WAYLAND_DISPLAY = "wayland-1";

            MOZ_ENABLE_WAYLAND = "1";
            MOZ_DISABLE_RDD_SANDBOX = "1";
            ELECTRON_OZONE_PLATFORM_HINT = "auto";
            NIXOS_OZONE_WL = "1";

            WLR_NO_HARDWARE_CURSORS = "1";
          };
          prefer-no-csd = true;
        };
      };
    };
}
