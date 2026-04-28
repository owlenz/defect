{ pkgs, ... }:
{
  boot.loader.efi = {
    canTouchEfiVariables = true;
    efiSysMountPoint = "/boot";
  };

  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    useOSProber = true;
    # theme = "/home/owlenz/dotfiles/config/grub";
  };
  networking.hostName = "defect";
  time.timeZone = "Africa/Cairo";

  users.users.owlenz = {
    isNormalUser = true;
    description = "owlenz main user";
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
    ];
  };

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  environment.systemPackages = with pkgs; [
    vim
    curl
    wget
  ];
  networking.firewall.enable = false;
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.11";



  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
