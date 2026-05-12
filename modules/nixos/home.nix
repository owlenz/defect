{ inputs, config, lib, ... }:
{
  flake.modules.nixos.home =
    { ... }:
    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = { inherit inputs; };
        
        users.owlenz = {
          imports = [
            config.flake.modules.homeManager.defectHome
            ];
          home.username = lib.mkDefault "owlenz";
          home.homeDirectory = lib.mkDefault "/home/owlenz";
          home.stateVersion = "24.11";
        };
      };
    };

}
