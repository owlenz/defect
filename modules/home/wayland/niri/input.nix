{
  flake.modules.homeManager.niri = {
    programs.niri.settings.input = {
      focus-follows-mouse.enable = true;
      keyboard = {
        numlock = true;
        xkb = {
          layout = "us,eg";
          # variant = "colemak_dh_ortho";
          options = "grp:alt_shift_toggle";
        };
      };
    };
  };
}
