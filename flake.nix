{
  description = "owlenz's system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # cider = {
    #   url = "git+https://git.nvds.be/NicolaiVdS/Nix-Cider2.git";
    #   rev = "151de67423c86208e885fd4794d064521207029c";
    # };
  };

	outputs = { nixpkgs, zen-browser, ...}:
		let
      getNixFiles = dir: let
        dirContents = builtins.readDir dir;
        isNixFile = name: type: type == "regular" && builtins.match ".*\.nix$" name != null;
        nixFiles = builtins.filter (name: isNixFile name (dirContents.${name})) (builtins.attrNames dirContents);
        nixFilesPaths = map (x: dir + "/${x}") nixFiles;
        isDir = type: type == "directory";
        test =  builtins.filter (name: isDir (dirContents.${name})) (builtins.attrNames dirContents);
        subDirPaths = map (x: getNixFiles ( dir + "/${x}" )) test;
      in
        nixFilesPaths ++ builtins.concatLists subDirPaths;

      moduleFiles = getNixFiles ./modules;
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
				  modules = moduleFiles ++ [
            ./configuration.nix
            { nixpkgs.overlays = [ spotxOverlay ]; }
            
            ({pkgs, ...}: {
              environment.systemPackages = [pkgs.spotify];
            })
          ];
        };
		  };
	  };
}
