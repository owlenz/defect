{ ... }:
{
  flake.modules.homeManager.web =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        typescript
        typescript-language-server
        astro-language-server
        nodejs
        php
        phpactor
        postman
      ];
    };
}
