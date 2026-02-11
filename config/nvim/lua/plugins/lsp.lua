local mason = {
	"williamboman/mason.nvim",
}

local masonlsp = {
	"williamboman/mason-lspconfig.nvim",
}

local lspconfig = {
	"neovim/nvim-lspconfig",
}

local lsp_zero = { 'VonHeikemen/lsp-zero.nvim', branch = 'v4.x' }

local trouble = {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
	},
}

return {
	lsp_zero,
	mason,
	masonlsp,
	lspconfig,
	trouble
}
