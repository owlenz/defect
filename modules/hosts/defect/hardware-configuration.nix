{
  self,
  inputs,
  ...
}:
{
  flake.nixosModules.defectHardware =
    {
      lib,
      config,
      modulesPath,
      ...
    }:
    {
      imports = [
        (modulesPath + "/installer/scan/not-detected.nix")
      ];

      boot.initrd.availableKernelModules = [
        "xhci_pci"
        "ahci"
        "usbhid"
        "usb_storage"
        "sd_mod"
      ];
      boot.initrd.kernelModules = [ ];
      boot.kernelModules = [ ];
      boot.extraModulePackages = [ ];

      fileSystems."/" = {
        device = "/dev/disk/by-uuid/40070f37-7a45-412b-89ec-2767c090d106";
        fsType = "ext4";
      };

      fileSystems."/boot" = {
        device = "/dev/disk/by-uuid/92E8-57B6";
        fsType = "vfat";
        options = [
          "fmask=0077"
          "dmask=0077"
        ];
      };
      fileSystems."/home/owlenz/games" = {
        device = "/dev/disk/by-uuid/1648D8C248D8A1B3";
        fsType = "ntfs";
        options = [
          "uid=1000"
          "gid=1000"
          "umask=0022"
          "rw"
          "nosuid"
          "nodev"
          "relatime"
          "user_xattr"
        ];
      };

      swapDevices = [
        { device = "/dev/disk/by-uuid/1b94a70e-e732-4074-8403-01699625d06a"; }
      ];

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
}
