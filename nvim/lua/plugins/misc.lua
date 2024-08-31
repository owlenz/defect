return {
	{
		"xiyaowong/transparent.nvim",
		lazy = false,
		opts = {},
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			current_line_blame_opts = {
				virt_text_pos = 'overlay'
			}
		},
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
			require("which-key").register(
				{ ["<Leader>sc"] = { ":Silicon<CR>", "Screenshot Selected Code" } },
				{ mode = "v" }
			)
		end,
		config = function()
			require("silicon").setup({
				font = "JetBrainsMono Nerd Font=34;Noto Color Emoji=34",
			})
		end,
	},
	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {}
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
}
