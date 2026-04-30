{inputs, ...}:
{
  flake-file.inputs.niri = {
    url = "github:sodiboo/niri-flake";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  flake.modules.nixos.niri =
    { pkgs,  ... }:
    # let
    #   # pkgs' = pkgs.extend (import inputs.niri.overlays.niri);
    # in
    {
      imports = [ inputs.niri.nixosModules.niri ];
      nixpkgs.overlays = [ inputs.niri.overlays.niri ];
      programs.niri = {
        enable = true;
        package = pkgs.niri-unstable;
      };
    };
}
