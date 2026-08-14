{ ... }:
{
  flake.modules.homeManager.ghostty =
    { pkgs, ... }:
    {
      programs.ghostty = {
        enable = true;
        enableZshIntegration = true;
        installVimSyntax = true;
        systemd = {
          enable = true;
        };
        settings =  {
          theme = "Nord";
        };
      };
    };
}
