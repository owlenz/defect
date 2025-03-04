return {
	{
		"xiyaowong/transparent.nvim",
		lazy = false,
		opts = {},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},
	{ "windwp/nvim-ts-autotag" },
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = function()
			require('nvim-autopairs').setup {}
		end
	}
	,
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			notify = false
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{
		"michaelrommel/nvim-silicon",
		lazy = true,
		cmd = "Silicon",
		init = function()
			require("which-key").add({
				mode = { "v" },
				{ "<leader>s",  group = "Silicon" },
				{ "<leader>sc", function() require("nvim-silicon").clip() end,  desc = "Copy code screenshot to clipboard" },
				{ "<leader>sf", function() require("nvim-silicon").file() end,  desc = "Save code screenshot as file" },
				{ "<leader>ss", function() require("nvim-silicon").shoot() end, desc = "Create code screenshot" },
			})
		end,
		opts = {
			background = "#5F5F87",
			font = "BlexMono Nerd Font=34;Noto Color Emoji=34",
		}

	},
	-- {
	-- 	"akinsho/bufferline.nvim",
	-- 	dependencies = "nvim-tree/nvim-web-devicons",
	-- 	opts = {}
	-- },
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
}
