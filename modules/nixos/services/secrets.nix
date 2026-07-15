{
  flake-file.inputs.sops-nix.url = "github:Mic92/sops-nix";

  flake.modules.nixos.secrets =
    { pkgs, inputs, ... }:
    {
      imports = [ inputs.sops-nix.nixosModules.sops ];
      environment.systemPackages = with pkgs; [
        sops
      ];
      sops.defaultSopsFile = ../../../secrets/secrets.yaml;
      sops.age.keyFile = "/home/owlenz/.config/sops/age/keys.txt";
      sops.secrets."vaultwarden/admin_token" = {};
    };
}
