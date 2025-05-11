{
  description = "owlenz's system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

	outputs = { self, nixpkgs, zen-browser, ...}:
		let
		  lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };

      zen = zen-browser.packages."${system}".default;
      spotxOverlay = import ./overlays/spotx.nix;

	  in {
		  nixosConfigurations = {
			  owlen = lib.nixosSystem {
          inherit system;
				  modules = [
            ./configuration.nix
            ./modules/hyprland.nix
            ./modules/fonts.nix
            ./modules/gaming.nix
            ./modules/nvidia.nix
            ./modules/shell/zsh.nix
            ./modules/shell/direnv.nix
            ./modules/dev/web.nix
            ./modules/emacs.nix
            { nixpkgs.overlays = [ spotxOverlay ]; }
            
            ({pkgs, ...}: {
              environment.systemPackages = [pkgs.spotify zen];
            })
          ];
        };
		  };
	  };
}
