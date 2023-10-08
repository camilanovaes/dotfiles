-- Telescope configuration

require('telescope').setup {
	pickers = {
		find_files = {
			theme = "ivy",
			disable_devicons = false,
			previewer = false,
			winblend = 10,
			layout_config = {
				height = 0.4
			}
		},
		live_grep = {
			theme = "ivy",
			disable_devicons = false,
			winblend = 10,
			layout_config = {
				height = 0.4
			}
		},
		treesitter = {
			theme = "ivy",
			disable_devicons = true,
			winblend = 10,
			layout_config = {
				height = 0.4
			}
		},
		lsp_references = { theme = "ivy", disable_devicons = true, previewer = false },
		grep_string = { theme = "ivy", disable_devicons = true },
		buffers = { theme = "ivy", disable_devicons = true },
		help_tags = { theme = "ivy", disable_devicons = true },
	}
}
