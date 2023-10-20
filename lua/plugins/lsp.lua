local border = {
	{ "┏", "FloatBorder" },
	{ "━", "FloatBorder" },
	{ "┓", "FloatBorder" },
	{ "┃", "FloatBorder" },
	{ "┛", "FloatBorder" },
	{ "━", "FloatBorder" },
	{ "┗", "FloatBorder" },
	{ "┃", "FloatBorder" },
}

local keybinds = function()
	vim.keymap.set('n', '<LEADER>n', vim.diagnostic.goto_next)
	vim.keymap.set('n', '<LEADER>p', vim.diagnostic.goto_prev)
	vim.keymap.set('n', '<LEADER>r', vim.lsp.buf.rename)
	vim.keymap.set('n', '<LEADER>a', vim.lsp.buf.code_action)
	vim.keymap.set('n', '<LEADER>k', vim.lsp.buf.hover)
	vim.keymap.set('n', '<LEADER>K', vim.diagnostic.open_float)
	vim.keymap.set('n', '<C-]>', vim.lsp.buf.definition)

	-- toggle lsp diagnostics
	vim.keymap.set('n', '<LEADER>d',
		function()
			if vim.g.visible_diagnostics then
				vim.diagnostic.disable()
				vim.g.visible_diagnostics = false
			else
				vim.diagnostic.enable()
				vim.g.visible_diagnostics = true
			end
		end
	)
end

return {
	{
		"williamboman/mason-lspconfig",
		dependencies = {
			"nvim-treesitter",
			{
				"williamboman/mason.nvim",
				build = ":MasonUpdate",
				config = function()
					require("mason").setup()
				end,
			},
		},
		version = "1.3.0",
		config = function()
			require("mason-lspconfig").setup({
				automatic_installation = false,
				ensure_installed = {},
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		lazy = false,
		dependencies = {
			"mason-lspconfig",
			"nvim-cmp",
			"nvim-treesitter",
			"Maan2003/lsp_lines.nvim",
		},
		config = function()
			-- servers to setup
			local lsp = require("lspconfig")

			-- diagnostic settings
			vim.lsp.diagnostics = {
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = { reverse = false },
			}

			-- don't override treesitter colors
			vim.highlight.priorities.semantic_tokens = 95

			-- custom signs
			local signs = { Error = ">>", Warn = "> ", Hint = "- ", Info = "* " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end

			local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
			function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
				opts = opts or {}
				opts.border = opts.border or border
				return orig_util_open_floating_preview(contents, syntax, opts, ...)
			end

			-- auto format code on save
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = { "*" },
				callback = function()
					vim.lsp.buf.format()
				end,
			})
		end,
	},
    
    {
        'JuliaEditorSupport/julia-vim',
        event = { "BufReadPost *.jl" },
    },
}
