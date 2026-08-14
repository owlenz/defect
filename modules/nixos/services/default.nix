{ config, ... }:
{
  flake.modules.nixos.services =
    { ... }:
    {
      imports = [
        config.flake.modules.nixos.dm
        config.flake.modules.nixos.ssh
        config.flake.modules.nixos.x11
        config.flake.modules.nixos.pipewire
        config.flake.modules.nixos.secrets
      ];
      programs.wireshark.enable = true;

      services = {
        gvfs.enable = true;
        blueman.enable = true;
        xserver.videoDrivers = [ "nvidia" ];
        flatpak.enable = true;
        # cloudflare-warp.enable = true;
      };

      virtualisation.oci-containers = {
        containers.couchdb-obsidian = {
          image = "couchdb:latest";
          ports = [ "5984:5984" ];
          environment = {
            COUCHDB_USER="owlenz";
            COUCHDB_PASSWORD="test";
          };
          volumes = [
            "./couchdb-data:/var/lib/couchdb/data"
            "./couchdb-etc:/var/lib/couchdb/etc/local.d "
          ];
        };
      };

      services.nginx = {
        enable = true;
        virtualHosts."cdb.owlenz.xyz" = {
          forceSSL = true;
          enableACME = true;
          locations."/" = {
            proxyPass = "http://127.0.0.1:5984";
            proxyWebsockets = true;
          };
        };
      };

      networking.extraHosts = ''
        127.0.0.1 cdb.owlenz.xyz
      '';
    };
}
