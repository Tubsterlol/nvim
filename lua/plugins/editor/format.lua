local conform = require("conform")

conform.setup({
	formatters_by_ft = {
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

vim.api.nvim_create_user_command("Format", function()
	conform.format({ async = true, lsp_format = "fallback" })
end, { desc = "Format current buffer" })
