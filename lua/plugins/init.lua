vim.pack.add({
	"https://www.github.com/echasnovski/mini.nvim",
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/akinsho/bufferline.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://www.github.com/nvim-tree/nvim-tree.lua",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/mfussenegger/nvim-lint",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/stevearc/overseer.nvim",
	"https://github.com/lukas-reineke/indent-blankline.nvim",
	"https://github.com/mfussenegger/nvim-dap",
	"https://github.com/rcarriga/nvim-dap-ui",
	"https://github.com/nvim-neotest/nvim-nio",
	"https://github.com/folke/trouble.nvim",
	"https://github.com/folke/which-key.nvim",
	{
		src = "https://github.com/ThePrimeagen/harpoon",
		branch = "harpoon2",
	},
	"https://github.com/tpope/vim-fugitive",
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
	},
	"https://www.github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("1.*"),
	},
	"https://github.com/mrcjkb/rustaceanvim",
}, { confirm = false })

require("lualine").setup({
	options = {
		globalstatus = true,
		section_separators = "",
		component_separators = "|",
		icons_enabled = true,
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { { "filename", path = 1 } },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})

require("bufferline").setup({
	options = {
		mode = "buffers",
		always_show_bufferline = true,
		show_buffer_close_icons = true,
		show_close_icon = false,
		separator_style = "slant",
		diagnostics = "nvim_lsp",
		offsets = {{
			filetype = "NvimTree",
			text = "Files",
			text_align = "left",
			separator = true,
		}},
	},
})

require("oil").setup({
	default_file_explorer = false,
	delete_to_trash = true,
	view_options = { show_hidden = true },
	float = {
		padding = 2,
		max_width = 100,
		max_height = 30,
		border = "rounded",
	},
})
vim.keymap.set("n", "<leader>eo", "<Cmd>Oil<CR>", { silent = true, desc = "Open Oil" })

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

require("overseer").setup()
local dap = require("dap")
local dapui = require("dapui")
dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
map("n", "<leader>oo", "<Cmd>OverseerToggle<CR>", { silent = true, desc = "Toggle task panel" })
map("n", "<leader>or", "<Cmd>OverseerRun<CR>", { silent = true, desc = "Run task" })
map("n", "<leader>oc", "<Cmd>OverseerClose<CR>", { silent = true, desc = "Close task panel" })
map("n", "<leader>dc", dap.continue, { silent = true, desc = "Continue debugging" })
map("n", "<leader>db", dap.toggle_breakpoint, { silent = true, desc = "Toggle breakpoint" })
map("n", "<leader>dn", dap.step_over, { silent = true, desc = "Step over" })
map("n", "<leader>di", dap.step_into, { silent = true, desc = "Step into" })
map("n", "<leader>do", dap.step_out, { silent = true, desc = "Step out" })
map("n", "<leader>dx", dap.terminate, { silent = true, desc = "Terminate debugging" })
map("n", "<leader>du", dapui.toggle, { silent = true, desc = "Toggle debug UI" })

require("ibl").setup({
	indent = {
		char = "│",
		tab_char = "│",
		highlight = "IblIndent",
	},
	scope = { enabled = true, show_start = true, show_end = false, highlight = "IblScope" },
	whitespace = { remove_blankline_trail = false },
})
map("n", "<leader>ui", "<Cmd>IBLEnable<CR>", { silent = true, desc = "Enable indent guides" })
map("n", "<leader>uI", "<Cmd>IBLDisable<CR>", { silent = true, desc = "Disable indent guides" })

local which_key = require("which-key")
which_key.setup({ preset = "modern", delay = 300 })
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

require("blink.cmp").setup({
	keymap = { preset = "default" },
	appearance = { nerd_font_variant = "mono" },
	completion = {
		documentation = { auto_show = true, auto_show_delay_ms = 200 },
		ghost_text = { enabled = true },
	},
	sources = { default = { "lsp", "path", "snippets", "buffer" } },
	signature = { enabled = true },
})

local servers = { "lua_ls", "pyright", "rust_analyzer" }
local capabilities = require("blink.cmp").get_lsp_capabilities()
vim.lsp.config("*", { capabilities = capabilities })
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			workspace = { checkThirdParty = false },
		},
	},
})
require("mason").setup()
require("mason-lspconfig").setup({ ensure_installed = servers, automatic_enable = false })
vim.lsp.enable(servers)

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("LspConfig", { clear = true }),
	callback = function(args)
		local map = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = args.buf, silent = true, desc = desc })
		end
		map("n", "<leader>ld", vim.lsp.buf.definition, "Go to definition")
		map("n", "<leader>lr", vim.lsp.buf.references, "List references")
		map("n", "<leader>la", vim.lsp.buf.code_action, "Code action")
		map("n", "<leader>lh", vim.lsp.buf.hover, "Show hover documentation")
		map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
	end,
})

