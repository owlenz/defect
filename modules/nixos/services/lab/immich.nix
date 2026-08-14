{
  flake.modules.nixos.immich = {...}: {
    services.immich = {
      enable = true;
      host = "0.0.0.0";
      openFirewall = true;
      mediaLocation = "/media/Images";
    };

    services.suwayomi-server = {
      enable = true;
      settings = {
        server.port = 4567;
        server.enableSystemTray = true;
      };
    };

    # systemd.tmpfiles.rules = [
    #   "a+ /media/Images - - - - user:owlenz:rwx,default:user:owlenz:rwx"
    # ];
    users.users.immich.extraGroups = [ "media" "video" "render" ];
  };
}
