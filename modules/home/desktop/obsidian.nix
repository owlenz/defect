{
  flake.modules.homeManager.obsidian = { ... }: {
    programs.obsidian = {
      enable = true;
      defaultSettings = {
        # themes.nord.enable = true;
        communityPlugins = {
          self-hosted-livesync.enable = true;
        };
      };
    };
  };
}
