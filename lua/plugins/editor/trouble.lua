require("trouble").setup({
	focus = true,
	icons = {
		indent = {
			middle = "│ ",
			last = "└─",
			top = "─",
		},
	},
})

local map = vim.keymap.set
map("n", "<leader>xx", "<Cmd>Trouble diagnostics toggle<CR>", { silent = true, desc = "Toggle diagnostics" })
map("n", "<leader>xr", "<Cmd>Trouble lsp_references toggle<CR>", { silent = true, desc = "Toggle references" })
map("n", "<leader>xs", "<Cmd>Trouble symbols toggle focus=false<CR>", { silent = true, desc = "Toggle symbols" })
