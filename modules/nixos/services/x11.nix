{
  flake.modules.nixos.x11 =
    { ... }:
    {
      services = {
        picom = {
          enable = false;
          backend = "glx";
          vSync = true;
        };
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
        };
      };
    };
}
