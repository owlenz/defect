{ lib, ... }:
let
  utils = import ../lib/utils.nix { inherit lib; };

in
{
  plugins = {
    gitsigns = {
      enable = true;
    };
    fugitive = {
      enable = true;
    };
  };
}
