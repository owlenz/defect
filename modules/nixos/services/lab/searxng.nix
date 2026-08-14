{ ... }: {
  flake.modules.nixos.searxng =
    {
      pkgs,
      config,
      lib,
      ...
    }:
    {
      sops.secrets.searxng = { };
      services.searx = {
        enable = false;
        package = pkgs.searxng;
        redisCreateLocally = true;
        environmentFile = config.sops.secrets.searxng.path;

        settings = {
          general = {
            debug = true;
            instance_name = "SearXNG Instance";
            # donation_url = false;
            # contact_url = false;
            # privacypolicy_url = false;
            # enable_metrics = false;
          };
          search = {
            favicon_resolver = "duckduckgo";
            autocomplete = "duckduckgo";
            autocomplete_min = 2;
          };

          ui = {
            static_use_hash = true;
            default_locale = "en";
            query_in_title = true;
            infinite_scroll = false;
            center_alignment = false;
            default_theme = "simple";
            theme_args.simple_style = "auto";
            search_on_category_select = true;
            hotkeys = "vim";
          };
          server = {
            port = 8888;
            bind_address = "127.0.0.1";
          };
          engines = lib.mapAttrsToList (name: value: { inherit name; } // value) {
            "duckduckgo".disabled = false;
            "brave".disabled = true;
          };
          enabled_plugins = [
            "Basic Calculator"
            "Hash plugin"
            "Tor check plugin"
            "Open Access DOI rewrite"
            "Hostnames plugin"
            "Unit converter plugin"
            "Tracker URL remover"
          ];
        };
      };

      virtualisation.oci-containers.containers = {
        searxng-core = {
          image = "docker.io/searxng/searxng:latest";
          autoStart = true;
          ports = [ "8888:8888" ];
          environmentFiles = [ config.sops.secrets.searxng.path ];
          volumes = [
            "/var/lib/searxng/core-config:/etc/searxng"
            "/var/lib/searxng/core-data:/var/cache/searxng"
          ];
        };

        searxng-valkey = {
          image = "docker.io/valkey/valkey:9-alpine";
          autoStart = true;
          cmd = [
            "valkey-server"
            "--save"
            "30"
            "1"
            "--loglevel"
            "warning"
          ];
          volumes = [
            "/var/lib/searxng/valkey-data:/data"
          ];
          dependsOn = [ "searxng-core" ];
          extraOptions = [
            "--network=container:searxng-core"
          ];
        };
      };
      users.groups.searx.members = [ "nginx" ];

    };
}
