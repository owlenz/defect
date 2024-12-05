require 'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all" (the listed parsers MUST always be installed)
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "tsx",
		"bash",
		"html",
		"go",
		"javascript",
		"json",
		"lua",
		"markdown",
		"markdown_inline",
		"python",
		"query",
		"regex",
		"tsx",
		"typescript",
		"vim",
		"yaml",
		"typescript",
	},

	sync_install = false,
	auto_install = true,


	highlight = {
		enable = true,

		disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,

	},
}

vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

require('nvim-ts-autotag').setup({
  opts = {
    -- Defaults
    enable_close = true, -- Auto close tags
    enable_rename = true, -- Auto rename pairs of tags
    enable_close_on_slash = false -- Auto close on trailing </
  },
  -- Also override individual filetype configs, these take priority.
  -- Empty by default, useful if one of the "opts" global settings
  -- doesn't work well in a specific filetype
  -- per_filetype = {
  --   ["html"] = {
  --     enable_close = false
  --   }
  -- }
})
