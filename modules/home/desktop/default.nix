{
  config,
  ...
}:
{
  flake.modules.homeManager.desktop =
    {
      inputs,
      pkgs,
      ...
    }:
    {
      programs.obs-studio = {
        enable = true;
        package = (
          pkgs.obs-studio.override {
            cudaSupport = true;
          }
        );
      };
      imports = [ config.flake.modules.homeManager.obsidian ];
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
