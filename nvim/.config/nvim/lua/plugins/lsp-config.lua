-- combined configuration for
-- mason which manages LSP, DSPs and formatters
-- mason-lspconfig bridges mason with lspconfig-
-- nvim-lspconfig sets up the communication between the 2

return {
	-- mason
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	-- mason-lspconfig
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup(
				-- ensure LSPs are installed
				{
					ensure_installed = { "lua_ls" },
				}
			)
		end,
	},
	-- nvim-lspconfig
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Setup language servers
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.bashls.setup({})
			lspconfig.html.setup({})
			lspconfig.pyright.setup({})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
