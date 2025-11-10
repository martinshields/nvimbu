return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	-- opts = {},
	config = function()
		local wk = require("which-key")
		wk.add({
			mode = { "n", "v" },
			{ "<leader>b", group = "+buffers" },
			{ "<leader>f", group = "+file/find" },
			{ "<leader>g", group = "+git/def/dai" },
			{ "<leader>w", group = "+write/save" },
			{ "<leader>s", group = "+surrounds" },
			{ "<leader>e", group = "+nvimtree" },
			{ "<leader>r", group = "+renamebuffer" },
			{ "<leader>q", group = "+quickfix" },
			{ "<leader>t", group = "+doc symbol" },
			{ "<leader>u", group = "+lazy/manson" },
			{ "<leader>n", group = "+notifications" },
			{ "<leader>m", group = "+maximizer" },
			{ "<leader>h", group = "+harpoon menu/add" },
			{ "<leader>1", group = "+harpoon 1" },
			{ "<leader>2", group = "+harpoon 2" },
			{ "<leader>3", group = "+harpoon 3" },
			{ "<leader>4", group = "+harpoon 4" },
		})
	end,
}
