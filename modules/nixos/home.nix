{
  inputs,
  config,
  lib,
  ...
}:
let
  configModules = config.flake.modules.homeManager;
in
{
  flake.modules.nixos.home =
    { config, ... }:
    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = { inherit inputs; };

        users.owlenz = {
          imports = [
            (if config.networking.hostName == "p03" then configModules.p03Home else configModules.defectHome)
          ];
          home.username = lib.mkDefault "owlenz";
          home.homeDirectory = lib.mkDefault "/home/owlenz";
          home.stateVersion = "24.11";
        };
      };
    };

}
