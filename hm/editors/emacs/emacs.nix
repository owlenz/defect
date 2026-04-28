{ pkgs, self, ... }:
{
  programs.emacs.enable = true;
  programs.emacs.package = (
    pkgs.emacsWithPackagesFromUsePackage {
      package = pkgs.emacs-pgtk;
      config = ./emacs/init.el;
      defaultInitFile = false;
      extraEmacsPackages = epkgs: [
        epkgs.cask
        epkgs.nerd-icons
        pkgs.shellcheck
      ];
    }
  );
  services.emacs = {
    enable = true;
    startWithUserSession = "graphical";
    defaultEditor = true;
  };
  xdg.configFile."emacs" = {
    source = ./emacs;
    recursive = true;
  };
}
