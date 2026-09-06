require("ibl").setup({
	indent = {
		char = "│",
		tab_char = "│",
		highlight = "IblIndent",
	},
	scope = {
		enabled = true,
		show_start = true,
		show_end = false,
		highlight = "IblScope",
	},
	whitespace = {
		remove_blankline_trail = false,
	},
})

vim.keymap.set("n", "<leader>ui", "<Cmd>IBLEnable<CR>", { silent = true, desc = "Enable indent guides" })
vim.keymap.set("n", "<leader>uI", "<Cmd>IBLDisable<CR>", { silent = true, desc = "Disable indent guides" })
