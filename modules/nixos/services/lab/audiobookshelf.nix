{
  flake.modules.nixos.audiobookshelf = { config, ... }: {
    services.audiobookshelf = {
      enable = true;
      port = 5002;
    };
    users.users.audiobookshelf = {
      isSystemUser = true;
      extraGroups = [ "media" ];
    };

    services.nginx = {
      enable = true;
      recommendedProxySettings = true;
      virtualHosts."abs.owlenz.xyz" = {
        forceSSL = true;
        enableACME = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:${toString config.services.audiobookshelf.port}";
          proxyWebsockets = true;
        };
      };
    };

    networking.extraHosts = ''
        127.0.0.1 abs.owlenz.xyz
      '';
  };
}
