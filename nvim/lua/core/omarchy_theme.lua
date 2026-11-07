-- Omarchy theme integration: reads neovim.lua from the active omarchy theme.
-- Used at startup (plugins/colorscheme.lua) and for live reloads triggered by
-- ~/.config/omarchy/hooks/theme-set.d/nvim-reload.sh.
local M = {}

local paths = {
	"~/.local/state/omarchy/current/theme/neovim.lua",
	"~/.config/omarchy/current/theme/neovim.lua", -- legacy location
}

-- Returns the lazy.nvim spec of the active theme, or nil.
function M.spec()
	for _, path in ipairs(paths) do
		local file = vim.fn.expand(path)
		if vim.fn.filereadable(file) == 1 then
			local ok, spec = pcall(dofile, file)
			if ok then
				return spec
			end
		end
	end
end

local function plugin_name(spec)
	return spec.name or spec[1]:match("[^/]+$")
end

-- Makes a plugin available in the running session, cloning it if needed.
local function ensure_plugin(spec)
	if type(spec) == "string" then
		spec = { spec }
	end
	local name = plugin_name(spec)
	local known = require("lazy.core.config").plugins[name]
	if known then
		require("lazy").load({ plugins = { name } })
		return name
	end

	local dir = vim.fn.stdpath("data") .. "/lazy/" .. name
	if not vim.uv.fs_stat(dir) then
		local cmd = { "git", "clone", "--filter=blob:none" }
		if spec.branch then
			vim.list_extend(cmd, { "--branch", spec.branch })
		end
		vim.list_extend(cmd, { "https://github.com/" .. spec[1] .. ".git", dir })
		vim.fn.system(cmd)
	end
	vim.opt.rtp:prepend(dir)
	return name
end

local function setup_plugin(spec, name)
	if type(spec.config) == "function" then
		spec.config(spec, spec.opts or {})
		return
	end
	if not spec.opts then
		return
	end
	-- Drop cached modules so the plugin re-reads its new options
	local base = name:gsub("%.nvim$", ""):gsub("%-nvim$", ""):gsub("^nvim%-", "")
	for mod in pairs(package.loaded) do
		if mod == base or mod:find("^" .. vim.pesc(base) .. "%.") then
			package.loaded[mod] = nil
		end
	end
	local ok, mod = pcall(require, base)
	if ok and type(mod) == "table" and mod.setup then
		mod.setup(spec.opts)
	end
end

-- Re-applies the active omarchy theme in this running nvim.
function M.reload()
	local spec = M.spec()
	if not spec then
		return
	end

	local colorscheme
	for _, entry in ipairs(spec) do
		if entry[1] == "LazyVim/LazyVim" then
			colorscheme = entry.opts and entry.opts.colorscheme
		else
			for _, dep in ipairs(entry.dependencies or {}) do
				ensure_plugin(dep)
			end
			setup_plugin(entry, ensure_plugin(entry))
		end
	end

	if colorscheme then
		vim.cmd("highlight clear")
		local ok, err = pcall(vim.cmd.colorscheme, colorscheme)
		if not ok then
			vim.notify("Omarchy theme reload failed: " .. err, vim.log.levels.WARN)
		end
	end
end

return M
