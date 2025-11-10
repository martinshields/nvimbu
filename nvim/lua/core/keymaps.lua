-- Set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

-- General keymaps
-- keymap.set("i", "jk", "<ESC>") -- exit insert mode with jk
-- keymap.set("i", "ii", "<ESC>") -- exit insert mode with ii
keymap.set("n", "<leader>wq", ":wq<CR>", { desc = "Save and Quit" }) -- save and quit
keymap.set("n", "<leader>ww", ":w<CR>", { desc = "Write/Save File" }) -- save
keymap.set("n", "gx", ":!open <c-r><c-a><CR>", { desc = "Open URL under cursor" }) -- open URL under cursor
keymap.set("n", "C-s", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>ul", "<CMD>Lazy<CR>", { desc = "Open Lazy" })
vim.keymap.set("n", "<leader>um", "<CMD>Mason<CR>", { desc = "Open Mason" })

vim.keymap.set("n", "<leader>ud", function()
	require("snacks").open()
end, { desc = "Open Snacks Menu" })

vim.keymap.set("n", "<leader>n", "<CMD>NoiceAll<CR>", { desc = "NoiceAll" })
vim.keymap.set("n", "<leader>p", "<CMD>Telescope yank_history<CR>", { desc = "Yank history" })
-- Go to Beginning or End of line
keymap.set({ "n", "v" }, "H", "_^", { desc = "Move to the beginning of the line" })
keymap.set({ "n", "v" }, "L", "$", { desc = "Move to the end of the line" })
--copy line then comment it step_out
vim.keymap.set("n", "ycc", "yygccp", { remap = true })
-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
--
-- -- Split window management
-- keymap.set("n", "<leader>sv", "<C-w>v", { desc = "split window vertically" }) -- split window vertically
-- keymap.set("n", "<leader>sh", "<C-w>s", { desc = "split window horizontally" }) -- split window horizontally
-- keymap.set("n", "<leader>se", "<C-w>=", { desc = "split window equal" }) -- make split windows equal width
-- keymap.set("n", "<leader>sx", ":close<CR>", { desc = "close split" }) -- close split window
-- keymap.set("n", "<leader>sj", "<C-w>-", { desc = "height shorter" }) -- make split window height shorter
-- keymap.set("n", "<leader>sk", "<C-w>+", { desc = "height taller" }) -- make split windows height taller
-- keymap.set("n", "<leader>sl", "<C-w>>5", { desc = "split width bigger" }) -- make split windows width bigger
-- keymap.set("n", "<leader>sh", "<C-w><5", { desc = "split width smaller" }) -- make split windows width smaller
--
-- Navigate between splits
-- vim.keymap.set('n', '<C-k>', ':wincmd k<CR>')
-- vim.keymap.set('n', '<C-j>', ':wincmd j<CR>')
-- vim.keymap.set('n', '<C-h>', ':wincmd h<CR>')
-- vim.keymap.set('n', '<C-l>', ':wincmd l<CR>')

-- Vim-maximizer
keymap.set("n", "<leader>m", ":MaximizerToggle<CR>") -- toggle maximize tab

-- Tab management
keymap.set("n", "<leader>bn", ":tabnew<CR>", { desc = "New buffer" }) -- open a new tab
keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { silent = true, desc = "Close buffer" })
keymap.set("n", "<leader>bx", "<CMD>BufferLinePickClose<CR>", { desc = "Pick buffer to close" }) -- close a tab
keymap.set("n", "<leader>bo", "<CMD>BufferLineCloseOthers<CR>", { desc = "close all others" }) -- close a tab
keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "next buffer" })
keymap.set("n", "<c-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "previous buffer" }) -- previous tab

-- copy file path
vim.keymap.set("n", "<leader>yp", ":let @+=expand('%:.')<cr>", { desc = "Copy relative path" })
vim.keymap.set("n", "<leader>yP", ":let @+=@%<cr>", { desc = "Copy absolute path" })

-- -- Diff keymaps
-- keymap.set("n", "<leader>cc", ":diffput<CR>") -- put diff from current to other during diff
-- keymap.set("n", "<leader>cj", ":diffget 1<CR>") -- get diff from left (local) during merge
-- keymap.set("n", "<leader>ck", ":diffget 3<CR>") -- get diff from right (remote) during merge
-- keymap.set("n", "<leader>cn", "]c") -- next diff hunk
-- keymap.set("n", "<leader>cp", "[c") -- previous diff hunk

-- Quickfix list keybinds
keymap.set("n", "<leader>qn", "<Cmd>cnext<CR>", { desc = "Go to next item in Quickfix list" })
keymap.set("n", "<leader>qp", "<Cmd>cprev<CR>", { desc = "Go to previous item in Quickfix list" })
keymap.set("n", "<leader>qo", "<Cmd>copen<CR>", { desc = "Open Quickfix List" })
keymap.set("n", "<leader>qc", "<Cmd>cclose<CR>", { desc = "Close Quickfix List" })

-- Nvim-tree
keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>") -- toggle file explorer
keymap.set("n", "<leader>er", ":NvimTreeFocus<CR>") -- toggle focus to file explorer
keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>") -- find file in file explorer

-- Telescope
vim.api.nvim_set_keymap(
	"n",
	"<Leader>fc",
	-- "<cmd>lua require('telescope.builtin').find_files({prompt_title='Plugins', cwd='~/.config/mvim/'})<CR>",
	"<CMD>:lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})<CR>",
	{ noremap = true, silent = true, desc = "find configs" }
)
keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "Find File" })
keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "Live grep" })
keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "Find buffers" })
keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = "Find help" })

