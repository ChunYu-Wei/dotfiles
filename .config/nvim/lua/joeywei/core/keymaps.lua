-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap.set -- for conciseness

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
keymap("i", "jk", "<ESC>")

-- clear search highlights
keymap("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap("n", "x", '"_x')

-- window management
keymap("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap("n", "<leader>se", "<C-w>=") -- make split windows equal width & height

-- tab selection
keymap("n", "<leader>1", "1gt")
keymap("n", "<leader>2", "2gt")
keymap("n", "<leader>3", "3gt")
keymap("n", "<leader>4", "4gt")
keymap("n", "<leader>5", "5gt")
keymap("n", "<leader>6", "6gt")
keymap("n", "<leader>7", "7gt")
keymap("n", "<leader>8", "8gt")
keymap("n", "<leader>9", "9gt")

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap("n", "<leader>t", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- saga
keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>")
keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>")
keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")
keymap("n", "gr", "<cmd>Lspsaga lsp_finder<CR>")
keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>")
keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")

-- lspconfig
local opts = { noremap = true, silent = true, buffer = bufnr }
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
keymap("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts) -- got to declaration

-- undo tree
keymap('n', '<leader>u',"<cmd>lua vim.cmd.UndotreeToggle<CR>")

-- hop
vim.api.nvim_set_keymap("n", "<Leader>b", "<cmd>HopWordBC<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader>w", "<cmd>HopWordAC<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader>j", "<cmd>HopLineAC<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader>k", "<cmd>HopLineBC<CR>", {noremap=true})
