{ inputs, ... }:
{
  flake-file.inputs.niri = {
    url = "github:epireyn/niri-flake";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  flake.modules.nixos.niri =
    { pkgs, ... }:
    {
      imports = [ inputs.niri.nixosModules.niri ];
      nixpkgs.overlays = [
        inputs.niri.overlays.niri
        (final: prev: {
          xwayland-satellite = prev.xwayland-satellite.overrideAttrs (old: rec {
            version = "0.8.1";

            src = final.fetchFromGitHub {
              owner = "Supreeeme";
              repo = "xwayland-satellite";
              rev = "536bd32";
              hash = "sha256-BUE41HjLIGPjq3U8VXPjf8asH8GaMI7FYdgrIHKFMXA=";
            };

            cargoDeps = final.rustPlatform.fetchCargoVendor {
              inherit (old) pname;
              inherit version src;
              hash = "sha256-16L6gsvze+m7XCJlOA1lsPNELE3D364ef2FTdkh0rVY=";
            };
          });
        })
      ];
      programs.niri = {
        enable = true;
        package = pkgs.niri-unstable;
      };
    };
}
