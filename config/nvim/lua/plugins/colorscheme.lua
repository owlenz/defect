return {
	{
		"rebelot/kanagawa.nvim",
	},
	{
		"cocopon/iceberg.vim",
	},
	{ "tjdevries/colorbuddy.nvim" },
	{
		"owlenz/violetdream.nvim",
		lazy = false,
		priority = 10000,
		dependencies = {
			{ "tjdevries/colorbuddy.nvim" },
		},
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
}
