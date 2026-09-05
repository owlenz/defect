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

    services.caddy = {
      enable = true;
      email = "saifowlenzz@gmail.com";
      virtualHosts."abs.owlenz.xyz" = {
        extraConfig = "reverse_proxy 127.0.0.1:${toString config.services.audiobookshelf.port}";
      };
    };

    networking.extraHosts = ''
      127.0.0.1 abs.owlenz.xyz
    '';
  };
}
