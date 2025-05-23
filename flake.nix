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

      spotxOverlay = import ./overlays/spotx.nix;
      bibata-hyprcursor = pkgs.callPackage ./pkgs/bibata_hyprcursor {inherit (pkgs) hyprcursor; };
	  in {
		  nixosConfigurations = {
			  owlen = lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit zen-browser bibata-hyprcursor;
          };
				  modules = [
            ./configuration.nix
            ./modules/hyprland.nix
            ./modules/fonts.nix
            ./modules/gaming.nix
            ./modules/nvidia.nix
            ./modules/shell/zsh.nix
            ./modules/shell/direnv.nix
            ./modules/dev/web.nix
            ./modules/dev/c.nix
            ./modules/emacs.nix
            ./modules/desktop/misc.nix
            ./modules/desktop/browsers.nix
            { nixpkgs.overlays = [ spotxOverlay ]; }
            
            ({pkgs, ...}: {
              environment.systemPackages = [pkgs.spotify];
            })
          ];
        };
		  };
	  };
}
