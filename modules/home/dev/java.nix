{ ... }:
{
  flake.modules.homeManager.java = { pkgs, ... }:{
    # home.packages = with pkgs; [
    #   jdk
    # ];

    programs.java = {
      enable= true;
      package = pkgs.jdk;
    };
  };
}
