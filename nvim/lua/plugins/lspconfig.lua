return {
  "neovim/nvim-lspconfig",
  opts = {
    -- servers = {
    --   tsserver = {
    --     on_attach = function(client)
    --       -- this is important, otherwise tsserver will format ts/js
    --       -- files which we *really* don't want.
    --       client.server_capabilities.documentFormattingProvider = false
    --     end,
    --   },
    --   -- biome = {
    --   --   on_attach = function(client)
    --   --     client.server_capabilities.diagnostics = false
    --   --   end,
    --   -- },
    -- },
    autoformat = true,
  },
}
