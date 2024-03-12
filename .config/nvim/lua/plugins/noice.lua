return {
  "folke/noice.nvim",
  config = function()
    require("noice").setup({
      views = {
        cmdline_popup = {
          border = {
            style = "none",
            padding = { 1, 2 },
          },
          filter_options = {},
          win_options = {
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
          },
        },
      },
    })
  end,
}
