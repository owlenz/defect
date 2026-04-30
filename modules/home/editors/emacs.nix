{
  flake-file.inputs.emacs-overlay = {
    url = "github:nix-community/emacs-overlay";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  flake.modules.homeManager.emacs =
    { pkgs, inputs, ... }:
    let
      pkgs' = pkgs.extend (import inputs.emacs-overlay);
    in
    {
      programs.emacs = {
        enable = true;
        package = (
          pkgs'.emacsWithPackagesFromUsePackage {
            package = pkgs'.emacs-pgtk;
            config = ./emacs/init.el;
            defaultInitFile = false;
            extraEmacsPackages = epkgs: [
              epkgs.nerd-icons
            ];
          }
        );
      };
      services.emacs = {
        enable = true;
        startWithUserSession = "graphical";
        defaultEditor = true;
      };
      xdg.configFile."emacs" = {
        source = ./emacs;
        recursive = true;
      };
    };
}
