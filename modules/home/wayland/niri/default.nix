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
            { argv = [ "noctalia" ]; }
            # {
            #   argv = [
            #     "systemctl"
            #     "--user"
            #     "import-environment"
            #     "WAYLAND_DISPLAY"
            #     "XDG_CURRENT_DESKTOP"
            #     "XDG_SESSION_TYPE"
            #     "DISPLAY"
            #   ];
            # }
            { argv = [ "awww-daemon" ]; }
          ];
          environment = {
            XDG_CURRENT_DESKTOP = "niri";
            XDG_SESSION_TYPE = "wayland";
            WAYLAND_DISPLAY = "wayland-1";

            GBM_BACKEND = "nvidia-drm";
            __GLX_VENDOR_LIBRARY_NAME = "nvidia";
            LIBVA_DRIVER_NAME = "nvidia";
            NVD_BACKEND = "direct";

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
