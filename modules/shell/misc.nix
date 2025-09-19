{pkgs,...}:
let
in {
  environment.systemPackages = with pkgs; [
    ranger
  ];
}
