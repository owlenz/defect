{
  config,
  inputs,
  ...
}:
{

  flake.modules.nixos.nix =
    { ... }:
    {
      nix.settings = {
        substituters = [
          "https://cache.nixos.org"
          "https://kopuz.cachix.org"
        ];
        trusted-public-keys = [
          "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
          "kopuz.cachix.org-1:J2X3AnAYhKTJW5S3aCLoA1ckonQXVNZMQvhZA0YAufw="
        ];
      };
    };
}
