{ ... }:
{
  flake.modules.homeManager.desktop =
    { inputs, pkgs, ... }:
    {
      programs.obs-studio = {
        enable = true;
        package = (
          pkgs.obs-studio.override {
            cudaSupport = true;
          }
        );
      };
      home.packages = with pkgs; [
        keepassxc
        krita
        zathura
        # (discord.override {
        #   withOpenASAR = true;
        #   # withVencord = true;
        # })
        vesktop
        onlyoffice-desktopeditors
        corefonts
      ];
    };
}
