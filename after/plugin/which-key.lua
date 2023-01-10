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

function Project_files()
	local options = {} -- define here if you want to define something
	vim.fn.system("git rev-parse --is-inside-work-tree")
	if vim.v.shell_error == 0 then
		require("telescope.builtin").git_files(options)
	else
		require("telescope.builtin").find_files(options)
	end
end

-- call via:
-- :lua require"telescope-config".project_files()

-- example keymap:
-- vim.api.nvim_set_keymap("n", "<Leader><Space>", "<CMD>lua require'telescope-config'.project_files()<CR>", {noremap = true, silent = true})

wk.register({
	["<leader>"] = {
		f = {
			name = "+file",
			-- f = { '<cmd>Telescope git_files<cr>', "Find File" },
			f = { Project_files, "Find File" },
			b = { "<cmd>Telescope buffers<cr>", "Buffers" },
			r = { "<cmd>Telescope frecency workspace=CWD<cr>", "Frecent Files" },
			h = { "<cmd>Telescope oldfiles<cr>", "File History" },
			n = { "<cmd>enew<cr>", "New File" },
			p = { "<cmd>Telescope registers<cr>", "Pasteboard" },
			e = { "<cmd>Telescope file_browser theme=ivy<cr>", "File Explorer" },
			s = { "<cmd>so<cr>", "Source File" },
			S = { "<cmd>so $MYVIMRC<cr>", "Source nvim config" },
			u = { "<cmd>UndotreeToggle<cr><C-w>h", "Undo Tree" },
		},
		g = {
			name = "+git",
			b = { "<cmd>Gitsigns blame_line<cr>", "Blame" },
			g = { "<cmd>lua _lazygit_toggle()<cr>", "Lazygit" },
			y = { "Yank GitHub link" },
		},
		p = {
			name = "+packer",
			p = { "<cmd>PackerSync<cr>", "PackerSync" },
			s = { "<cmd>PackerStatus<cr>", "PackerStatus" },
		},
		l = {
			name = "+lsp",
			t = { "<cmd>TroubleToggle<cr>", "Trouble" },
			f = { "<cmd>LspZeroFormat<cr><cmd>w<cr>", "Format" },
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
		s = {
			name = "+search",
			s = { "<cmd>Telescope live_grep<cr>", "Grep" },
			k = { "<cmd>Telescope keymaps<cr>", "Search keymaps" },
		},
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
			y = { "Yank GitHub link" },
		},
	},
}, { mode = "v" })
