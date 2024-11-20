-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

if vim.g.neovide then
  vim.o.guifont = "Hurmit Nerd Font:h15" -- Set font explicitly otherwise neovide will use default font
  -- vim.g.neovide_transparency = 0.8 -- Change this to adjust transparency, it's pretty janky
  -- vim.g.transparency = 0.8
end

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.g.autoformat = false

-- Disable swapfile
vim.opt.swapfile = false

-- Disable backup
vim.opt.backup = false

-- Disable writebackup
vim.opt.writebackup = false

-- Enable line wrap, and make it so that long lines wrap smartly
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.showbreak = string.rep(" ", 3)
vim.opt.linebreak = true

-- Set encoding to utf-8
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- Number of spaces that a <Tab> counts for while performing editing operations
vim.opt.softtabstop = 2

-- Enable incremental search
vim.opt.incsearch = true

-- Enable highlight on search
vim.o.hlsearch = true

-- Enable Spellcheck
vim.opt.spell = true

-- Save undo history
vim.o.undolevels = 1000

-- Decrease update time
vim.o.updatetime = 250

-- Decrease redraw time
vim.o.redrawtime = 100

-- Use spaces instead of tabs
vim.opt.expandtab = true

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
vim.opt.whichwrap:append("<>hl")

-- Motions like "G" also move to the first char
vim.opt.startofline = true

vim.opt.clipboard = "unnamedplus"

-- Setting the default python lsp to pyright instead of basedpyright
vim.g.lazyvim_python_lsp = "pyright"

vim.g.autoformat = false --for now

--vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
