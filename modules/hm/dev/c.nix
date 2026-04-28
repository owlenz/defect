{pkgs, ...}:
let
in{
  home.packages = with pkgs; [
    gcc
    gdb
    valgrind
    clang-tools
    bear
    gnum4
    gnumake
    cmake
    pkg-config
    cambalache
  ];
}
