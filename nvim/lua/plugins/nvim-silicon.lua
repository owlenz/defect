local plugin = {
  "michaelrommel/nvim-silicon",
  lazy = true,
  cmd = "Silicon",
  init = function()
    require("which-key").register({ ["<Leader>sc"] = { ":Silicon<CR>", "Screenshot Selected Code" } }, { mode = "v" })
  end,
  config = function()
    require("silicon").setup({
      font = "JetBrainsMono Nerd Font=34;Noto Color Emoji=34",
    })
  end,
}

return plugin
