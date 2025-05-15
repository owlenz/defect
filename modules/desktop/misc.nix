{ pkgs, ... }:
let

in {
  environment.systemPackages = with pkgs; [
    qbittorrent
    wineWowPackages.waylandFull
    (discord.override {
      # withOpenASAR = true;
      # withVencord = true;
    })
  ];
}
