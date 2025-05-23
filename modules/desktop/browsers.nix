{ pkgs, zen-browser, ... }:
let
  zen = zen-browser.packages.${pkgs.system}.default;
in {
  environment.systemPackages = with pkgs; [
    # firefox
    zen
    brave
    librewolf
    wineWowPackages.waylandFull
  ];
}
