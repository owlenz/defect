{
  flake.modules.nixos.docker =
    { pkgs, inputs, ... }:
    {
      hardware.nvidia-container-toolkit.enable = true;
      # port forwarding
      boot.kernel.sysctl."net.ipv4.ip_forward" = 1;
      virtualisation.docker = {
        enable = false;
        rootless = {
          enable = true;
          setSocketVariable = true;
          daemon.settings = {
            features.cdi = true;
            dns = [
              "1.1.1.1"
              "8.8.8.8"
            ];
            registry-mirrors = [ "https://mirror.gcr.io" ];
          };
        };
      };
    };
}
