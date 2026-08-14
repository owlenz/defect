{
  flake.modules.nixos.navidrome = { config, pkgs, ... }: {
    services.navidrome = {
      enable = true;
      settings.MusicFolder = "/media/Music";
      plugins = with pkgs.navidromePlugins; [
        discord-rich-presence
        listenbrainz-daily-playlist
        apple-music
      ];
    };

    services.nginx = {
      enable = true;
      virtualHosts."navi.owlenz.xyz" = {
        forceSSL = true;
        enableACME = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:4533";
          proxyWebsockets = true;
        };
      };
    };

    networking.extraHosts = ''
      127.0.0.1 navi.owlenz.xyz
    '';
    users.users.navidrome = {
      isSystemUser = true;
      extraGroups = [ "media" ];
    };
  };
}
