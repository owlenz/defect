{ ... }:
{
  imports = [
    ./ly.nix
    ./ssh.nix
    ./x11.nix
    ./pipewire.nix
  ];
  services = {
    gvfs.enable = true;
    blueman.enable = true;
    xserver.videoDrivers = [ "nvidia" ];
    flatpak.enable = true;
  };
}
