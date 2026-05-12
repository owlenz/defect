{
  flake-file.inputs.kopuz.url = "github:temidaradev/kopuz";
  flake.modules.homeManager.kopuz =
    { pkgs, inputs, ... }:
    {
      home.packages = [ inputs.kopuz.packages.${pkgs.system}.default ];
    };
}
