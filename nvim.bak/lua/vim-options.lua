-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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

-- Set highlight on search
vim.o.hlsearch = false

-- Enable mouse mode
vim.o.mouse = 'a'

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
