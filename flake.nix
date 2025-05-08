{
  description = "Test Flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

	outputs = { self, nixpkgs, ...}:
		let
		  lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };

      spotxOverlay = import ./overlays/spotx.nix;
	  in {
		  nixosConfigurations = {
			  owlen = lib.nixosSystem {
          inherit system;
				  modules = [
            ./configuration.nix
            ./modules/hyprland.nix
            ./modules/fonts.nix
            ./modules/shell/zsh.nix
            ./modules/gaming.nix
            { nixpkgs.overlays = [ spotxOverlay ]; }
            
            ({pkgs, ...}: {
              environment.systemPackages = [pkgs.spotify];
            })
          ];
        };
		  };
	  };
}
