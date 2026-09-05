{
  flake.modules.nixos.navidrome = { pkgs, ... }: {
    services.navidrome = {
      enable = true;
      settings.MusicFolder = "/media/Music";
      plugins = with pkgs.navidromePlugins; [
        discord-rich-presence
        listenbrainz-daily-playlist
        apple-music
      ];
    };

    services.caddy = {
      enable = true;
      virtualHosts."navi.owlenz.xyz" = {
        extraConfig = "reverse_proxy 127.0.0.1:4533";
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
