{ lib, ... }: rec {
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
      leaderKey ? true,
    }:
    {
      inherit mode;
      key = if leaderKey then leader key else key;
      action = actionCmd action;
      options = {
        inherit desc;
        silent = true;
      }
      // opts;
    };
}
