local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
-- reset
keymap("", "<Space>", "<Nop>", opts)

-- buffer
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<leader>bd", ":bdelete<CR>", { noremap = true, silent = true, desc = "Delete" })
keymap("n", "<leader>bx", ":w<CR>:bdelete<CR>", { noremap = true, silent = true, desc = "Write and Delete" })
keymap("n", "<leader>qq", ":q<CR>", { noremap = true, silent = true, desc = "Quit" })

-- move text
keymap("n", "<A-j>", ":m .+1<cr>==", opts)
keymap("n", "<A-k>", ":m .-2<cr>==", opts)
keymap("i", "<A-j>", "<esc>:m .+1<cr>==gi", opts)
keymap("i", "<A-k>", "<esc>:m .-2<cr>==gi", opts)
keymap("v", "<A-j>", ":m '>+1<cr>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<cr>gv=gv", opts)
