return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"lua",
			"python",
			"javascript",
			"html",
			"bash",
			"json",
			"markdown",
		},
		highlight = { enable = true },
		indent = { enable = true },
		incremental_selection = { enable = true },
	},
}
