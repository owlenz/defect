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
          base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";

          targets.emacs.enable = false;
          targets.nixvim = {
            enable = false;
            plugin = "base16-nvim";
          };

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
              terminal = 11;
            };
          };
          opacity = {
            terminal = 0.95;
          };
        };

      };
    };
}
