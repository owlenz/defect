{
  flake.modules.homeManager.niri =
    { config, ... }:
    {
      programs.niri.settings.binds = with config.lib.niri.actions; {
        "Mod+Q".action = spawn "foot";
        "Mod+E".action = spawn "nautilus";
        "Mod+R".action = spawn "fuzzel";
        "Mod+W".action = spawn-sh "hyprpicker | tail -c +1 | head -c -1 | wl-copy";
        "Mod+V".action = toggle-window-floating;
        "Mod+C".action = close-window;
        "Mod+Alt+L".action = spawn "swaylock";

        XF86AudioRaiseVolume = {
          allow-when-locked = true;
          action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+";
        };
        XF86AudioLowerVolume = {
          allow-when-locked = true;
          action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-";
        };
        XF86AudioMute = {
          allow-when-locked = true;
          action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle";
        };

        "Mod+K".action = focus-window-or-workspace-up;
        "Mod+H".action = focus-column-left;
        "Mod+J".action = focus-window-or-workspace-down;
        "Mod+L".action = focus-column-right;

        "Mod+Shift+K".action = move-column-to-workspace-up;
        "Mod+Shift+H".action = move-column-left;
        "Mod+Shift+J".action = move-column-to-workspace-down;
        "Mod+Shift+L".action = move-column-right;

        "Mod+F".action = maximize-column;
        "Mod+Shift+F".action = fullscreen-window;
      };
    };
}

# $mainMod = SUPER
# # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
# bind = $mainMod, Q, exec, foot
# bind = $mainMod, C, killactive, 
# bind = $mainMod, M, exit, 
# bind = $mainMod, E, exec, nautilus 
# bind = $mainMod, V, togglefloating, 
# bind = $mainMod, W, exec, hyprpicker | tail -c +1 | head -c -1 | wl-copy
# bind = $mainMod, R, exec, fuzzel 
# bind = $mainMod, P, pseudo, # dwindle
# bind = $mainMod, F, fullscreen
# bind = $mainMod, J, togglesplit,
# bind = , Print, exec, grim -g "$(slurp)"
# bind = SHIFT, Print, exec, grim -g "$(slurp)" - | wl-copy
# bind = $mainMod, Print, exec, grim -g "$(slurp)" - | feh 

# # Move focus with mainMod + arrow keys
# bind = $mainMod, left, movefocus, l
# bind = $mainMod, right, movefocus, r
# bind = $mainMod, up, movefocus, u
# bind = $mainMod, down, movefocus, d
