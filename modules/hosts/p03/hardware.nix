{
  flake-file.inputs.nixos-hardware = {
    url = "github:NixOS/nixos-hardware";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  flake.modules.nixos.p03Hardware =
    {
      config,
      lib,
      modulesPath,
      inputs,
      ...
    }:

    {
      imports = [
        (modulesPath + "/installer/scan/not-detected.nix")
        inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t14-amd-gen2
      ];

      boot.initrd.availableKernelModules = [
        "nvme"
        "ehci_pci"
        "xhci_pci_renesas"
        "xhci_pci"
        "usb_storage"
        "sd_mod"
        "rtsx_pci_sdmmc"
      ];
      boot.initrd.kernelModules = [ ];
      boot.kernelModules = [ "kvm-amd" ];
      boot.extraModulePackages = [ ];

      fileSystems."/" = {
        device = "/dev/disk/by-uuid/f07e2672-9dc2-4270-8721-d513d189cfce";
        fsType = "ext4";
      };

      fileSystems."/boot" = {
        device = "/dev/disk/by-uuid/BF44-5B26";
        fsType = "vfat";
        options = [
          "fmask=0022"
          "dmask=0022"
        ];
      };

      swapDevices = [
        { device = "/dev/disk/by-uuid/5c823714-bcbb-4b23-b8ab-d15fea0cea5f"; }
      ];

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
}
