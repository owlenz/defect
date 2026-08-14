{ lib, ... }: {
  plugins = {
    lsp = {
      enable = true;
      servers = {
        # taplo.enable = true;
        bashls.enable = true;
        nil_ls.enable = true;
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
    };
  };
}
