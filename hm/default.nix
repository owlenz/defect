{ pkgs, ... }:
{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  imports = [
    ./editors
    ./term
    ./wayland
    ./gtk.nix
    ./media
    ./browsers
    ./dev
    ./programs
  ];
  home.username = "owlenz";
  home.homeDirectory = "/home/owlenz";

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
