{pkgs, ...}:
let
in{
  environment.systemPackages = with pkgs; [
    gcc
    gdb
    valgrind
    clang-tools
    bear
<<<<<<< HEAD
    gnum4
    gnumake
    cmake
    pkg-config
    cambalache
=======
    gnumake
    cmake
    pkg-config
>>>>>>> e938fff (cursor, browsers and more)
  ];
}
