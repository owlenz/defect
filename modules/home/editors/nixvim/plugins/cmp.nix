{
  plugins.cmp = {
    enable = true;
    autoEnableSources = true;
    settings = {
      sources = [
        {
          name = "nvim_lsp";
          # max_item_count = 15;
        }
        {
          name = "path";
          # max_item_count = 5;
        }
        # {
        #   name = "buffer";
        #   # max_item_count = 5;
        # }
      ];
      # completion = {
      #   autocomplete = true;
      # };

      window = {
        completion = {
          # border = "rounded";
          winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenu,CursorLine:Visual,Search:None";
          # max_height = 10;
        };
        documentation = {
          winhighlight = "Normal:CmpDoc,FloatBorder:CmpDoc";
        };
      };
      mapping = {
        # -- `Enter` key to confirm completion
        "<CR>" = "cmp.mapping.confirm({ select = false })";

        # -- Meta+Tab to trigger completion menu
        "<M-Tab>" = "cmp.mapping.complete()";

        # Scroll up and down in the completion items
        "<M-j>" = "cmp.mapping.select_next_item()";
        "<M-k>" = "cmp.mapping.select_prev_item()";

        # -- Scroll up and down in the completion documentation
        "<M-u>" = "cmp.mapping.scroll_docs(-4)";
        "<M-d>" = "cmp.mapping.scroll_docs(4)";
      };
    };
  };

}
