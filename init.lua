-- Install Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Define Leader Keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Add Plugins
require("lazy").setup({
  spec = { { import = "plugins" }, },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
})

-- Define Vim Globals

-- Set Theme
vim.cmd[[colorscheme tokyonight-night]]

-- Set HighLighting
-- vim.cmd [[
--  highlight Normal guibg=none
--  highlight NonText guibg=none
--  highlight Normal ctermbg=none
--  highlight NonText ctermbg=none
-- ]]

-- Create Shortcut for Explorer
vim.keymap.set("n", "<leader>fe", vim.cmd.Ex)

-- Hide Banner in Explorer
vim.g.netrw_banner = 0

-- Copy to Main Clipboard
vim.cmd("set clipboard+=unnamedplus")

-- Configure Tab Spacing
vim.expandtab = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4

-- Set Cursor
vim.opt.guicursor = ""

-- Show Numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Configure Edges
vim.opt.scrolloff = 8
vim.opt.wrap = false
