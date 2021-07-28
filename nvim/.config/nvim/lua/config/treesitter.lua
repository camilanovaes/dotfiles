-- treesitter
require('nvim-treesitter.configs').setup({
	ensure_installed = 'maintained',
	highlight = {
		enable = true,
		disable = {
			'beancount',
			'c',
			'c_sharp',
			'clojure',
			'commonlisp',
			'cpp',
			'dart',
			'elixir',
			'erlang',
			'haskell',
			'java',
			'kotlin',
			'rust',
			'zig',
		},
	},
})
