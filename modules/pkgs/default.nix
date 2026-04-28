{ inputs, ... }:
{
  systems = [ "x86_64-linux" ];
  perSystem =
    { pkgs, system, ... }:
    {
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      packages = {
        cider-2 = pkgs.callPackage ./cider {};
        bibata-hyprcursor = pkgs.callPackage ./bibata_hyprcursor {
          inherit (pkgs) hyprcursor;
          variant = "original";
        };
      };
    };
}
