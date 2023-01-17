require("neodev").setup({})
local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	"sumneko_lua",
})

local cmp = require("cmp")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

--lsp.on_attach(function(client, bufnr)
--    local opts = { buffer = bufnr, remap = false }
--    local set = vim.keymap.set
--
--    set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
--    set('n', 'K', function() vim.lsp.buf.hover() end, opts)
--    set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
--    set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
--    set('n', '[d', function() vim.diagnostic.goto_prev() end, opts)
--    set('n', ']d', function() vim.diagnostic.goto_next() end, opts)
--    set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
--    set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
--    set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
--    set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
-- end)

lsp.configure("sumneko_lua", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

lsp.setup()

local mason_nullls = require("mason-null-ls")
mason_nullls.setup({
	ensure_installed = {
		"eslint_d",
		"prettierd",
	},
	automatic_installation = true,
	automatic_setup = true,
})

local null_ls = require("null-ls")

local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"

null_ls.setup({
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.keymap.set("n", "<Leader>F", function()
				vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
			end, { buffer = bufnr, desc = "[lsp] format" })

			-- format on save
			vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
			vim.api.nvim_create_autocmd(event, {
				buffer = bufnr,
				group = group,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr, async = async })
				end,
				desc = "[lsp] format on save",
			})
		end

		if client.supports_method("textDocument/rangeFormatting") then
			vim.keymap.set("x", "<Leader>F", function()
				vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
			end, { buffer = bufnr, desc = "[lsp] format" })
		end
	end,
})

local prettier = require("prettier")

prettier.setup({
	bin = "prettierd", -- or `'prettierd'` (v0.22+)
	filetypes = {
		"css",
		"graphql",
		"html",
		"javascript",
		"javascriptreact",
		"json",
		"less",
		"markdown",
		"scss",
		"typescript",
		"typescriptreact",
		"yaml",
	},
	cli_options = {
		arrow_parens = "avoid",
		bracket_spacing = true,
		bracket_same_line = false,
		embedded_language_formatting = "auto",
		end_of_line = "lf",
		html_whitespace_sensitivity = "css",
		-- jsx_bracket_same_line = false,
		print_width = 80,
		prose_wrap = "preserve",
		quote_props = "as-needed",
		semi = false,
		single_attribute_per_line = true,
		single_quote = true,
		tab_width = 2,
		trailing_comma = "es5",
		use_tabs = false,
	},
})

mason_nullls.setup_handlers({})
