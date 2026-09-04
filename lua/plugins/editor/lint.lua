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
	callback = function()
		lint.try_lint()
	end,
})

vim.keymap.set("n", "<leader>ll", function()
	lint.try_lint()
end, { silent = true, desc = "Run lint" })
