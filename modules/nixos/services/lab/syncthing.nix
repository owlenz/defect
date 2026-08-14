{ ... }:
{
  flake.modules.nixos.syncthing = { ... }: {
    services.syncthing = {
      enable = true;
      user =  "owlenz";
      group = "users";
      openDefaultPorts = true;
      settings.gui = {
        user = "owlenz";
        password = "1234";
      };
    };
  };
}
