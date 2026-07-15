{ ... }:
{
  flake.modules.homeManager.c =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        clang-tools
        bear
        cmake
        gnumake
        gcc
        pkg-config
      ];
    };
}
