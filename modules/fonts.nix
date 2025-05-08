{pkgs,...}:
let
in {
  # fonts.packages = with pkgs; [
  #   (nerdfonts.override {fonts
  # [;
  fonts.packages = with pkgs; [
    nerd-fonts.blex-mono
    nerd-fonts.space-mono
  ];
}
