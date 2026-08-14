{
  inputs,
  ...
}:
{
  flake-file.inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
  };

  imports = [
    inputs.flake-parts.flakeModules.modules
  ];

  flake-file.outputs = ''
    inputs:
      let
        lib = inputs.nixpkgs.lib;
        isNixvimExtra = path: lib.hasInfix "/nixvim/" path && !(lib.hasSuffix "/nixvim/default.nix" path);
        tree = inputs.import-tree.filterNot isNixvimExtra;
      in
      inputs.flake-parts.lib.mkFlake { inherit inputs; } (tree ./modules)
  '';
}
