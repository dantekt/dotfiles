return {{ 'romgrk/barbar.nvim',
	cond = vim.g.man ~= true,
	dependencies = { 'gitsigns.nvim', 'nvim-web-devicons' },
	dev = true,
	lazy = false,
	init = function(barbar)
		vim.g.barbar_auto_setup = false -- disable auto-setup

		--- @param bufnr integer
		--- @return boolean
		local function filter(bufnr)
			return vim.api.nvim_get_option_value('buflisted', {buf = bufnr})
		end

		vim.api.nvim_create_autocmd({'BufNewFile', 'BufReadPost', 'SessionLoadPost', 'TabNewEntered'}, {
			callback = function()
				if #vim.tbl_filter(filter, vim.api.nvim_list_bufs()) > 1 then
					require('lazy.core.loader').load(barbar, {cmd = 'Lazy load'})
					return true -- delete autocmd
				end
			end,
			group = 'config',
		})
	end,
	opts = function(_, o)
		o.animation = false
		o.auto_hide = true
		o.clickable = false
		o.focus_on_close = 'left'
		o.highlight_alternate = true
		o.icons =
		{
			button = false,
			current =
			{
				diagnostics = {{enabled = false}, {enabled = false}},
				gitsigns = {added = {enabled = false}, changed = {enabled = false}, deleted = {enabled = false}},
			},
			diagnostics = {{enabled = true, icon = ''}, {enabled = true, icon = ''}},
			gitsigns = {added = {enabled = true}, changed = {enabled = true}, deleted = {enabled = true}},
			modified = {button = false},
			pinned = {button = '', filename = true},
			preset = 'slanted',
		}
		o.maximum_padding = math.huge
	end,
}}
