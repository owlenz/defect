{
  flake.modules.nixos.pi-hole = { ... }: {
    services = {
      pihole-ftl = {
        enable = true;
        lists = [
          {
            url = "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts";
            type = "block";
            enabled = true;
            description = "Steven Black's HOSTS";
          }
          {
            url = "https://raw.githubusercontent.com/hagezi/dns-blocklists/main/adblock/pro.txt";
            type = "block";
            enabled = true;
            description = "HaGeZi's Pro HOSTS";
          }
        ];
        openFirewallDNS = true;
        openFirewallDHCP = true;
        openFirewallWebserver = true;
        queryLogDeleter.enable = true;
        settings = {
          dns = {
            domain = "homelab.me";
            domainNeeded = true;
            expandHosts = true;
            interface = "enp4s0";
            hosts = [
              "192.168.1.1   gateway"
              "192.168.1.104   fin.owlenz.xyz"
              "192.168.1.104   navi.owlenz.xyz"
              "192.168.1.104   vault.owlenz.xyz"
            ];
            upstreams = [
              "1.1.1.1"
              "9.9.9.9"
              "1.1.1.2"
            ];
          };
          ntp = {
            ipv4.active = false;
            ipv6.active = false;
            sync.active = false;
          };

          misc.readOnly = false;
          # webserver = {
          #   api = {
          #     # To manage the web login:
          #     # 1) Temporarily set misc.readOnly to false in
          #     #    configuration.nix and switch to it.
          #     # 2) Manually set a password:
          #     #    Pi-hole web console > Settings > All settings >
          #     #    Webserver and API > webserver.api.password > Value: ******
          #     # 3) Read the generated hash:
          #     #    sudo pihole-FTL --config webserver.api.pwhash
          #     pwhash = "$BALLOON-SHA256...";
          #   };
          #   session = {
          #     timeout = 43200; # 12h
          #   };
          # };
        };
        useDnsmasqConfig = true;
      };

      pihole-web = {
        enable = true;
        ports = [ 8000 ];
      };

      resolved = {
        settings = {
          Resolve = {
            DNSStubListener = false;
            MulticastDNS = false;
          };
        };
      };
    };
  };
}
