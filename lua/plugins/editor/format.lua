local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		c = { "clang_format" },
		css = { "prettier" },
		html = { "prettier" },
		javascript = { "prettier" },
		json = { "prettier" },
		lua = { "stylua" },
		markdown = { "prettier" },
		python = { "ruff_format" },
		rust = { "rustfmt" },
	},
	format_on_save = {
		timeout_ms = 2000,
		lsp_format = "fallback",
	},
})

vim.keymap.set("n", "<leader>s", function()
	conform.format({ async = true, lsp_format = "fallback" })
end, { silent = true, desc = "Format buffer" })
