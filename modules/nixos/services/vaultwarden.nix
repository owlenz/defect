{ ... }:
{
  flake.modules.nixos.vaultwarden = { config, ... }: {
    services.vaultwarden = {
      enable = true;
      dbBackend = "sqlite";
      config = {
        DOMAIN = "https://vault.owlenz.xyz";
        SIGNUPS_ALLOWED = true;
        ROCKET_ADDRESS = "0.0.0.0";
        ROCKET_PORT = 8222;
        WEBSOCKET_ENABLED = true;
      };
      environmentFile = config.sops.secrets."vaultwarden/admin_token".path;
    };
    security.acme = {
      acceptTerms = true;
      defaults.email = "admin@owlenz.xyz";
    };

    services.nginx = {
      enable = true;
      virtualHosts."vault.owlenz.xyz" = {
        forceSSL = true;
        enableACME = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:${toString config.services.vaultwarden.config.ROCKET_PORT}";
          proxyWebsockets = true;
        };
      };
    };
    networking.extraHosts = ''
      127.0.0.1 vault.owlenz.xyz
    '';

    networking.firewall.allowedTCPPorts = [ 8222 ];
  };
}
