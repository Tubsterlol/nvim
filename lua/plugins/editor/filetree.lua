local api = require("nvim-tree.api")

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
	on_attach = function(buffer)
		api.config.mappings.default_on_attach(buffer)
		vim.keymap.set("n", "<leader>nc", api.fs.create, {
			buffer = buffer,
			silent = true,
			desc = "Create file or directory (end directory with /)",
		})
	end,
})

vim.keymap.set("n", "<leader>ex", "<Cmd>NvimTreeToggle<CR>", { silent = true, desc = "Toggle file tree" })
vim.keymap.set("n", "<leader>ef", "<Cmd>NvimTreeFindFile<CR>", { silent = true, desc = "Reveal file in tree" })
