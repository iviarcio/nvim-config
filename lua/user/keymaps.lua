local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Yank to the end of line (like D == d$ & C == c$)
keymap("n", "Y", "y$", opts)

-- Center buffer while navigating
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "{", "{zz", opts)
keymap("n", "}", "}zz", opts)
keymap("n", "G", "Gzz", opts)
keymap("n", "gg", "ggzz", opts)
keymap("n", "%", "%zz", opts)
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Buffer navigation
keymap("n", "[b", ":bp<cr>", opts)
keymap("n", "]b", ":bn<cr>", opts)

-- Terminal
keymap("n", "<c-t>", ":ToggleTerm size=10 direction=horizontal name=term<cr>", opts)

-- Fzf
keymap("n", "<c-p>", ":FzfLua files<CR>", opts)
keymap("n", "<c-[>", ":FzfLua buffers<CR>", opts)
keymap("n", "<c-g>", ":FzfLua grep<CR>", opts)
keymap("n", "<c-l>", ":FzfLua live_grep<CR>", opts)
keymap("n", "<c-]>", ":FzfLua builtin<CR>", opts)
