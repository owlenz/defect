{pkgs,...}:
let
in {
  # fonts.packages = with pkgs; [
  #   (nerdfonts.override {fonts
  # [;
  fonts.packages = with pkgs; [
    nerd-fonts.blex-mono
    nerd-fonts.departure-mono
    nerd-fonts.space-mono
    noto-fonts-cjk-sans
  ];
}
