
	

local masonConfig = function()
	local mason_lspconfig = require("mason-lspconfig")
	local lspconfig = require("lspconfig")

	mason_lspconfig.setup{
		  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
		ensure_installed = { "gopls", "lua_ls" },
		automatic_installation = true,
	}

	-- Configure individual LSP servers
	lspconfig.gopls.setup({
		settings = {
			gopls = {
				gofumpt = true,
				codelenses = {
					gc_details = false,
					generate = true,
					regenerate_cgo = true,
					run_govulncheck = true,
					test = true,
					tidy = true,
					upgrade_dependency = true,
					vendor = true,
				},
				hints = {
					assignVariableTypes = false,
					compositeLiteralFields = true,
					compositeLiteralTypes = true,
					constantValues = true,
					functionTypeParameters = true,
					parameterNames = false,
					rangeVariableTypes = true,
				},
				analyses = {
					fieldalignment = true,
					nilness = true,
					unusedparams = true,
					unusedwrite = true,
					useany = true,
				},
				usePlaceholders = true,
				completeUnimported = true,
				staticcheck = true,
				directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
				semanticTokens = true,
			},
		},
	})
end

local mason = {
	"williamboman/mason.nvim",
}

local masonlsp = {
	"williamboman/mason-lspconfig.nvim",
}

local lspconfig = {
	"neovim/nvim-lspconfig",
}

local lsp_zero = {'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'}


return {
	lsp_zero,
	mason,
	masonlsp,
	lspconfig,
}
