{ lib, ... }:
let
  utils = import ./lib/utils.nix { inherit lib; };
  buffers = map utils.mkKeymap [
    {
      key = "bd";
      action = "bdelete";
      desc = "Kill Current Buffer";
    }
  ];

  search = map utils.mkKeymap [
    {
      leaderKey = false;
      key = "<Esc>";
      action = "noh";
      desc = "Clear Search Highlight";
    }
  ];

  lines = map utils.mkKeymap [
    {
      leaderKey = false;
      mode = "n";
      key = "<A-j>";
      action = "m .+1<CR>==";
      desc = "Move line down";
    }
    {
      leaderKey = false;
      mode = "n";
      key = "<A-k>";
      action = "m .-2<CR>==";
      desc = "Move line up";
    }
    {
      leaderKey = false;
      mode = "v";
      key = "<A-j>";
      action = "m '>+1<CR>gv=gv";
      desc = "Move selection down";
    }
    {
      leaderKey = false;
      mode = "v";
      key = "<A-k>";
      action = "m '<-2<CR>gv=gv";
      desc = "Move selection up";
    }
  ];

in
{
  globals = {
    mapleader = utils.leaderKey;
  };
  keymaps = [
  ]
  ++ buffers
  ++ search
  ++ lines;
}
