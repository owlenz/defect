{
  flake.modules.nixos.slskd = { config, ... }: {
    sops.secrets."slskd_env" = {};
    services.slskd = {
      enable = true;
      group = "media";
      environmentFile = config.sops.secrets."slskd_env".path;
      settings = {
        directories = {
          downloads = "/media/Music/tobescanned";
          incomplete = "/media/slskd";
        };
      };
    };
  };
}
