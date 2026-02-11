{ pkgs, ... }:
let
in {
  environment.systemPackages = with pkgs; [
    typescript
    typescript-language-server
    astro-language-server
    nodejs
    php
    phpactor
  ];
}
