vim.g.mapleader = " "


--		neotree keymaps
vim.keymap.set("n", "<leader>e", function()
	require("neo-tree.command").execute({ toggle = true })
end, { desc = "Toggle NeoTree" })
