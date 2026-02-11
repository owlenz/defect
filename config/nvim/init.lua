vim.g.bigfile_size = 1000000
vim.highlight.on_yank { higroup = 'Visual', timeout = 300 }
vim.g.mapleader = " "

require("core.lazy")
require("core.keymaps")
require("core.defaults")
require("pluginsC")

require("oil").setup()
-- require("custom")
vim.cmd.colorscheme("violetdream")
