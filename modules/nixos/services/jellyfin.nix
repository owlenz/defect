{
  flake.modules.nixos.jellyfin =
    { pkgs, ... }:
    {
      services.jellyfin = {
        enable = true;
        openFirewall = true;
      };
      environment.systemPackages = with pkgs; [
        jellyfin
        jellyfin-media-player
        jellyfin-web
        jellyfin-ffmpeg
      ];

      services.nginx = {
        enable = true;
        virtualHosts."fin.owlenz.xyz" = {
          forceSSL = true;
          enableACME = true;
          locations."/" = {
            proxyPass = "http://127.0.0.1:8096";
            proxyWebsockets = true;
          };
        };
      };

      networking.extraHosts = ''
        127.0.0.1 fin.owlenz.xyz
      '';
      users.users.jellyfin = {
        isSystemUser = true;
        extraGroups = [ "media" ];
      };
    };
}
