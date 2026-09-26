{
  flake.modules.homeManager.noctalia =
    { inputs, ... }:
    {
      imports = [
        inputs.noctalia.homeModules.default
      ];

      programs.noctalia = {
        enable = true;
        settings = {
          dock = {
            active_monitor_only = true;
            enabled = false;
            launcher_icon = "noctalia";
            magnification_scale = 1.3;
            pinned = [
              "helium"
              "obsidian"
              "spotify"
              "vesktop"
              "nautilus"
              "steam"
              "org.pwmt.zathura"
            ];
            reserve_space = false;
            show_dots = true;
            smart_auto_hide = true;
          };

          location.auto_locate = true;
          weather.auto_locate = true;

          bar.default = {
            margin_ends = 0;
            padding = 10;
            radius = 0;
            center = [ "media" ];
            end = [
              "tray"
              "volume"
              "clock"
            ];
            start = [
              "workspaces"
              "lid-guard"
              "led"
            ];
          };
          widget.workspaces = {
            hide_when_empty = true;
            style = "minimal";
            font_weight = "Bold";
            occupied_color = "on_surface_variant";
          };

          shell = {
            avatar_path = "/home/owlenz/Pictures/asa_2.jpg";
            niri_overview_type_to_launch_enabled = true;
            screen_time_enabled = true;
            telemetry_enabled = false;

            launcher = {
              categories = false;
              session_search = true;
            };
            panel = {
              open_near_click_clipboard = true;
              transparency_mode = "soft";
            };
          };

          audio.enable_override = true;

          wallpaper = {
            enabled = true;
            directory = "/home/owlenz/Pictures/wallpapers";
            default = {
              path = "/home/owlenz/Pictures/wallpapers/tongues.png";
            };
          };
          backdrop = {
            enabled = true;
            blur_intensity = 0.5;
            tint_intensity = 0.3;
          };
        };
      };
    };
}
