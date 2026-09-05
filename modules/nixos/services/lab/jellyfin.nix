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

      services.caddy = {
        enable = true;
        virtualHosts."fin.owlenz.xyz" = {
          extraConfig = "reverse_proxy 127.0.0.1:8096";
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
