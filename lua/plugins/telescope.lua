local telescope = require("telescope")

telescope.setup({
	defaults = {
		layout_strategy = "horizontal",
		layout_config = {
			prompt_position = "top",
			preview_width = 0.55,
		},
		sorting_strategy = "ascending",
		file_ignore_patterns = { "%.git/", "node_modules/" },
	},
})

local builtin = require("telescope.builtin")
local map = vim.keymap.set

map("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
