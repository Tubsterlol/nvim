require("gitsigns").setup({
	current_line_blame = false,
	on_attach = function(buffer)
		local map = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = buffer, silent = true, desc = desc })
		end

		map("n", "]c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "]c", bang = true })
			else
				require("gitsigns").nav_hunk("next")
			end
		end, "Next hunk")
		map("n", "[c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "[c", bang = true })
			else
				require("gitsigns").nav_hunk("prev")
			end
		end, "Previous hunk")
		map("n", "<leader>gp", require("gitsigns").preview_hunk, "Preview hunk")
		map("n", "<leader>gr", require("gitsigns").reset_hunk, "Reset hunk")
		map("n", "<leader>gs", require("gitsigns").stage_hunk, "Stage hunk")
	end,
})
