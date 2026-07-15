{ ... }:
{
  flake.modules.homeManager.web =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        typescript
        typescript-language-server
        tailwindcss-language-server
        astro-language-server
        nodejs
        php
        phpactor
        postman
      ];
    };
}
