{
  flake.modules.nixos.docker =
    { pkgs, inputs, ... }:
    {
      hardware.nvidia-container-toolkit.enable = true;
      # port forwarding
      boot.kernel.sysctl."net.ipv4.ip_forward" = 1;
      virtualisation.docker = {
        enable = true;
        rootless.enable = false;
        daemon.settings = {
          features.cdi = true;
          dns = [
            "1.1.1.1"
            "8.8.8.8"
          ];
          registry-mirrors = [ "https://mirror.gcr.io" ];
        };
      };
      users.users.owlenz = {
        extraGroups = [ "docker" ];
      };
    };
}
