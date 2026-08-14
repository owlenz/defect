{
  flake-file.inputs.nixvim = {
    url = "github:nix-community/nixvim";
    inputs.flake-parts.follows = "flake-parts";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  flake.modules.homeManager.nixvim = { inputs, pkgs, ... }: {
    imports = [
      inputs.nixvim.homeModules.default
    ];
    programs.nixvim = {
      enable = true;
      nixpkgs.source = pkgs.path;
      waylandSupport = true;
      clipboard.providers.wl-copy.enable = true;
      clipboard.register = "unnamedplus";
      extraConfigLua = ''
        		dofile(os.getenv("HOME") .. "/dotfiles/modules/home/editors/nixvim/test.lua")
        		'';

      imports = [
        (inputs.import-tree ./plugins)
        ./options.nix
        ./keybinds.nix
      ];
    };
  };
}
