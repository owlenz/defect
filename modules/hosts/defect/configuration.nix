{
  flake.modules.nixos.defectConfiguration =
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

      programs.zsh.enable= true;

      users.groups.media = {};
      users.users.owlenz = {
        isNormalUser = true;
        home = "/home/owlenz";
        shell = pkgs.zsh;
        description = "owlenz main user";
        extraGroups = [
          "networkmanager"
          "wheel"
          "audio"
          "media"
        ];
      };

      networking.networkmanager.enable = false;
      networking.dhcpcd.enable = false;
      systemd.services.systemd-networkd-wait-online.enable = true;
      systemd.network = {
        enable = true;
        networks."10-lan" = {
          # Match your network interface name (run `ip link` to find yours)
          matchConfig.Name = "enp4s0";
          networkConfig = {
            DHCP = "no";
            DNS = "8.8.8.8 8.8.4.4";
          };
          addresses = [
            {
              Address = "192.168.1.104/24";
            }
          ];
          routes = [
            { routeConfig.Gateway = "192.168.1.1"; }
          ];
        };
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
    };
}
