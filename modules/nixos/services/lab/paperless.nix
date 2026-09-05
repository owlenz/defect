{
  flake.modules.nixos.paperless = { config, ... }: {
    services.paperless = {
      enable = true;
      port = 5003;
      mediaDir = "/media";
      domain = "ppr.owlenz.xyz";
    };
    users.users.paperless = {
      isSystemUser = true;
      extraGroups = [ "media" ];
    };

    services.caddy = {
      virtualHosts."ppr.owlenz.xyz" = {
        extraConfig = "reverse_proxy 127.0.0.1:${toString config.services.paperless.port}";
      };
    };

    networking.extraHosts = ''
      127.0.0.1 ppr.owlenz.xyz
    '';
  };
}
