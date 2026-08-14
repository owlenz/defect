{ config, ... }:
{

  flake-file.inputs.helium = {
    url = "github:schembriaiden/helium-browser-nix-flake";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  flake.modules.homeManager.browsers =
    { pkgs, inputs, ... }:
    {
      home.packages = [
        pkgs.chromium
        inputs.helium.packages.${pkgs.system}.default
      ];

      imports = [ config.flake.modules.homeManager.firefox ];
    };
}
