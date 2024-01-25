vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

-- split window navigation
vim.o.splitbelow = true
vim.o.splitright = true
vim.api.nvim_set_keymap("n", "<C-J>", "<C-W>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-K>", "<C-W>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-L>", "<C-W>l", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-H>", "<C-W>h", { noremap = true })

vim.opt.relativenumber = true

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set colorcolumn
vim.opt.colorcolumn = "80"

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- set yank to clipboard
--vim.opt.clipboard = "unnamedplus"
vim.api.nvim_set_option("clipboard","unnamedplus")

-- buffer navigation
vim.api.nvim_set_keymap("n", "<leader>p", ":bp<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>n", ":bn<CR>", { noremap = true })
