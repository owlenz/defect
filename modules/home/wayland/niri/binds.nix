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
          action = spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+";
        };
        XF86AudioLowerVolume = {
          allow-when-locked = true;
          action = spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";
        };
        XF86AudioMute = {
          allow-when-locked = true;
          action = spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        };

        XF86AudioPlay = {
          allow-when-locked = true;
          action = spawn-sh "playerctl play-pause";
        };
        XF86AudioStop = {
          allow-when-locked = true;
          action = spawn-sh "playerctl stop";
        };
        XF86AudioPrev = {
          allow-when-locked = true;
          action = spawn-sh "playerctl previous";
        };
        XF86AudioNext = {
          allow-when-locked = true;
          action = spawn-sh "playerctl next";
        };

        "Print".action.screenshot = { show-pointer = false; };
        "Mod+Print".action.screenshot-screen = { show-pointer = false; };
        # "Ctrl+Print".action = screenshot-screen;
        # "Alt+Print".action = screenshot-window; 

        "Mod+Shift+E".action.spawn = ["niri" "msg" "action" "quit"];

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

        "Mod+X".action = center-column;

       "Mod+Minus".action = set-column-width "-10%";
       "Mod+Equal".action = set-column-width "+10%";

        ## workspaces
        "Mod+1".action = focus-workspace 1;
        "Mod+2".action = focus-workspace 2;
        "Mod+3".action = focus-workspace 3;
        "Mod+4".action = focus-workspace 4;
        "Mod+5".action = focus-workspace 5;
        "Mod+6".action = focus-workspace 6;
        "Mod+7".action = focus-workspace 7;
        "Mod+8".action = focus-workspace 8;
        "Mod+9".action = focus-workspace 9;
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
