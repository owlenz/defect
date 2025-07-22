{ pkgs, zen-browser, ... }:
let
  zen = zen-browser.packages.${pkgs.system}.default;
in {
  environment.systemPackages = with pkgs; [
    # firefox
    zen
    brave
<<<<<<< HEAD
    # librewolf
=======
    librewolf
>>>>>>> e938fff (cursor, browsers and more)
    wineWowPackages.waylandFull
  ];
}
