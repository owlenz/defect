{
  flake.modules.nixos.immich = { ... }: {
    services.immich = {
      enable = true;
      host = "0.0.0.0";
      openFirewall = true;
      mediaLocation = "/media/Images";
    };

    users.users.immich.extraGroups = [
      "media"
      "video"
      "render"
    ];
  };
}
