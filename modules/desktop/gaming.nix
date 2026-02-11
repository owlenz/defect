{pkgs, ...}:
let
in {
  programs = {
    steam = {
      enable = true;
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
      gamescopeSession.enable = true;
      extraCompatPackages = with pkgs; [ proton-ge-bin ];
    };
    gamescope = {
      enable = true;
      capSysNice = true;
    };

    gamemode = {
      enable = true;
      settings = {
        general = {
          inhibit_screensaver = 0;
          renice = 10;
        };
      };
    };
  };
  environment.systemPackages = with pkgs; [
    lutris
    mangohud
  ];
  users.users.saif.extraGroups = [ "gamemode" ];
  systemd.extraConfig = "DefaultLimitNOFILE=1048576";
}
  
