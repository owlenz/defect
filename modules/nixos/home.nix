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
    let
      hostname = config.networking.hostName;
    in
    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = { inherit inputs hostname; };

        users.owlenz = {
          imports = [
            (if hostname == "p03" then configModules.p03Home else configModules.defectHome)
          ];
          home.username = lib.mkDefault "owlenz";
          home.homeDirectory = lib.mkDefault "/home/owlenz";
          home.stateVersion = "24.11";
        };
      };
    };

}
