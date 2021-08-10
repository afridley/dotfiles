-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "miramare"

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
  {"blackCauldron7/surround.nvim",
    config = function()
    require "surround".setup {}
    end
  },
  {"norcalli/nvim-colorizer.lua",
    config = function ()
      require 'colorizer'.setup()
    end
  },
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
  -- {"glepnir/lspsaga.nvim"}

  -- {"benbusby/vim-earthbound-themes"} -- wow thats not great

  -- {"Domino881/kuczy"} --artifact
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

lvim.lang.javascript.linters = {
  {
    exe = "eslint", -- can be eslint_d as well
    args = {
      eslint_enable_code_actions = true
    },
  },
}
lvim.lang.javascriptreact.linters = {
  {
    exe = "eslint", -- can be eslint_d as well
    args = {
      eslint_enable_code_actions = true
    },
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

lvim.lang.typescript.linters = {
  {
    exe = "eslint", -- can be eslint_d as well
    args = {
      eslint_enable_code_actions = true
    },
  },
}
lvim.lang.typescriptreact.linters = {
  {
    exe = "eslint", -- can be eslint_d as well
    args = {
      eslint_enable_code_actions = true
    },
  },
}

-- lvim.transparent_window = true
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
  lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
  lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
  lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
  lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
  lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
end
-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
