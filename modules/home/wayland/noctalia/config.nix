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
            enabled = true;
            launcher_icon = "noctalia";
            magnification_scale = 1.3;
            pinned = [
              "helium"
              "obsidian"
              "kopuz"
              "vesktop"
              "files"
              "krita"
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
            center = [ "media" ];
            end = [
              "tray"
              "notifications"
              "clipboard"
              "bluetooth"
              "volume"
              "control-center"
            ];
            start = [ "workspaces" ];
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
