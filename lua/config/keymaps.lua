vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

map("n", ";", ":")
map("n", "<leader>w", "<Cmd>write<CR>", { silent = true })
map("n", "<leader>q", "<Cmd>confirm bdelete<CR>", { silent = true })
map("n", "<C-q>", "<Cmd>confirm quit<CR>", { silent = true })
map("n", "<Tab>", "<Cmd>bnext<CR>", { silent = true })
map("n", "<S-Tab>", "<Cmd>bprevious<CR>", { silent = true })

-- Buffers, Windows, and Tabs
map("n", "<leader>bd", "<Cmd>confirm bdelete<CR>", { silent = true, desc = "Delete buffer" })
map("n", "<leader>bn", "<Cmd>bnext<CR>", { silent = true, desc = "Next buffer" })
map("n", "<leader>bp", "<Cmd>bprevious<CR>", { silent = true, desc = "Previous buffer" })
map("n", "<leader>bb", "<Cmd>buffer #<CR>", { silent = true, desc = "Alternate buffer" })

map("n", "<leader>sv", "<Cmd>vsplit<CR>", { silent = true, desc = "Split vertically" })
map("n", "<leader>sh", "<Cmd>split<CR>", { silent = true, desc = "Split horizontally" })
map("n", "<leader>se", "<C-w>=", { silent = true, desc = "Equalize window sizes" })
map("n", "<leader>sx", "<Cmd>close<CR>", { silent = true, desc = "Close window" })
map("n", "<C-Up>", "<Cmd>resize +2<CR>", { silent = true, desc = "Increase window height" })
map("n", "<C-Down>", "<Cmd>resize -2<CR>", { silent = true, desc = "Decrease window height" })
map("n", "<C-Left>", "<Cmd>vertical resize -2<CR>", { silent = true, desc = "Decrease window width" })
map("n", "<C-Right>", "<Cmd>vertical resize +2<CR>", { silent = true, desc = "Increase window width" })
map("n", "<leader>w<", "<Cmd>vertical resize -2<CR>", { silent = true, desc = "Decrease window width" })
map("n", "<leader>w>", "<Cmd>vertical resize +2<CR>", { silent = true, desc = "Increase window width" })
map("n", "<leader>w-", "<Cmd>resize -2<CR>", { silent = true, desc = "Decrease window height" })
map("n", "<leader>w+", "<Cmd>resize +2<CR>", { silent = true, desc = "Increase window height" })

map("n", "<leader>to", "<Cmd>tabnew<CR>", { silent = true, desc = "Open tab" })
map("n", "<leader>tn", "<Cmd>tabnext<CR>", { silent = true, desc = "Next tab" })
map("n", "<leader>tp", "<Cmd>tabprevious<CR>", { silent = true, desc = "Previous tab" })
map("n", "<leader>tx", "<Cmd>tabclose<CR>", { silent = true, desc = "Close tab" })
map("n", "<leader>tf", "<Cmd>tabfirst<CR>", { silent = true, desc = "First tab" })
map("n", "<leader>tl", "<Cmd>tablast<CR>", { silent = true, desc = "Last tab" })

map("n", "<Esc>", "<Esc><Cmd>noh<CR><Esc>", { silent = true })
map("n", "<CR>", "o<Esc>", { silent = true })
map("n", "<S-CR>", "O<Esc>", { silent = true })

map("n", "<leader>gd", "<Cmd>Gdiffsplit<CR>", { silent = true })
map("n", "<leader>gb", "<Cmd>Git blame<CR>", { silent = true })

map("n", "<C-h>", "<Cmd>TmuxNavigateLeft<CR>", { silent = true })
map("n", "<C-j>", "<Cmd>TmuxNavigateDown<CR>", { silent = true })
map("n", "<C-k>", "<Cmd>TmuxNavigateUp<CR>", { silent = true })
map("n", "<C-l>", "<Cmd>TmuxNavigateRight<CR>", { silent = true })

map("i", "<C-h>", "<C-\\><C-n><Cmd>TmuxNavigateLeft<CR>", { silent = true })
map("i", "<C-j>", "<C-\\><C-n><Cmd>TmuxNavigateDown<CR>", { silent = true })
map("i", "<C-k>", "<C-\\><C-n><Cmd>TmuxNavigateUp<CR>", { silent = true })
map("i", "<C-l>", "<C-\\><C-n><Cmd>TmuxNavigateRight<CR>", { silent = true })

map("n", "\\", "<leader>q", { remap = true, silent = true })

map("n", "<F2>", function()
	local search = vim.fn.getreg("/")
	vim.cmd([[silent! %s/\s\+$//e]])
	vim.fn.setreg("/", search)
end, { silent = true, desc = "Trim trailing spaces" })
