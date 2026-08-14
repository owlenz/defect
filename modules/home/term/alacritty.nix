{ ... }:
{
  flake.modules.homeManager.alacritty =
    { pkgs, ... }:
    {
      programs.alacritty = {
        enable = true;
        settings = {
          cursor = {
            style = {
              shape = "Block";
              blinking = "Off";
            };
          };
        };
      };
    };
}
