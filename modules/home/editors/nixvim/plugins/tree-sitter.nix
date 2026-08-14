{ config, ... }: {
  plugins.treesitter = {
    enable = true;
    highlight.enable = true;
    indent.enable = true;
    folding.enable = true;
    grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
      bash
      json
      lua
      toml
      nix
      make
      markdown
      just
      yaml
      dockerfile
      go
      rust
      regex
      c
      tsx
      typescript
    ];

  };

}
