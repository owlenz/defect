let
  leaderKey = " ";
  n = "n";
  actionCmd = cmd: "<cmd>${cmd}<CR>";
  leader = keys: "<leader>${keys}";
  mkKeymap =
    {
      key,
      action,
      desc,
      mode ? n,
      opts ? { },
    }:
    {
      mode = n;
      key = leader key;
      action = actionCmd action;
      options = {
        inherit desc;
        silent = true;
      }
      // opts;
    };

  telescope = map mkKeymap [
    {
      key = "ff";
      action = "Telescope find_files";
      desc = "Find Files";
    }
    {
      key = "fd";
      action = "lua require('telescope.builtin').find_files({ find_command = { 'fd', '--type', 'd' } })";
      desc = "Find Directories";
    }
    {
      key = "/";
      action = "Telescope live_grep";
      desc = "Live grep";
    }
    {
      key = "bb";
      action = "Telescope buffers";
      desc = "Buffers";
    }
  ];

in
{
  globals = {
    mapleader = leaderKey;
  };
  keymaps = [

  ]
  ++ telescope;
}
