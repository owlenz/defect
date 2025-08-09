{pkgs, ...}:
let
in {
  environment.systemPackages = with pkgs; [
    mpv
    # cider
    cider-2
  ];
}
