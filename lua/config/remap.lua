local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
-- vim.keymap.set('n', '<leader>fe', vim.cmd.Ex)

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

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]]) -- cool, but weirdly slow
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- vim.cmd [[
--     cnoreabbrev <expr> h ((getcmdtype() is# ':' && getcmdline() is# 'h')?('tab help'):('h'))
-- ]]

vim.keymap.set("n", "<A-left>", "<Cmd>BufferPrevious<CR>", opts)
vim.keymap.set("n", "<A-right>", "<Cmd>BufferNext<CR>", opts)

vim.keymap.set("n", "<leader><left>", "<C-w>h", opts)
vim.keymap.set("n", "<leader><down>", "<C-w>j", opts)
vim.keymap.set("n", "<leader><up>", "<C-w>k", opts)
vim.keymap.set("n", "<leader><right>", "<C-w>l", opts)

vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

vim.keymap.set("n", "<C-a>", "gg<S-v>G")
