{pkgs, ...}:
let
in {
  environment.systemPackages = with pkgs; [
    mpv
    cider
    wl-clipboard
  ];
  ## waydroid for apple music 
  virtualisation.waydroid.enable = true;
}
