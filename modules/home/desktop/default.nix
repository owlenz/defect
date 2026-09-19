{
  config,
  ...
}:
{
  flake.modules.homeManager.desktop =
    {
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
      programs.zathura = {
        enable = true;
        mappings = {
          "d" = "scroll half-down";
          "u" = "scroll half-up";
        };
      };

      imports = [ config.flake.modules.homeManager.obsidian ];
      home.packages = with pkgs; [
        keepassxc
        krita
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
