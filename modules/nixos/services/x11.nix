{
  flake.modules.nixos.x11 =
    { ... }:
    {
      services = {
        xserver = {
          xkb = {
            layout = "us,ara";
            variant = ",";
            options = "grp:alt_shift_toggle";
          };
          enable = false;
          desktopManager = {
            xterm.enable = false;
            xfce.enable = false;
          };
          windowManager.xmonad.enable = true;
        };
      };
    };
}
