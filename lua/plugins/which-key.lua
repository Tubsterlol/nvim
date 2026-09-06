local which_key = require("which-key")

which_key.setup({
	preset = "modern",
	delay = 300,
})

which_key.add({
	{ "<leader>b", group = "Buffers" },
	{ "<leader>d", group = "Debug" },
	{ "<leader>e", group = "Explorer" },
	{ "<leader>f", group = "Find" },
	{ "<leader>g", group = "Git" },
	{ "<leader>h", group = "Harpoon" },
	{ "<leader>n", group = "New" },
	{ "<leader>o", group = "Tasks" },
	{ "<leader>s", group = "Splits" },
	{ "<leader>t", group = "Tabs" },
	{ "<leader>x", group = "Diagnostics" },
})
