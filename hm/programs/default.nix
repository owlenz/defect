{ pkgs, ... }:
{
  home.packages = with pkgs; [
    keepassxc
    obs-studio
    krita

    (discord.override {
      withOpenASAR = true;
      withVencord = true;
    })
  ];

}
