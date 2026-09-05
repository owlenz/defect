{ lib, ... }:
let
  utils = import ../lib/utils.nix { inherit lib; };
  keymaps = map utils.mkKeymap [
    {
      key = "e";
      action = ''lua require("neo-tree.command").execute({ toggle = true })'';
      desc = "Find Files";
    }
  ];
in
{
  plugins.neo-tree = {
    enable = true;
    settings = {
      popup_border_style = "rounded";
      filesystem = {
        filtered_items = {
          hide_dotfiles = false;
          hide_gitignored = false;
          hide_by_name = [
            "node_modules"
          ];
        };
      };
      window = {
        position = "float";
        width = 40;
      };
      buffers = {
        group_empty_dirs = true;
      };
    };
  };
  inherit keymaps;
}
