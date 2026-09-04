require("blink.cmp").setup({
	keymap = {
		preset = "default",
	},
	appearance = {
		nerd_font_variant = "mono",
	},
	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 200,
		},
		ghost_text = {
			enabled = true,
		},
	},
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	signature = {
		enabled = true,
	},
})

local servers = {
	"lua_ls",
	"pyright",
	"rust_analyzer",
	"html",
	"cssls",
	"bashls",
}

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
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_enable = false,
})
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
