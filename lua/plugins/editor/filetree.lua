require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		width = 32,
	},
	renderer = {
		group_empty = true,
		icons = {
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
		},
	},
	filters = {
		dotfiles = false,
	},
})

vim.keymap.set("n", "<leader>ex", "<Cmd>NvimTreeToggle<CR>", { silent = true, desc = "Toggle file tree" })
vim.keymap.set("n", "<leader>ef", "<Cmd>NvimTreeFindFile<CR>", { silent = true, desc = "Reveal file in tree" })
