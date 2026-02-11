{pkgs, config, ...}:
let
in {
  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];
  # video driver
  hardware= {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = [ pkgs.vaapiVdpau ];
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
}
