{
  flake.modules.homeManager.zed =
    { pkgs, inputs, ... }:
    {
      home.packages = with pkgs; [
        zed-editor
      ];
    };
}
