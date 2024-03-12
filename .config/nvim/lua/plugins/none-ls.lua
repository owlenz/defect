return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    local biome = require("null-ls").builtins.formatting.biome.with({
      command = "biome",
    })
    opts.sources = vim.list_extend(opts.sources or {}, {
      biome,
    })
  end,
}
