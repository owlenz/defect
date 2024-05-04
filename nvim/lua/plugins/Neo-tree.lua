return {
  "nvim-neo-tree/neo-tree.nvim",
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            "node_modules",
          },
        },
      },
      window = {
        position = "float",
        width = "40",
      },
      buffers = {
        group_empty_dirs = false,
      },
    })
  end,
}
