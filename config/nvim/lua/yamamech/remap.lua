local bind = vim.keymap.set

vim.g.mapleader = " "
-- Toggle the NvimTree window
bind("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")

-- Move the highlighted text up/down a line
bind("v", "J", ":m '>+1<CR>gv=gv")
bind("v", "K", ":m '<-2<CR>gv=gv")

-- 
bind("x", "<leader>p", "\"_dP")

-- 
bind("n", "<leader>y", "\"+y")
bind("n", "<leader>Y", "\"+Y")
bind("v", "<leader>y", "\"+y")

--
bind("n", "<leader>d", "\"_d")
bind("v", "<leader>d", "\"_d")

-- Replace word that the cursor has highlighted in the current file
bind("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
-- Add the +x flag to the current file
bind("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

bind("n", "<C-s>", "<cmd>w<CR>")
