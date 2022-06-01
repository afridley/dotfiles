--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "alduin"
-- lvim.builtin.lualine = {
--     active = false,
--     options = {
--         theme = "onedark"
--     }
-- }
lvim.builtin.treesitter.autotag = {
	enable = true,
}
lvim.builtin.treesitter.rainbow = {
	enable = true,
}
lvim.builtin.treesitter.context_commentstring = {
	enable = true,
}

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
-- lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"
lvim.keys.normal_mode["<S-x>"] = ":bd<CR>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
	-- for input mode
	i = {
		["<C-j>"] = actions.move_selection_next,
		["<C-k>"] = actions.move_selection_previous,
		["<C-n>"] = actions.cycle_history_next,
		["<C-p>"] = actions.cycle_history_prev,
	},
	-- for normal mode
	n = {
		["<C-j>"] = actions.move_selection_next,
		["<C-k>"] = actions.move_selection_previous,
	},
}

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
	name = "+Trouble",
	r = { "<cmd>Trouble lsp_references<cr>", "References" },
	f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
	d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
	q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
	l = { "<cmd>Trouble loclist<cr>", "LocationList" },
	w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
-- lvim.builtin.dashboard.active = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
-- vim.opt.tabstop = 4
-- vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.expandtab = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"c",
	"javascript",
	"json",
	"lua",
	"python",
	"typescript",
	"css",
	"rust",
	"java",
	"yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	--   { command = "black", filetypes = { "python" } },
	--   { command = "isort", filetypes = { "python" } },
	-- {
	--   -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
	--   command = "prettier",
	--   ---@usage arguments to pass to the formatter
	--   -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
	--   extra_args = { "--print-with", "100" },
	--   ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
	--   filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
	-- },
	{
		command = "stylua",
		filetypes = { "lua" },
	},

	{
		command = "eslint_d",
		-- args = {"--fix-to-stdout"},
		filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
	},
})

-- -- set additional linters
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{ command = "stylelint", filetypes = { "scss", "less", "css", "sass" }, args = { "--fix", "--stdin" } },
	{
		command = "eslint_d",
		-- args = {"--fix-to-stdout"},
		filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
	},
	--   { command = "flake8", filetypes = { "python" } },
	--   {
	--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
	--     command = "shellcheck",
	--     ---@usage arguments to pass to the formatter
	--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
	--     extra_args = { "--severity", "warning" },
	--   },
	--   {
	--     command = "codespell",
	--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
	--     filetypes = { "javascript", "python" },
	--   },
})

-- Additional Plugins
lvim.plugins = {
	{ "folke/tokyonight.nvim" },
	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
	},

	{ "p00f/nvim-ts-rainbow" },
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ "*" }, {
				RGB = true, -- #RGB hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				RRGGBBAA = true, -- #RRGGBBAA hex codes
				rgb_fn = true, -- CSS rgb() and rgba() functions
				hsl_fn = true, -- CSS hsl() and hsla() functions
				css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
				css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
			})
		end,
	},
	{
		"nvim-telescope/telescope-fzy-native.nvim",
		run = "make",
		event = "BufRead",
	},
	-- {
	--   "nvim-telescope/telescope-fzf-native.nvim",
	--   run = "make",
	--   after = "telescope.nvim",
	--   config = function()
	--     require("telescope").load_extension "fzf"
	--   end,
	-- },
	{ "navarasu/onedark.nvim" },
	-- "agreco/vim-citylights",
	"jordanbrauer/citylights.nvim",
	"tjdevries/colorbuddy.vim",
	-- Non essential
	{
		"ray-x/lsp_signature.nvim",
		config = function()
			require("lsp_signature").on_attach()
		end,
		event = "InsertEnter",
	},

	{ "sainnhe/everforest" },
	-- {"gruvbox-community/gruvbox"},
	-- {"mhartington/oceanic-next"},
	{ "AlessandroYorba/Alduin" },
	-- { "lukas-reineke/indent-blankline.nvim" },
	{ "franbach/miramare" },
	{ "savq/melange" },
	{ "sainnhe/gruvbox-material" },
	-- {"ajmwagar/vim-deus"},
	{ "theniceboy/nvim-deus" },
	{ "glepnir/oceanic-material" },
	{ "AlessandroYorba/Despacio" },
	{ "wojciechkepka/bogster" },
	-- {"kwsp/halcyon-neovim"}, --I wish
	-- {"ronny/birds-of-paradise.vim"}, --artifact
	{ "UnikMask/iroh-vim" },
	{ "yashguptaz/calvera-dark.nvim" },
	-- {"marreman/tsen-magenta-yellow"}, --would require manual
	{ "ayu-theme/ayu-vim" },
	{ "fcpg/vim-farout" },
	{ "machakann/vim-sandwich" },
	-- {"lukas-reineke/indent-blankline.nvim"},
	{
		"kevinhwang91/nvim-bqf",
		event = { "BufRead", "BufNew" },
		config = function()
			require("bqf").setup({
				auto_enable = true,
				preview = {
					win_height = 12,
					win_vheight = 12,
					delay_syntax = 80,
					border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
				},
				func_map = {
					vsplit = "",
					ptogglemode = "z,",
					stoggleup = "",
				},
				filter = {
					fzf = {
						action_for = { ["ctrl-s"] = "split" },
						extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
					},
				},
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	-- "TarunDaCoder/citylights.nvim",
	-- {
	--   "JoosepAlviste/nvim-ts-context-commentstring",
	--   event = "BufRead",
	-- },
}
vim.cmd(":set clipboard=unnamedplus")
-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
	-- { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
	-- {"BufWrite", "*", "eslint_d --fix"}
}
-- vim.g.indent_blankline_buftype_exclude = { "terminal" }
-- vim.g.indent_blankline_filetype_exclude = {
-- 	"man",
-- 	"help",
-- 	"startify",
-- 	"dashboard",
-- 	"packer",
-- 	"neogitstatus",
-- 	"markdown",
-- }
-- vim.g.indent_blankline_char = "▏"
-- vim.g.indent_blankline_use_treesitter = true
-- vim.g.indent_blankline_show_trailing_blankline_indent = false
-- vim.g.indent_blankline_show_current_context = true
-- vim.g.indent_blankline_context_patterns = {
-- 	"class",
-- 	"return",
-- 	"function",
-- 	"method",
-- 	"^if",
-- 	"^while",
-- 	"jsx_element",
-- 	"^for",
-- 	"^object",
-- 	"^table",
-- 	"block",
-- 	"arguments",
-- 	"if_statement",
-- 	"else_clause",
-- 	"jsx_element",
-- 	"jsx_self_closing_element",
-- 	"try_statement",
-- 	"catch_clause",
-- 	"import_statement",
-- 	"operation_type",
-- }

lvim.transparent_window = true
vim.g.tokyonight_style = "storm"
vim.g.tokyonight_italic_functions = true
vim.g.everforest_background = "hard" -- soft medium hard
vim.g.gruvbox_material_background = "soft"
vim.g.gruvbox_material_enable_italic = 1
vim.cmd('let ayucolor="mirage"')
-- vim.g.gruvbox_material_cursor = 'green'
vim.g.gruvbox_material_palette = "mix" --'material'`, `'mix'`, `'original'
-- vim.g.neovide_cursor_animation_length=0.05
-- vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.neovide_cursor_vfx_mode = "ripple"
