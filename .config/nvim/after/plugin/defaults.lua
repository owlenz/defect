vim.cmd.colorscheme 'kanagawa'

local map = vim.keymap.set

map('n', '<C-f>', '<cmd>NvimTreeToggle<cr>', { desc = 'Toggle Nvim Tree Window' })
