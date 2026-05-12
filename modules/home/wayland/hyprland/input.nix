{
  flake.modules.homeManager.hyprland = {
    wayland.windowManager.hyprland.settings = {
      input = {
        kb_layout = "us,eg";
        kb_variant = "";
        kb_model = "";
        kb_options = "grp:alt_shift_toggle";
        kb_rules = "";
        follow_mouse = 1;
        sensitivity = 0;

        touchpad = {
          natural_scroll = false;
        };
      };
    };
  };
}