keymap.set(
	"n",
	"<leader>fs",
	require("telescope.builtin").current_buffer_fuzzy_find,
	{ desc = "current buffer fuz find" }
)
keymap.set("n", "<leader>fo", require("telescope.builtin").lsp_document_symbols, { desc = "lsp doc symbol" })
keymap.set("n", "<leader>fi", require("telescope.builtin").lsp_incoming_calls, { desc = "lsp_incoming_calls" })
vim.keymap.set("n", "<leader>fr", "<CMD>Telescope oldfiles<CR>", { desc = "open recent files" })
vim.keymap.set("n", "<leader>fk", "<CMD>Telescope keymaps<CR>", { desc = "Find keymaps" })
keymap.set("n", "<leader>fm", function()
	require("telescope.builtin").treesitter({ default_text = ":method:" })
end)

-- Git-blame
keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>") -- toggle git blame

-- Harpoon
keymap.set("n", "<leader>ha", require("harpoon.mark").add_file, { desc = "harpoon add" })
keymap.set("n", "<leader>hh", require("harpoon.ui").toggle_quick_menu, { desc = "harpoon menu" })
keymap.set("n", "<leader>1", function()
	require("harpoon.ui").nav_file(1)
end)
keymap.set("n", "<leader>2", function()
	require("harpoon.ui").nav_file(2)
end)
keymap.set("n", "<leader>3", function()
	require("harpoon.ui").nav_file(3)
end)
keymap.set("n", "<leader>4", function()
	require("harpoon.ui").nav_file(4)
end)
-- keymap.set("n", "<leader>5", function()
-- 	require("harpoon.ui").nav_file(5)
-- end)
-- keymap.set("n", "<leader>6", function()
-- 	require("harpoon.ui").nav_file(6)
-- end)
-- keymap.set("n", "<leader>7", function()
-- 	require("harpoon.ui").nav_file(7)
-- end)
-- keymap.set("n", "<leader>8", function()
-- 	require("harpoon.ui").nav_file(8)
-- end)
-- keymap.set("n", "<leader>9", function()
-- 	require("harpoon.ui").nav_file(9)
-- end)

-- LSP
keymap.set("n", "<leader>gg", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "hover" })
keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "definition" })
keymap.set("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "declaration" })
keymap.set("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "implementation" })
keymap.set("n", "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { desc = "type_definition" })
keymap.set("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "references" })
keymap.set("n", "<leader>gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "signature_help" })
keymap.set("n", "<leader>rr", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "buff.rename" })
keymap.set("n", "<leader>ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "code_action" })
keymap.set("n", "<leader>gl", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "open_float" })
keymap.set("n", "<leader>gp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "goto_prev" })
keymap.set("n", "<leader>gn", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "goto_next" })
-- keymap.set("n", "<leader>tr", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", { desc = "document_symbol" })
keymap.set("i", "<C-Space>", "<cmd>lua vim.lsp.buf.completion()<CR>", { desc = "completion" })

-- Debugging
-- keymap.set("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
-- keymap.set("n", "<leader>bc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
-- keymap.set("n", "<leader>bl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>")
-- keymap.set("n", "<leader>br", "<cmd>lua require'dap'.clear_breakpoints()<cr>")
-- keymap.set("n", "<leader>ba", "<cmd>Telescope dap list_breakpoints<cr>")
-- keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>")
-- keymap.set("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>")
-- keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>")
-- keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>")
-- keymap.set("n", "<leader>dd", function()
-- 	require("dap").disconnect()
-- 	require("dapui").close()
-- end)
-- keymap.set("n", "<leader>dt", function()
-- 	require("dap").terminate()
-- 	require("dapui").close()
-- end)
-- keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>")
-- keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>")
-- keymap.set("n", "<leader>di", function()
-- 	require("dap.ui.widgets").hover()
-- end)
-- keymap.set("n", "<leader>d?", function()
-- 	local widgets = require("dap.ui.widgets")
-- 	widgets.centered_float(widgets.scopes)
-- end)
-- keymap.set("n", "<leader>df", "<cmd>Telescope dap frames<cr>")
-- keymap.set("n", "<leader>dh", "<cmd>Telescope dap commands<cr>")
-- keymap.set("n", "<leader>de", function()
-- 	require("telescope.builtin").diagnostics({ default_text = ":E:" })
-- end)

--
--presistences
-- restore the session for the current directory
-- vim.api.nvim_set_keymap("n", "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]], {})

-- restore the last session
-- vim.api.nvim_set_keymap("n", "<leader>ql", [[<cmd>lua require("persistence").load({ last = true })<cr>]], {})

-- stop Persistence => session won't be saved on exit
-- vim.api.nvim_set_keymap("n", "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]], {})

-- keymaps for moving line up/down
local opts = { noremap = true, silent = true }

-- move line commandskeymap.set("n", "<leader>q", "<cmd>q<CR>", { silent = true, desc = "Close buffer" })
-- Normal-mode commands
vim.keymap.set("n", "<A-j>", ":MoveLine(1)<CR>", opts)
vim.keymap.set("n", "<A-k>", ":MoveLine(-1)<CR>", opts)
vim.keymap.set("n", "<A-h>", ":MoveHChar(-1)<CR>", opts)
vim.keymap.set("n", "<A-l>", ":MoveHChar(1)<CR>", opts)
vim.keymap.set("n", "<leader>wf", ":MoveWord(1)<CR>", opts)
vim.keymap.set("n", "<leader>wb", ":MoveWord(-1)<CR>", opts)

-- Visual-mode commands
vim.keymap.set("v", "<A-j>", ":MoveBlock(1)<CR>", opts)
vim.keymap.set("v", "<A-k>", ":MoveBlock(-1)<CR>", opts)
vim.keymap.set("v", "<A-h>", ":MoveHBlock(-1)<CR>", opts)
vim.keymap.set("v", "<A-l>", ":MoveHBlock(1)<CR>", opts)
