{pkgs,...};
let
in {
  environment.systemPackages = with pkgs; [
    neovim
  ];
}
