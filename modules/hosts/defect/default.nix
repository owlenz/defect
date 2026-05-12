{ self, inputs, config, ... }:
{
  nixosHosts = {
    defect = { system = "x86_64-linux"; unstable = true; };
  };
}
