vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>fe', vim.cmd.Ex)

vim.keymap.set("v", "<pagedown>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<pageup>", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
-- vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
-- vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.cmd.LspZeroFormat)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]]) -- cool, but weirdly slow
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
