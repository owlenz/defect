{
  flake.modules.nixos.arr =
    { pkgs, ... }:
    {
      services = {
        seerr = {
          enable = true;
          openFirewall = true;
        };
        radarr = {
          enable = true;
          user = "arr";
          openFirewall = true;
        };
        bazarr = {
          enable = true;
          user = "arr";
          openFirewall = true;
        };
        sonarr = {
          enable = true;
          user = "arr";
          openFirewall = true;
        };
        prowlarr = {
          enable = true;
          openFirewall = true;
        };
        flaresolverr = {
          enable = true;
          openFirewall = true;
        };
        qbittorrent = {
          enable = true;
          user = "arr";
          openFirewall = true;
        };
      };
      users.users.arr = {
        isSystemUser = true;
        group = "arr";
        extraGroups = [ "media" "bazarr" "qbittorrent" ];
      };
      users.groups.arr = { };
      environment.systemPackages = with pkgs; [
        ffsubsync
      ];

      systemd.services.qbittorrent.serviceConfig = {
        UMask = "0002";
      };
      systemd.services.bazarr.serviceConfig = {
        UMask = "0002";
      };
    };
}
