require("oil").setup({
	default_file_explorer = false,
	delete_to_trash = true,
	view_options = {
		show_hidden = true,
	},
	float = {
		padding = 2,
		max_width = 100,
		max_height = 30,
		border = "rounded",
	},
})

vim.keymap.set("n", "<leader>eo", "<Cmd>Oil<CR>", { silent = true, desc = "Open Oil" })
