-- nvim-tree

local g = vim.g

g.nvim_tree_width = 40
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_auto_close = 1
g.nvim_tree_auto_ignore_ft = { 'minimap' }
g.nvim_tree_follow = 1

g.nvim_tree_show_icons = {
	git = 0,
	folders = 1,
	files = 1,
	folder_arrows = 1,
}

g.nvim_tree_window_picker_exclude = {
	filetype = {
		'minimap',
		'packer',
		'qf',
	},
	buftype = {
		'terminal',
	},
}

g.nvim_tree_ignore = {
	'.DS_Store',
	'.cache',
	'.git',
	'.idea',
	'.mypy_cache',
	'.vagrant',
	'__pycache__',
	'node_modules',
}
