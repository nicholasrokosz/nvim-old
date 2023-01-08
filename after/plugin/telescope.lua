local builtin = require('telescope.builtin')
local telescope = require('telescope')

-- TODO: configure to use `.git_files` if in a git repo, else use `.find_files`
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

-- from thePrimeagen, don't love it
-- vim.keymap.set('n', '<leader>fs', function()
-- 	builtin.grep_string({ search = vim.fn.input("Grep > ") })
-- end)

telescope.setup({})

telescope.load_extension 'file_browser'
