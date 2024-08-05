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
lvim.colorscheme = "zenburn"
-- lvim.builtin.lualine = {
--     active = false,
--     options = {
--         theme = "onedark"
--     }
-- }
-- lvim.builtin.treesitter.autotag = {
-- 	enable = true,
-- }
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
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope = {
	active = true,
	defaults = {
		layout_strategy = "horizontal",
		path_display = { truncate = 2 },
	},
}
-- Show previewer when searching git files with default <leader>f
lvim.builtin.which_key.mappings["f"] = {
	require("lvim.core.telescope.custom-finders").find_project_files,
	"Find File",
}
-- Show previewer when searching buffers with <leader>bf
lvim.builtin.which_key.mappings.b.f = {
	"<cmd>Telescope buffers<cr>",
	"Find",
}
lvim.builtin.telescope.defaults.layout_strategy = "horizontal"
lvim.builtin.telescope.defaults.borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
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
	d = { "<cmd>Trouble diagnostics<cr>", "Diagnostics" },
	q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
	l = { "<cmd>Trouble loclist<cr>", "LocationList" },
	w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
}
lvim.builtin.which_key.mappings["a"] = {
	name = "Actions",
	a = { "<cmd>Lspsaga code_action<cr>", "code action" },
	d = { "<cmd>Lspsaga peek_definition<cr>", "peek Definitions" },
	D = { "<cmd>Lspsaga peek_type_definition<cr>", "peek Type definitions" },
	o = { "<cmd>Lspsaga outline<cr>", "outline" },
	r = { "<cmd>Lspsaga rename<cr>", "replace" },
	f = { "<cmd>Lspsaga finder<cr>", "Find r and i" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
-- lvim.builtin.dashboard.active = true
-- lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.terminal.open_mapping = "<c-t>"
lvim.builtin.nvimtree.setup.view.side = "left"
-- lvim.builtin.telescope = {
-- 	active = true,
-- 	defaults = {
-- 		layout_strategy = "horizontal",
-- 		path_display = { truncate = 2 },
-- 	},
-- }
-- lvim.builtin.nvimtree.show_icons.git = 0
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
	"graphql",
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

local graphql_lsp_opts = {
	filetypes = { "graphql", "typescriptreact", "javascriptreact", "typescript", "javascript" },
}

local tailwind_opts = {
	settings = {
		tailwindCSS = {
			experimental = {
				classRegex = {
					"tv\\(([^)]*)\\)",
					"[\"'`]([^\"'`]*).*?[\"'`]",
				},
			},
		},
	},
}

require("lvim.lsp.manager").setup("tailwindcss", tailwind_opts)

require("lvim.lsp.manager").setup("graphql", graphql_lsp_opts)

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
		command = "prettier",
		filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
	},
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
	{
		"smoka7/multicursors.nvim",
		event = "VeryLazy",
		dependencies = {
			"smoka7/hydra.nvim",
		},
		opts = {},
		cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
		keys = {
			{
				mode = { "v", "n" },
				"<Leader>m",
				"<cmd>MCstart<cr>",
				desc = "Create a selection for selected text or word under the cursor",
			},
		},
	},
	{ "folke/tokyonight.nvim" },
	{
		"rose-pine/neovim",
		config = function()
			require("rose-pine").setup({
				variant = "moon",
				-- dark_varient = "moon",
			})
		end,
	},
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("lspsaga").setup({})
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons", -- optional
		},
	},
	-- {
	-- 	"nvimdev/lspsaga.nvim",
	-- 	after = "nvim-lspconfig",
	-- 	config = function()
	-- 		require("lspsaga").setup({})
	-- 	end,
	-- },
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		-- keys = {
		--   {
		--     "<leader>xx",
		--     "<cmd>Trouble diagnostics toggle<cr>",
		--     desc = "Diagnostics (Trouble)",
		--   },
		--   {
		--     "<leader>xX",
		--     "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
		--     desc = "Buffer Diagnostics (Trouble)",
		--   },
		--   {
		--     "<leader>cs",
		--     "<cmd>Trouble symbols toggle focus=false<cr>",
		--     desc = "Symbols (Trouble)",
		--   },
		--   {
		--     "<leader>cl",
		--     "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
		--     desc = "LSP Definitions / references / ... (Trouble)",
		--   },
		--   {
		--     "<leader>xL",
		--     "<cmd>Trouble loclist toggle<cr>",
		--     desc = "Location List (Trouble)",
		--   },
		--   {
		--     "<leader>xQ",
		--     "<cmd>Trouble qflist toggle<cr>",
		--     desc = "Quickfix List (Trouble)",
		--   },
		-- },
	},
	-- { "HiPhish/nvim-ts-rainbow2" },
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
	-- {
	-- 	"nvim-telescope/telescope-fzy-native.nvim",
	-- 	build = "make",
	-- 	event = "BufRead",
	-- },
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		after = "telescope.nvim",
		config = function()
			require("telescope").load_extension("fzf")
		end,
	},
	-- {
	-- 	"xero/miasma.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd("colorscheme miasma")
	-- 	end,
	-- },
	-- This is inspired by miasma but better
	{
		"ptdewey/darkearth-nvim",
		priority = 1000,
	},
	{ "navarasu/onedark.nvim" },
	-- "agreco/vim-citylights",
	"jordanbrauer/citylights.nvim",
	"tjdevries/colorbuddy.vim",
	-- Non essential
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
	-- NEW
	{ "marko-cerovac/material.nvim" },
	{
		"rmehri01/onenord.nvim",
		-- config = function()
		-- 	require("zenburn").setup({
		-- 		styles = {
		-- 			keywords = "italic",
		-- 			functions = "italic",
		-- 			comments = "italic",
		-- 		},
		-- 	})
		-- end,
	},
	{ "frenzyexists/aquarium-vim" },
	-- { "rose-pine/neovim" },
	{ "rebelot/kanagawa.nvim" },
	{ "phha/zenburn.nvim" }, -- needs config
	{ "shaunsingh/moonlight.nvim" },
	{ "RRethy/nvim-base16" },
	-- End themes
	{ "machakann/vim-sandwich" },
	-- { "lukas-reineke/indent-blankline.nvim" },
	-- {
	-- 	"ray-x/lsp_signature.nvim",
	-- 	config = function()
	-- 		require("lsp_signature").on_attach()
	-- 	end,
	-- 	event = "InsertEnter",
	-- },
	{
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		config = function()
			require("lsp_signature").on_attach()
		end,
	},
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
	{
		"karb94/neoscroll.nvim",
		event = "WinScrolled",
		config = function()
			require("neoscroll").setup({
				-- All these keys will be mapped to their corresponding default scrolling animation
				mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
				hide_cursor = true, -- Hide cursor while scrolling
				stop_eof = true, -- Stop at <EOF> when scrolling downwards
				use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
				respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
				cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
				easing_function = nil, -- Default easing function
				pre_hook = nil, -- Function to run before the scrolling animation starts
				post_hook = nil, -- Function to run after the scrolling animation ends
			})
		end,
	},
	{
		"folke/todo-comments.nvim",
		event = "BufRead",
		config = function()
			require("todo-comments").setup()
		end,
	},
}
vim.cmd(":set clipboard=unnamedplus")
-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
-- { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- {"BufWrite", "*", "eslint_d --fix"}
-- }
lvim.builtin.indentlines.options.filetype_exclude = {
	"man",
	"help",
	"startify",
	"dashboard",
	"packer",
	"neogitstatus",
	"markdown",
}
lvim.builtin.indentlines.options.buftype_exclude = { "terminal" }
lvim.builtin.indentlines.options.show_current_context = true
lvim.builtin.indentlines.options.use_treesitter = true

------- If lvim removes blankline again
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

-- Theme palette config
vim.g.tokyonight_style = "storm"
vim.g.everforest_background = "hard" -- soft medium hard
vim.g.gruvbox_material_background = "soft"
vim.g.gruvbox_material_palette = "mix" --'material'`, `'mix'`, `'original'
-- vim.g.gruvbox_material_cursor = 'green'
-- vim.g.neovide_cursor_animation_length=0.05
-- vim.g.neovide_cursor_vfx_mode = "railgun"
vim.cmd('let ayucolor="mirage"')

-- italics
vim.g.miramare_enable_italic = true
vim.g.moonlight_italic_comments = true
vim.g.moonlight_italic_keywords = true
vim.g.moonlight_italic_functions = true
vim.g.moonlight_italic_variables = false
vim.g.calvera_italic_comments = true
vim.g.calvera_italic_keywords = true
vim.g.calvera_italic_functions = true
vim.g.tokyonight_italic_functions = true
vim.g.gruvbox_material_enable_italic = true

vim.g.neovide_cursor_vfx_mode = "ripple"
vim.g.neovide_transparency = 0.8
vim.opt.guifont = "Space Code:h18"
