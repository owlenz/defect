{ ... }:
{
  flake.modules.homeManager.desktop =
    { inputs, pkgs, ... }:
    {
      home.packages = with pkgs; [
        keepassxc
        obs-studio
        krita

        (discord.override {
          withOpenASAR = false;
          withVencord = true;
        })

      ];
    };
}
