{
  flake.modules.homeManager.niri =
    { config, ... }:
    {
      programs.niri.settings.rules = with config.lib.niri.actions; {};};}
