{ ... }: {
  plugins = {
    lsp = {
      enable = true;
      servers = {
        # taplo.enable = true;
        bashls.enable = true;
        nil_ls.enable = true;
        # nixd = {
        #   enable = true;
        #   settings = {
        #     nixpkgs.expr = "import <nixpkgs> { }";
        #     formatting.command = [ "nixfmt" ];
        #     options = {
        #       nixos.expr = ''(builtins.getFlake "/path/to/your/flake").nixosConfigurations.HOSTNAME.options'';
        #       # if you also use home-manager:
        #       home_manager.expr = ''(builtins.getFlake "/path/to/your/flake").homeConfigurations.USERNAME.options'';
        #     };
        #   };
        # };
        hls = {
          enable = true;
          # installGhc = false;
          package = null;
        };
        gopls = {
          enable = true;
          package = null;
        };
        rust_analyzer = {
          enable = true;
          package = null;
          installCargo = false;
          installRustc = false;
        };
        pyright = {
          enable = true;
          package = null;
        };
      };
      keymaps.lspBuf = {
        "<F2>" = "rename";
        K = "hover";
        gd = "definition";
        gD = "declaration";
        gr = "references";
        "<F4>" = "code_action";
      };
    };
  };
}
