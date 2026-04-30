{
  inputs,
  ...
}:
{
  flake-file.inputs = {
    flake-file.url = "github:vic/flake-file";
  };

  imports = [
    inputs.flake-file.flakeModules.default
  ];

  systems = [
    "x86_64-linux"
  ];
}
