{ pkgs, ... }:
let
in {
  home.packages = with pkgs; [
    typst
    tinymist
  ];
}
