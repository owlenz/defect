{
  flake.modules.homeManager.firefox =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        firefox
      ];
    };
}
