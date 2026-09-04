require("bufferline").setup({
	options = {
		mode = "buffers",
		always_show_bufferline = true,
		show_buffer_close_icons = true,
		show_close_icon = false,
		separator_style = "slant",
		diagnostics = "nvim_lsp",
		offsets = {
			{
				filetype = "NvimTree",
				text = "Files",
				text_align = "left",
				separator = true,
			},
		},
	},
})
