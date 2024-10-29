return {
	{
		"rebelot/kanagawa.nvim",
	},
	{
		"cocopon/iceberg.vim",
	},
	{
		"jesseleite/nvim-noirbuddy",
		dependencies = {
			{ "tjdevries/colorbuddy.nvim" },
		},
		lazy = false,
		priority = 10,
	},
	{
		"maxmx03/fluoromachine.nvim"
	},
	{
		"EdenEast/nightfox.nvim",
		priority = 1000
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "kanagawa",
		},
	},
}
