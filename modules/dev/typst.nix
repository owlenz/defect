{ pkgs, ... }:
let
in {
  environment.systemPackages = with pkgs; [
    typst
    tinymist
  ];
}
