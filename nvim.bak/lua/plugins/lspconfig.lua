return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      gopls = {
        settings = {
          gopls = {
            hints = {
              assignVariableTypes = false,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = false,
              rangeVariableTypes = true,
            },
          },
        },
      },
    },
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