local treesitter = require("nvim-treesitter")
treesitter.setup({})
local ensure_installed = { "vim", "vimdoc", "rust", "json", "lua", "markdown", "python", "bash" }
local config = require("nvim-treesitter.config")
local installed = config.get_installed()
local to_install = {}
for _, parser in ipairs(ensure_installed) do
	if not vim.tbl_contains(installed, parser) then
		table.insert(to_install, parser)
	end
end
if #to_install > 0 then
	treesitter.install(to_install)
end
local group = vim.api.nvim_create_augroup("TreeSitterConfig", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = group,
	callback = function(args)
		local lang = vim.treesitter.language.get_lang(args.match)
		if lang and vim.list_contains(config.get_installed(), lang) then
			vim.treesitter.start(args.buf)
		end
	end,
})

local api = require("nvim-tree.api")
require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = { width = 32 },
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
	filters = { dotfiles = false },
	on_attach = function(buffer)
		api.config.mappings.default_on_attach(buffer)
		vim.keymap.set("n", "<leader>nc", api.fs.create, { buffer = buffer, silent = true, desc = "Create file or directory (end directory with /)" })
	end,
})
vim.keymap.set("n", "<leader>ex", "<Cmd>NvimTreeToggle<CR>", { silent = true, desc = "Toggle file tree" })
vim.keymap.set("n", "<leader>ef", "<Cmd>NvimTreeFindFile<CR>", { silent = true, desc = "Reveal file in tree" })

require("mini.pairs").setup()
require("mini.surround").setup()

require("gitsigns").setup({
	current_line_blame = false,
	on_attach = function(buffer)
		local map = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = buffer, silent = true, desc = desc })
		end
		map("n", "]c", function() if vim.wo.diff then vim.cmd.normal({ "]c", bang = true }) else require("gitsigns").nav_hunk("next") end end, "Next hunk")
		map("n", "[c", function() if vim.wo.diff then vim.cmd.normal({ "[c", bang = true }) else require("gitsigns").nav_hunk("prev") end end, "Previous hunk")
		map("n", "<leader>gp", require("gitsigns").preview_hunk, "Preview hunk")
		map("n", "<leader>gr", require("gitsigns").reset_hunk, "Reset hunk")
		map("n", "<leader>gs", require("gitsigns").stage_hunk, "Stage hunk")
	end,
})

local lint = require("lint")
lint.linters_by_ft = {
	c = { "clangtidy" },
	cpp = { "clangtidy" },
	javascript = { "eslint_d" },
	json = { "jsonlint" },
	lua = { "luacheck" },
	python = { "ruff" },
	rust = { "clippy" },
	typescript = { "eslint_d" },
}
vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
	group = vim.api.nvim_create_augroup("LintConfig", { clear = true }),
	callback = function() lint.try_lint() end,
})
vim.keymap.set("n", "<leader>ll", function() lint.try_lint() end, { silent = true, desc = "Run lint" })

local conform = require("conform")
conform.setup({
	formatters_by_ft = {
		python = { "ruff_format" },
		rust = { "rustfmt" },
	},
	format_on_save = { timeout_ms = 2000, lsp_format = "fallback" },
})
vim.keymap.set("n", "<leader>s", function() conform.format({ async = true, lsp_format = "fallback" }) end, { silent = true, desc = "Format buffer" })
vim.api.nvim_create_user_command("Format", function() conform.format({ async = true, lsp_format = "fallback" }) end, { desc = "Format current buffer" })

require("trouble").setup({
	focus = true,
	icons = { indent = { middle = "│ ", last = "└─", top = "─" } },
})
map("n", "<leader>xx", "<Cmd>Trouble diagnostics toggle<CR>", { silent = true, desc = "Toggle diagnostics" })
map("n", "<leader>xr", "<Cmd>Trouble lsp_references toggle<CR>", { silent = true, desc = "Toggle references" })
map("n", "<leader>xs", "<Cmd>Trouble symbols toggle focus=false<CR>", { silent = true, desc = "Toggle symbols" })

local harpoon = require("harpoon")
harpoon:setup()
local harpoon_list = harpoon:list()
map("n", "<leader>ha", function() harpoon_list:add() end, { silent = true, desc = "Harpoon add file" })
map("n", "<leader>hm", function() harpoon.ui:toggle_quick_menu(harpoon_list) end, { silent = true, desc = "Harpoon menu" })
map("n", "<leader>h1", function() harpoon_list:select(1) end, { silent = true, desc = "Harpoon file 1" })
map("n", "<leader>h2", function() harpoon_list:select(2) end, { silent = true, desc = "Harpoon file 2" })
map("n", "<leader>h3", function() harpoon_list:select(3) end, { silent = true, desc = "Harpoon file 3" })
map("n", "<leader>h4", function() harpoon_list:select(4) end, { silent = true, desc = "Harpoon file 4" })

