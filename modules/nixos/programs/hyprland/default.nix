{ self, ... }:
{
  flake.modules.nixos.hyprland =
    { pkgs, ... }:
    {
      programs.hyprland = {
        enable = true;
        withUWSM = true;
        xwayland.enable = true;
        portalPackage = pkgs.xdg-desktop-portal-hyprland;
      };

      environment.variables = {
        ELECTRON_OZONE_PLATFORM_HINT = "auto";
        MOZ_ENABLE_WAYLAND = "1";
        NIXOS_OZONE_WL = "1";
        WLR_NO_HARDWARE_CURSOR = "1";
      };

      # environment.systemPackages = with pkgs; [
      #   self.packages.x86_64-linux.bibata-hyprcursor
      # ];
    };
}
