vim.pack.add({
	"https://www.github.com/echasnovski/mini.nvim",
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/akinsho/bufferline.nvim",
	"https://www.github.com/ibhagwan/fzf-lua",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://www.github.com/nvim-tree/nvim-tree.lua",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/mfussenegger/nvim-lint",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/folke/trouble.nvim",
	"https://github.com/folke/which-key.nvim",
	"https://github.com/ThePrimeagen/harpoon",
	"https://github.com/tpope/vim-fugitive",

	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
	},

	"https://github.com/JoosepAlviste/nvim-ts-context-commentstring",
	"https://www.github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/creativenull/efmls-configs-nvim",

	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("1.*"),
	},

	"https://github.com/obsidian-nvim/obsidian.nvim",
	"https://github.com/mrcjkb/rustaceanvim",
	"https://github.com/christoomey/vim-tmux-navigator",
})
