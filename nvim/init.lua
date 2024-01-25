
-- install Nerd Fonts if not installed
if vim.fn.has('unix') then
  if vim.fn.has('mac') then
    if vim.fn.empty(vim.fn.glob('~/Library/Fonts/Sauce Code Pro Nerd Font Complete Mono.ttf')) then
      vim.fn.system { 'curl', '-fLo', '~/Library/Fonts/Sauce Code Pro Nerd Font Complete Mono.ttf', 'https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete%20Mono.ttf?raw=true' }
    end
  elseif vim.fn.empty(vim.fn.glob('~/.local/share/fonts/Sauce Code Pro Nerd Font Complete Mono.ttf')) then
    vim.fn.system { 'curl', '-fLo', '~/.local/share/fonts/Sauce Code Pro Nerd Font Complete Mono.ttf', '--create-dirs', 'https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete%20Mono.ttf?raw=true' }
  end
end

-- Install lazy.vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {}

require("vim-options")
require("lazy").setup("plugins")


-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
