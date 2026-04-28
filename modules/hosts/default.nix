{
  self,
  inputs,
  ...
}:
{
  flake.nixosConfigurations =
    let
      inherit (inputs.nixpkgs.lib) nixosSystem;
      specialArgs = { inherit inputs self ; modulesPath = "${inputs.nixpkgs}/nixos/modules"; };
      sys = ../system;
    in
    {
      defect = nixosSystem {
        inherit specialArgs;
        modules = [
          ./defect
          {
            nixpkgs.overlays = [ (import self.inputs.emacs-overlay) ];
          }
          "${sys}"
        ];
      };
    };
}
