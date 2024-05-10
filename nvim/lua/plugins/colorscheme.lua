return {
  {
    "rebelot/kanagawa.nvim",
  },
  {
    "cocopon/iceberg.vim",
  },
  {
    "jesseleite/nvim-noirbuddy",
    name = "noirbuddy",
    dependencies = {
      { "tjdevries/colorbuddy.nvim" },
    },
    -- lazy = false,
    -- priority = 1000,
    opts = {
      preset = "miami-nights",
    },
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "noirbuddy",
    },
  },
}
