local augroup = vim.api.nvim_create_augroup("UserConfig", {
	clear = true,
})

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
	group = augroup,
	pattern = {
		"*.lua",
		"*.py",
		"*.js",
		"*.ts",
		"*.json",
		"*.css",
		"*.html",
		"*.sh",
		"*.bash",
		"*.c",
		".rs",
	},

	callback = function(args)
		if vim.bo[args.buf].buftype ~= "" then
			return
		end

		if not vim.bo[args.buf].modifiable then
			return
		end

		if vim.api.nvim_buf_get_name(args.buf) == "" then
			return
		end

		for _, client in ipairs(vim.lsp.get_clients({ bufnr = args.buf })) do
			if client.name == "efm" then
				pcall(vim.lsp.buf.format, {
					bufnr = args.buf,
					timeout_ms = 2000,
					filter = function(c)
						return c.name == "efm"
					end,
				})
				break
			end
		end
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup,
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup,
	desc = "Restore last cursor position",

	callback = function()
		if vim.o.diff then
			return
		end

		local last_pos = vim.api.nvim_buf_get_mark(0, '"')
		local last_line = vim.api.nvim_buf_line_count(0)

		if last_pos[1] < 1 or last_pos[1] > last_line then
			return
		end

		pcall(vim.api.nvim_win_set_cursor, 0, last_pos)
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = { "markdown", "text", "gitcommit" },

	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.spell = true
	end,
})
