-- ~/.config/nvim/init.lua

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Set leader early
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic options
vim.o.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true

-- === LAZY SETUP ===
require("lazy").setup({
	-- 1. Install LazyVim (this provides lazyvim.plugins)
	{
		"LazyVim/LazyVim",
		import = "lazyvim.plugins",
	},

	-- 2. Optional LazyVim extras
	-- { import = "lazyvim.plugins.extras.lang.typescript" },

	-- 3. Your custom plugins
	{ import = "plugins" },
}, {
	change_detection = { enabled = true, notify = false },
	checker = { enabled = true, notify = true },
})
-- === END LAZY SETUP ===

-- Non-lazy modules
require("core.options")
require("core.keymaps")
require("bufferline").setup({})
require("mini.animate").setup()
-- require("nvim-mini-indentscope").setup()
