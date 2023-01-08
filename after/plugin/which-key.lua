local wk = require("which-key")
wk.setup()

local opts = {
    mode = "n", -- NORMAL mode
    -- prefix: use "<leader>f" for example for mapping everything related to finding files
    -- the prefix is prepended to every mapping part of `mappings`
    prefix = "",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
}

-- wk.register({
--   f = {
--     name = "file", -- optional group name
--     f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
--   },
-- }, opts)

-- local path = vim.loop.cwd() .. "/.git"
-- local ok, err = vim.loop.fs_stat(path)
-- if not ok then print(err) end


wk.register({
    ["<leader>"] = {
        f = {
            name = "+file",
            f = { "<cmd>Telescope find_files<cr>", "Find File" },
            b = { "<cmd>Telescope buffers<cr>", "Buffers" },
            r = { "<cmd>Telescope frecency workspace=CWD<cr>", "Frecent Files" },
            h = { "<cmd>Telescope oldfiles<cr>", "File History" },
            n = { "<cmd>enew<cr>", "New File" },
            p = { "<cmd>Telescope registers<cr>", "Pasteboard" },
            e = { "<cmd>Telescope file_browser theme=ivy<cr>", "File Explorer" },
            s = { "<cmd>so<cr>", "Source File" },

        },
        g = {
            name = "+git",
            b = { "<cmd>Gitsigns blame_line<cr>", "Blame" },
            g = { "<cmd>lua _lazygit_toggle()<cr>", "Lazygit" },
            y = { "Yank GitHub link" }
        },
        l = {
            name = "+lsp",
            t = { "<cmd>TroubleToggle<cr>", "Trouble" },
            f = { "<cmd>LspZeroFormat<cr>", "Format" },
        },
        r = {
            name = "+run",
            -- r = { "ggVG<cmd>'<,'>:SnipRun<cr><esc>", "Run file" },
            r = { "<cmd>:lua require'sniprun'.run('n')<cr>", "Run file" },
            x = { "<cmd>:SnipClose<cr>", "Clear SnipRun" },
        },
        w = { "<cmd>w<cr>", "Save" },
        -- r = { "<cmd>lua require('telescope').load_extension('neoclip')<cr><cmd>Telescope neoclip<cr>", "Registers" },
        t = { "<cmd>NvimTreeFindFileToggle<cr>", "Toggle Tree" },
        s = { "<cmd>Telescope live_grep<cr>", "Grep" },
        c = { "<cmd>Telescope commands<cr>", "Neovim Commands" },
        x = { "<cmd>BufferClose<cr>", "Close Buffer" },
        X = { "<cmd>BufferClose!<cr>", "Close Buffer" },
        m = { "<cmd>BufferPick<cr>", "Move Buffer" },
    },
}, opts)

wk.register({
    ["<leader>"] = {
        g = {
            name = "+git",
            y = { "Yank GitHub link" }
        }
    },
}, { mode = "v" })
