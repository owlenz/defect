{
  flake.modules.nixos.udev = { config, pkgs, ... }: {

    # services.tuned.enable = true;

    users.groups.leds = { };
    users.groups.fan_ctl = { };
    users.groups.battery_ctl = { };
    users.users.owlenz.extraGroups = [
      "leds"
      "fan_ctl"
      "battery_ctl"
    ];

    boot.extraModprobeConfig = ''
      options thinkpad_acpi fan_control=1
    '';
    services.udev.extraRules = ''

      ACTION=="add|change", SUBSYSTEM=="leds", KERNEL=="tpacpi::lid_logo_dot", \
          RUN+="${pkgs.coreutils}/bin/chown root:leds /sys/class/leds/tpacpi::lid_logo_dot/brightness", \
          RUN+="${pkgs.coreutils}/bin/chmod 0660 /sys/class/leds/tpacpi::lid_logo_dot/brightness"

      ACTION=="add|bind", SUBSYSTEM=="platform", DRIVER=="thinkpad_acpi", RUN+="${pkgs.coreutils}/bin/chgrp fan_ctl /proc/acpi/ibm/fan", RUN+="${pkgs.coreutils}/bin/chmod 0664 /proc/acpi/ibm/fan"

      ACTION=="add|change", SUBSYSTEM=="power_supply", KERNEL=="BAT*", RUN+="${pkgs.coreutils}/bin/chgrp battery_ctl /sys$devpath/charge_control_end_threshold", RUN+="${pkgs.coreutils}/bin/chmod 0664 /sys$devpath/charge_control_end_threshold"
    '';

  };
}
