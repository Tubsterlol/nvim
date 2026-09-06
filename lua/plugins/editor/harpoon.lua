local harpoon = require("harpoon")

harpoon:setup()

local map = vim.keymap.set
local list = harpoon:list()

map("n", "<leader>ha", function()
	list:add()
end, { silent = true, desc = "Harpoon add file" })

map("n", "<leader>hm", function()
	harpoon.ui:toggle_quick_menu(list)
end, { silent = true, desc = "Harpoon menu" })

map("n", "<leader>h1", function()
	list:select(1)
end, { silent = true, desc = "Harpoon file 1" })

map("n", "<leader>h2", function()
	list:select(2)
end, { silent = true, desc = "Harpoon file 2" })

map("n", "<leader>h3", function()
	list:select(3)
end, { silent = true, desc = "Harpoon file 3" })

map("n", "<leader>h4", function()
	list:select(4)
end, { silent = true, desc = "Harpoon file 4" })
