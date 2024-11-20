-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
--
-- Add any additional keymaps here

local map = vim.keymap.set
local unmap = vim.keymap.del
local opts = { silent = true }

-- Regex to rename all occurrences of the word under the cursor
local rename = [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]

-- Refer [FAQ - Neovide](https://neovide.dev/faq.html#how-can-i-use-cmd-ccmd-v-to-copy-and-paste)
if vim.g.neovide then
  map("n", "<leader>ns", ":w<CR>") -- Save
  map("v", "<leader>nc", '"+y') -- Copy
  map({ "n", "v" }, "<leader>nv", '"+P') -- Paste normal and visual mode
  map({"c" }, "<leader>nv", "<C-R>+") -- Paste command mode
  map("t", "<leader>v", [[<C-\><C-N>"+P]]) -- Paste terminal mode  vim.map.set("n", "<D-s>", ":w<CR>") -- Save
end

function live_grep_git_dir()
  local git_dir = vim.fn.system(string.format("git -C %s rev-parse --show-toplevel", vim.fn.expand("%:p:h")))
  git_dir = string.gsub(git_dir, "\n", "") -- remove newline character from git_dir
  local opts = {
    cwd = git_dir,
  }
  require('telescope.builtin').live_grep(opts)
end


map({"n"}, "<leader>gG", ":lua live_grep_git_dir()<CR>")

function execute_root_git_dir(command) -- not working for now
  local git_dir = vim.fn.system(string.format("git -C %s rev-parse --show-toplevel", vim.fn.expand("%:p:h")))
  git_dir = string.gsub(git_dir, "\n", "") -- remove newline character from git_dir
  cmd = "cd " .. git_dir .. "; make " .. command
  vim.api.nvim_command(cmd)
end


map({"n"}, "<leader>gm", ":lua execute_root_git_dir(")

-- Avoid `x` filling the register
map({ "n", "v" }, "x", '"_x', opts)

-- Rename under the cursor
map({ "n" }, "<leader>zr", rename, opts)

-- remap "p" in visual mode to delete the highlighted text without overwriting your yanked/copied text, and then paste the content from the unnamed register.
map("v", "p", '"_dP', opts)

-- Copy whole file content to clipboard with C-c
map("n", "<C-c>", ":%y+<CR>", opts)

-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Easier access to beginning and end of lines
map("n", "<A-h>", "^", {
  desc = "Go to start of line",
  silent = true,
})
map("n", "<A-l>", "$", {
  desc = "Go to end of line",
  silent = true,
})

-- Blame line
map("n", "<leader>gl", LazyVim.lazygit.blame_line)

-- Show Lsp info
map("n", "<leader>cl", "<cmd>LspInfo<CR>", opts)

--input easiness
map("i", "<C-j>", "<Esc>o", { desc = "Create a new line below and move into it" })
map("i", "<C-l>", "<Esc>la", { desc = "Move forward one character" })
map("i", "<C-h>", "<Esc>ha", { desc = "Move back one character" })

-- Better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Better page up/down
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Stay centered jumping between search results
map("n", "n", "nzzzv", { silent = true })
map("n", "N", "Nzzzv", { silent = true })

-- Fix cursor position after joining lines
map("n", "J", "mzJ`z", { silent = true })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })


-- Search for visually selected text
map("v", "//", 'y/<C-R>"<cr>', { silent = true })


-- smart deletion, dd
-- It solves the issue, where you want to delete empty line, but dd will override you last yank.
-- Code above will check if u are deleting empty line, if so - use black hole register.
-- [src: https://www.reddit.com/r/neovim/comments/w0jzzv/comment/igfjx5y/?utm_source=share&utm_medium=web2x&context=3]
local function smart_dd()
	if vim.api.nvim_get_current_line():match("^%s*$") then
		return '"_dd'
	else
		return "dd"
	end
end

map({"n"}, "dd", smart_dd, { noremap = true, expr = true })

map({"n"}, "<leader>m", ":Noice<CR>")
