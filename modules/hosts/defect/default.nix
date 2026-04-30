{ self, inputs, config, ... }:
{
  # flake.nixosConfigurations.defect = inputs.nixpkgs.lib.nixosSystem {
  #   modules = [
  #     self.modules.nixos.defectConfiguration
  #     self.modules.nixos.defectHardware
  #   ];
  # };
  nixosHosts = {
    defect = { system = "x86_64-linux"; unstable = true; };
  };
}
