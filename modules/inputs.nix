{
  nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  zen-browser = {
    url = "github:0xc000022070/zen-browser-flake";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  hm = {
    url = "github:nix-community/home-manager";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  emacs-overlay = {
    url = "github:nix-community/emacs-overlay";
  };
  import-tree.url = "github:vic/import-tree";
  flake-parts.url = "github:hercules-ci/flake-parts";
}
