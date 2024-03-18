return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    local none = require("null-ls")
    local biome = none.builtins.formatting.biome.with({
      command = "biome",
    })
    opts.sources = vim.list_extend(opts.sources or {}, {
      biome,
      none.builtins.diagnostics.tidy,
    })
  end,
}
