{ ... }: {
  flake.modules.nixos.karakeep =
    {
      inputs,
      pkgs,
      ...
    }:
    {
      services.karakeep = {
        enable = true;
        browser = {
          enable = true;
          exe = "${inputs.helium.packages.${pkgs.system}.default}/bin/helium";
        };
        meilisearch.enable = true;

        extraEnvironment = {
          PORT = "3000";
          DISABLE_SIGNUPS = "true";
          NEXTAUTH_URL = "https://krkp.owlenz.xyz";
        };
      };

      services.nginx = {
        enable = true;
        virtualHosts."krkp.owlenz.xyz" = {
          forceSSL = true;
          enableACME = true;
          locations."/" = {
            proxyPass = "http://127.0.0.1:3000";
            proxyWebsockets = true;
          };
        };
      };

      networking.extraHosts = ''
        127.0.0.1 krkp.owlenz.xyz
      '';
    };
}
