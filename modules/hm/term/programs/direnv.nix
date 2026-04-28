{pkgs,...}:
{
  programs.direnv = {
    enable = true;
    silent = true;
    nix-direnv = {
      enable = true;
      package = pkgs.nix-direnv;
    };
    enableZshIntegration = true;
  };
}
