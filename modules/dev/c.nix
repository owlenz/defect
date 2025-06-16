{pkgs, ...}:
let
in{
  environment.systemPackages = with pkgs; [
    gcc
    gdb
    valgrind
    clang-tools
    bear
    gnum4
    gnumake
    cmake
    pkg-config
  ];
}
