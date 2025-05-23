{pkgs, ...}:
let
in{
  environment.systemPackages = with pkgs; [
    gcc
    gdb
    valgrind
    clang-tools
    bear
    gnumake
    cmake
    pkg-config
  ];
}
