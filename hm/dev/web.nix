{ pkgs, ... }:
let
in {
  home.packages = with pkgs; [
    typescript
    typescript-language-server
    astro-language-server
    nodejs
    php
    phpactor
  ];
}
