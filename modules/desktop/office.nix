{pkgs,...}:
let
in {
  environment.systemPackages = [
    pkgs.onlyoffice-bin
  ];
}
