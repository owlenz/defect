{
  systems = [ "x86_64-linux" ];
  imports = [
    ./hosts
    ./pkgs
  ];

  perSystem =
    { pkgs, ... }:
    {
      devShells.default = pkgs.mkShell {
        packages = [
          pkgs.git
          pkgs.nixd
        ];
      };
    };
}
