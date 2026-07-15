{
  flake.modules.nixos.navidrome = { ... }: {
    services.navidrome = {
      enable = true;
      settings.MusicFolder = "/media/Music";
    };

    services.nginx = {
      enable = true;
      virtualHosts."navi.owlenz.xyz" = {
        forceSSL = true;
        enableACME = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:4533";
          proxyWebsockets = true;
        };
      };
    };

    networking.extraHosts = ''
      127.0.0.1 navi.owlenz.xyz
    '';
    users.users.navidrome = {
      isSystemUser = true;
      extraGroups = [ "media" ];
    };
  };
}
