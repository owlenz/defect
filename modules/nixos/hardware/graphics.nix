{ ... }:
{
  flake.modules.nixos.graphics =
    { pkgs, config, ... }:
    {
      hardware = {
        graphics = {
          enable = true;
          enable32Bit = true;
          extraPackages = with pkgs; [
            nvidia-vaapi-driver
          ];
        };
        nvidia = {
          modesetting.enable = true;
          powerManagement.enable = true;
          powerManagement.finegrained = false;

          open = true;
          nvidiaSettings = true;

          package = config.boot.kernelPackages.nvidiaPackages.stable;
        };
      };
    };
}
