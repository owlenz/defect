{
  flake.modules.nixos.dm =
    { ... }:
    {
      services.displayManager.ly = {
        enable = false;
      };
      services.displayManager.gdm.enable = true;
    };
}
