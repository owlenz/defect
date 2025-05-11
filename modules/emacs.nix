{ pkgs, ... }:
let

in {
  services.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
  };
}
