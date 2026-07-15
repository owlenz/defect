{
  flake.modules.nixos.ddns =
    { config, ... }:
    {
      sops.secrets."namecheap_dns_password" = {
        # owner = "ddclient";
      };

      services.ddclient = {
        enable = true;
        interval = "5min";

        protocol = "namecheap";
        server = "dynamicdns.park-your-domain.com";

        username = "owlenz.xyz";
        passwordFile = config.sops.secrets."namecheap_dns_password".path;

        domains = [ "vault" "fin" "navi" ];
      };
    };
}
