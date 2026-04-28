{pkgs, cider-2, ...}:
let
in {
  environment.systemPackages = with pkgs; [
    mpv
    # cider
    cider-2
    wl-clipboard
  ];
  ## waydroid for apple music 
  virtualisation.waydroid.enable = false;
}
