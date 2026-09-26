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
              "192.168.1.104   abs.owlenz.xyz"
            ];
            upstreams = [
              "1.1.1.1"
              "8.8.4.4"
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
