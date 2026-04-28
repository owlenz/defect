{ inputs, self, ... }:
{
  imports = [ inputs.hm.nixosModules.home-manager ];
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = { inherit inputs; };
  home-manager.users.owlenz = import "${self}/hm";
}
