{
  flake-file.inputs.stylix = {
    url = "github:nix-community/stylix";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  flake.modules.homeManager.stylix =
    let
      polarity = "dark";
    in
    {
      inputs,
      pkgs,
      config,
      ...
    }:
    {
      imports = [
        inputs.stylix.homeModules.default
      ];

      config = {
        stylix = {
          inherit polarity;

          enable = true;
          targets.emacs.enable = false;
          base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";

          icons = {
            enable = true;
            package = pkgs.adwaita-icon-theme;
            dark = "Adwaita";
            light = "Adwaita";
          };
          override = {
            base0F = "#FFFFFF";
          };
          fonts = {
            monospace = {
              package = pkgs.nerd-fonts.blex-mono;
              name = "BlexMono Nerd Font";
            };
            sansSerif = {
              package = pkgs.dejavu_fonts;
              name = "DejaVu Sans";
            };
            serif = {
              package = pkgs.dejavu_fonts;
              name = "DejaVu Serif";
            };
            sizes = {
              terminal = 12;
            };
          };
          opacity = {
            terminal = 0.95;
          };
        };

      };
    };
}
