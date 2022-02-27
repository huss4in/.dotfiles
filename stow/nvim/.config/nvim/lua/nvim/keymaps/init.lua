local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<SPACE>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Reload init.lua
keymap('n', "<SPACE>r<CR>", ":source %", { noremap = true })

-- Normal --
-- Better window navigation
keymap('n', "<C-h>", "<C-w>h", opts)
keymap('n', "<C-j>", "<C-w>j", opts)
keymap('n', "<C-k>", "<C-w>k", opts)
keymap('n', "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap('n', "<C-UP>", ":resize -2<CR>", opts)
keymap('n', "<C-DOWN>", ":resize +2<CR>", opts)
keymap('n', "<C-LEFT>", ":vertical resize -2<CR>", opts)
keymap('n', "<C-RIGHT>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap('n', "<S-l>", ":bnext<CR>", opts)
keymap('n', "<S-h>", ":bprev<CR>", opts)

-- Move text up and down
keymap('n', "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
keymap('n', "<A-j>", "<Esc>:m .+1<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap('i', "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap('v', "<", "<gv", opts)
keymap('v', ">", ">gv", opts)

-- Move text up and down
keymap('v', "<A-j>", ":m .+1<CR>==", opts)
keymap('v', "<A-k>", ":m .-2<CR>==", opts)
keymap('v', "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap('x', "<S-J>", ":move '>+1<CR>gv-gv", opts)
keymap('x', "<S-K>", ":move '<-2<CR>gv-gv", opts)
keymap('x', "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap('x', "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Explorer --
keymap('n', "<SPACE>ee", ":Explore<CR>", opts)
keymap('n', "<SPACE>ej", ":rightbelow split<CR>", opts)
keymap('n', "<SPACE>ek", ":leftabove split<CR>", opts)
keymap('n', "<SPACE>el", ":rightbelow vsplit<CR>", opts)
keymap('n', "<SPACE>eh", ":leftabove vsplit<CR>", opts)

-- Clear serach highlight
keymap('n', "<SPACE>h", ":noh<CR>", opts)

-- Newline normal mode
keymap('n', "<A-o>", "o<ESC>", opts)
keymap('n', "<A-S-O>", "O<ESC>", opts)
