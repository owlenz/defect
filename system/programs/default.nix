{ inputs, ... }:
{
  imports = [
    ./xdg.nix
    ./hyprland
    ./zsh.nix
    ./fonts.nix
    ./gaming.nix
    ./hm.nix
    ./niri.nix
  ];
}
