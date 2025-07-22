{
  description = "owlenz's system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
<<<<<<< HEAD
				  modules = moduleFiles ++ [
            ./configuration.nix
=======
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
>>>>>>> e938fff (cursor, browsers and more)
            { nixpkgs.overlays = [ spotxOverlay ]; }
            
            ({pkgs, ...}: {
              environment.systemPackages = [pkgs.spotify];
            })
          ];
        };
		  };
	  };
}
