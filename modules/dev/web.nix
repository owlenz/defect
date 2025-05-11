{ pkgs, ... }:
let
in {
  environment.systemPackages = with pkgs; [
    typescript
    astro-language-server
    nodejs
  ];
}
