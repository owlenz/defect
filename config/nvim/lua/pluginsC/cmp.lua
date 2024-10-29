local cmp = require('cmp')
local lsp_zero = require('lsp-zero')
local cmp_action = lsp_zero.cmp_action()

cmp.setup({
	sources = cmp.config.sources({
		{ name = 'nvim_lsp', max_item_count = 16 },
		{ name = 'buffer',   max_item_count = 5 },
		{ name = 'path',     max_item_count = 5 },
	}),
	preselect = cmp.PreselectMode.Item,
	window = {
		completion = {
			border = 'rounded',
			winhighlight = 'Normal:CmpPmenu,CursorLine:Visual,Search:None',
			max_height = 10,
		},
		documentation = {
			border = 'rounded',
			winhighlight = 'Normal:CmpDoc',
		},
	},
	mapping = cmp.mapping.preset.insert({
		-- `Enter` key to confirm completion
		['<CR>'] = cmp.mapping.confirm({ select = false }),

		-- Ctrl+Space to trigger completion menu
		['<C-Space>'] = cmp.mapping.complete(),

		-- Navigate between snippet placeholder
		['<C-f>'] = cmp_action.vim_snippet_jump_forward(),
		['<C-b>'] = cmp_action.vim_snippet_jump_backward(),

		-- Scroll up and down in the completion documentation
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
	}),
	snippet = {
		expand = function(args)
			vim.snippet.expand(args.body)
		end,
	},
})
