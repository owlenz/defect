{
  flake.modules.nixos.timetagger = { config, ... }: {
    sops.secrets.timetagger_env = { };

    virtualisation.oci-containers.containers = {
      timetagger = {
        image = "ghcr.io/almarklein/timetagger";
        ports = [ "9999:80" ];
        volumes = [
          "/var/lib/timetagger:/timetagger"
        ];
        environmentFiles = [ config.sops.secrets.timetagger_env.path ];
        environment = {
          TIMETAGGER_BIND = "0.0.0.0:80";
          TIMETAGGER_DATADIR = "/timetagger";
          TIMETAGGER_LOG_LEVEL = "info";
        };
      };
    };
  };
}
