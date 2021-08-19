-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "farout"
lvim.builtin.treesitter.autotag = {
  enable = true
}
lvim.builtin.treesitter.rainbow = {
  enable = true
}
lvim.builtin.treesitter.context_commentstring = {
  enable = true
}

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>lua require'telescope'.extensions.project.project{}<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- set a formatter if you want to override the default lsp one (if it exists)
-- lvim.lang.python.formatters = {
--   {
--     exe = "black",
--     args = {}
--   }
-- }
-- set an additional linter
-- lvim.lang.python.linters = {
--   {
--     exe = "flake8",
--     args = {}
--   }
-- }

--Additional Plugins
lvim.plugins = {
  {
    "ray-x/lsp_signature.nvim",
    config = function() require"lsp_signature".on_attach() end,
    event = "InsertEnter"
  },
  -- {"norcalli/nvim-colorizer.lua",
  --   config = function ()
  --     require 'colorizer'.setup()
  --   end
  -- },
  {"folke/tokyonight.nvim"},
  {"sainnhe/everforest"},
  -- {"gruvbox-community/gruvbox"},
  -- {"mhartington/oceanic-next"},
  {"AlessandroYorba/Alduin"},
  {"lukas-reineke/indent-blankline.nvim"},
  {"franbach/miramare"},
  {"savq/melange"},
  {"sainnhe/gruvbox-material"},
  -- {"ajmwagar/vim-deus"},
  {"theniceboy/nvim-deus"},
  {"glepnir/oceanic-material"},
  {"AlessandroYorba/Despacio"},
  {"wojciechkepka/bogster"},
  -- {"kwsp/halcyon-neovim"}, --I wish
  -- {"ronny/birds-of-paradise.vim"}, --artifact
  {"UnikMask/iroh-vim"},
  {"yashguptaz/calvera-dark.nvim"},
  -- {"marreman/tsen-magenta-yellow"}, --would require manual
  {"ayu-theme/ayu-vim"},
  {"fcpg/vim-farout"},
  {"navarasu/onedark.nvim"},
  {"qbbr/vim-twig"},
  {"glepnir/lspsaga.nvim"},
  {
    "folke/lsp-colors.nvim",
    event = "BufRead",
  },
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
  --   "karb94/neoscroll.nvim",
  --   event = "WinScrolled",
  --   config = function()
  --   require('neoscroll').setup({
  --         -- All these keys will be mapped to their corresponding default scrolling animation
  --         mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
  --         '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
  --         hide_cursor = true,          -- Hide cursor while scrolling
  --         stop_eof = true,             -- Stop at <EOF> when scrolling downwards
  --         use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
  --         respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
  --         cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
  --         easing_function = nil,        -- Default easing function
  --         pre_hook = nil,              -- Function to run before the scrolling animation starts
  --         post_hook = nil,              -- Function to run after the scrolling animation ends
  --         })
  --   end
  -- },
  -- {
  --   "nvim-telescope/telescope-fzy-native.nvim",
  --   run = "make",
  --   event = "BufRead",
  -- },
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
  -- {
  --   "tpope/vim-surround",
  --   keys = {"c", "d", "y"}
  -- },
  {"p00f/nvim-ts-rainbow"},
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "BufRead",
  },

  -- {"Domino881/kuczy"} --artifact
}

lvim.lang.javascript.linters = {
  {
    exe = "eslint", -- can be eslint_d as well
    args = {},
  },
}
lvim.lang.javascriptreact.linters = {
  {
    exe = "eslint", -- can be eslint_d as well
    args = {},
  },
}
lvim.lang.typescript.linters = {
  {
    exe = "eslint", -- can be eslint_d as well
    args = {},
  },
}
lvim.lang.typescriptreact.linters = {
  {
    exe = "eslint", -- can be eslint_d as well
    args = {},
  },
}
lvim.lang.javascript.formatters = {
  {
    exe = "prettier", -- can be prettierd eslint, or eslint_d as well
    args = {},
  },
}
lvim.lang.javascriptreact.formatters = {
  {
    exe = "prettier", -- can be prettierd eslint, or eslint_d as well
    args = {},
  },
}

lvim.lang.typescript.formatters = {
  {
    exe = "prettier", -- can be prettierd, eslint or eslint_d as well
    args = {},
  },
}
lvim.lang.typescriptreact.formatters = {
  {
    exe = "prettier", -- can be prettierd, eslint or eslint_d as well
    args = {},
  },
}


lvim.transparent_window = true
-- O.guifont = "JetBrainsMono Nerd Font"
vim.g.tokyonight_style = "storm"
vim.g.tokyonight_italic_functions = true
vim.g.everforest_background = "hard" -- soft medium hard
-- vim.g.gruvbox_contrast_dark = "soft"
vim.g.gruvbox_material_background = 'soft'
vim.g.gruvbox_material_enable_italic = 1
vim.cmd('let ayucolor="mirage"')
-- vim.g.gruvbox_material_cursor = 'green'
vim.g.gruvbox_material_palette = 'mix' --'material'`, `'mix'`, `'original'
-- vim.g.neovide_cursor_animation_length=0.05
-- vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.neovide_cursor_vfx_mode = "ripple"

vim.g.indent_blankline_buftype_exclude = {'terminal'}
vim.g.indent_blankline_filetype_exclude = {'man', 'help', 'startify', 'dashboard', 'packer', 'neogitstatus', 'markdown'}
vim.g.indent_blankline_char = '▏'
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_context_patterns = {
    'class', 'return', 'function', 'method', '^if', '^while', 'jsx_element', '^for', '^object', '^table', 'block',
    'arguments', 'if_statement', 'else_clause', 'jsx_element', 'jsx_self_closing_element', 'try_statement',
    'catch_clause', 'import_statement', 'operation_type'
}

-- vim.cmd("nnoremap <silent> <C-p> :lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = lvim.lsp.popup_border}})<CR>")
-- vim.cmd("nnoremap <silent> <C-n> :lua vim.lsp.diagnostic.goto_next({popup_opts = {border = lvim.lsp.popup_border}})<CR>")

vim.cmd("nnoremap <silent> ca :Lspsaga code_action<CR>")
vim.cmd("nnoremap <silent> K :Lspsaga hover_doc<CR>")
-- vim.cmd('nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>')
vim.cmd("nnoremap <silent> <C-p> :Lspsaga diagnostic_jump_prev<CR>")
vim.cmd("nnoremap <silent> <C-n> :Lspsaga diagnostic_jump_next<CR>")
-- scroll down hover doc or scroll in definition preview
vim.cmd("nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")
-- scroll up hover doc
vim.cmd("nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")

lvim.builtin.telescope.on_config_done = function()
  local actions = require "telescope.actions"
  -- for input mode
  lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
  lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
  lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
  lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
  -- for normal mode
  lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = actions.move_selection_next
  lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous
end
-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
