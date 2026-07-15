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
        gst_all_1.gst-plugins-ugly    # needed for some H.264/AAC support depending on licensing
        gst_all_1.gst-libav           # ffmpeg-based codecs, broad H.264 support
      ];
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
