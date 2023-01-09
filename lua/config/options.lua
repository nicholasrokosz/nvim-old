vim.cmd([[
set termguicolors
set background=light

colorscheme zenbones
]])

vim.opt.nu = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- vim.opt.wrap = false

-- for long-running undo tree
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
-- vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- vim.opt.colorcolumn = ""

vim.opt.clipboard:append({ "unnamedplus" })

-- This didn't work without autocmd, taken from https://www.reddit.com/r/neovim/comments/sqld76/stop_automatic_newline_continuation_of_comments/hwm9k47/
-- vim.opt.formatoptions = 'tcqj'
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

vim.cmd([[command! -nargs=1 -complete=help H :enew | :set buftype=help | :h <args>]])
