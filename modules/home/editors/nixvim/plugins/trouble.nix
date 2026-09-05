{ lib, ... }:
let
  utils = import ../lib/utils.nix { inherit lib; };
  keymaps = map utils.mkKeymap [
    {
      key = "xx";
      action = "Trouble diagnostics toggle";
      desc = "Diagnostics (Trouble)";
    }
    {
      key = "xX";
      action = "Trouble diagnostics toggle filter.buf=0";
      desc = "Buffer Diagnostics (Trouble)";
    }
    {
      key = "xq";
      action = "Trouble qflist toggle";
      desc = "Quickfix List (Trouble)";
    }
  ];

in
{
  plugins = {
    trouble = {
      enable = true;
      settings = {
        auto_close = true;
        focus = true;
      };
    };

    web-devicons.enable = true;
  };
  inherit keymaps;
}
