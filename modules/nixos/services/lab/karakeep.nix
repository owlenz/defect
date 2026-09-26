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
          NEXTAUTH_URL = "https://krkp.duckdns.org";
        };
      };

      services.caddy = {
        enable = true;
        virtualHosts."krkp.duckdns.org" = {
          extraConfig = "reverse_proxy 127.0.0.1:3000";
        };
      };

      networking.extraHosts = ''
        127.0.0.1 krkp.duckdns.org
      '';
    };
}
