{ ... }:
{
  flake.modules.nixos.graphics =
    { pkgs, config, ... }:
    {
      environment.systemPackages = with pkgs; [
        gst_all_1.gstreamer
        gst_all_1.gst-plugins-base
        gst_all_1.gst-plugins-good
        gst_all_1.gst-plugins-bad
        gst_all_1.gst-plugins-ugly
        gst_all_1.gst-libav
      ];

      environment.variables.LIBVA_DRIVER_NAME = "nvidia";
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
          # forceFullCompositionPipeline = true;

          open = true;
          nvidiaSettings = true;

          package = config.boot.kernelPackages.nvidiaPackages.stable;
        };
      };
    };
}
