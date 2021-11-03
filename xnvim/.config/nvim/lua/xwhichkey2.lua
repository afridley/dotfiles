-- if not package.loaded['which-key'] then
--  return
-- end
local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end
-- utils.map('n', '<leader>dct', '<cmd>lua require"dap".continue()<CR>')
-- utils.map('n', '<leader>dsv', '<cmd>lua require"dap".step_over()<CR>')
-- utils.map('n', '<leader>dsi', '<cmd>lua require"dap".step_into()<CR>')
-- utils.map('n', '<leader>dso', '<cmd>lua require"dap".step_out()<CR>')
-- utils.map('n', '<leader>dtb', '<cmd>lua require"dap".toggle_breakpoint()<CR>')
-- 
-- utils.map('n', '<leader>dsc', '<cmd>lua require"dap.ui.variables".scopes()<CR>')
-- utils.map('n', '<leader>dhh', '<cmd>lua require"dap.ui.variables".hover()<CR>')
-- utils.map('v', '<leader>dhv',
--           '<cmd>lua require"dap.ui.variables".visual_hover()<CR>')
-- 
-- utils.map('n', '<leader>duh', '<cmd>lua require"dap.ui.widgets".hover()<CR>')
-- utils.map('n', '<leader>duf',
--           "<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>")
-- 
-- utils.map('n', '<leader>dsbr',
--           '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
-- utils.map('n', '<leader>dsbm',
--           '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>')
-- utils.map('n', '<leader>dro', '<cmd>lua require"dap".repl.open()<CR>')
-- utils.map('n', '<leader>drl', '<cmd>lua require"dap".repl.run_last()<CR>')
-- 
-- 
-- -- telescope-dap
-- utils.map('n', '<leader>dcc',
--           '<cmd>lua require"telescope".extensions.dap.commands{}<CR>')
-- utils.map('n', '<leader>dco',
--           '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>')
-- utils.map('n', '<leader>dlb',
--           '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>')
-- utils.map('n', '<leader>dv',
--           '<cmd>lua require"telescope".extensions.dap.variables{}<CR>')
-- utils.map('n', '<leader>df',
--           '<cmd>lua require"telescope".extensions.dap.frames{}<CR>')

which_key.setup {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ...
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
    spelling = { enabled = true, suggestions = 20 }, -- use which-key for spelling hints
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
  },
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
}

-- Set leader
  vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", { noremap = true, silent = true })
  vim.g.mapleader = " "

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

-- no hl
vim.api.nvim_set_keymap("n", "<Leader>h", ':let @/=""<CR>', { noremap = true, silent = true })

-- explorer

vim.api.nvim_set_keymap(
  "n",
  "<Leader>e",
  ":NvimTreeToggle<CR>",
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap("n", "<Leader>f", ":Telescope find_files<CR>", { noremap = true, silent = true })

-- dashboard
-- vim.api.nvim_set_keymap("n", "<Leader>;", ":Dashboard<CR>", { noremap = true, silent = true })

-- Comments
vim.api.nvim_set_keymap("n", "<leader>/", ":CommentToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>/", ":CommentToggle<CR>", { noremap = true, silent = true })

-- close buffer
vim.api.nvim_set_keymap("n", "<leader>c", ":BufferClose<CR>", { noremap = true, silent = true })

-- Save
vim.api.nvim_set_keymap("n", "<leader>w", ":w!<CR>", { noremap = true, silent = true })

-- Quit
vim.api.nvim_set_keymap("n", "<leader>q", ":q!<CR>", { noremap = true, silent = true })


local mappings = {
  ["w"] = "Save",
  ["q"] = "Quit",
  ["."] = "LunarConfig",
  ["/"] = "Comment",
  ["c"] = "Close Buffer",
  ["e"] = "Explorer",
  ["f"] = { "<cmd>Telescope find_files<CR>", "Find File" },
  ["h"] = "No Highlight",
  [";"] = "Dashboard",
  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },

  -- " Available Debug Adapters:
  -- "   https://microsoft.github.io/debug-adapter-protocol/implementors/adapters/
  -- " Adapter configuration and installation instructions:
  -- "   https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
  -- " Debug Adapter protocol:
  -- "   https://microsoft.github.io/debug-adapter-protocol/
  -- " Debugging
  g = {
    name = "Git",
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    C = {
      "<cmd>Telescope git_bcommits<cr>",
      "Checkout commit(for current file)",
    },
  },

  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = {
      "<cmd>Telescope lsp_document_diagnostics<cr>",
      "Document Diagnostics",
    },
    w = {
      "<cmd>Telescope lsp_workspace_diagnostics<cr>",
      "Workspace Diagnostics",
    },
    f = { "<cmd>Neoformat<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    j = { "<cmd>lua vim.lsp.diagnostic.goto_next({popup_opts = {border = O.lsp.popup_border}})<cr>", "Next Diagnostic" },
    k = { "<cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = O.lsp.popup_border}})<cr>", "Prev Diagnostic" },
    q = { "<cmd>Telescope quickfix<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    s = {
      "<cmd>SymbolsOutline<cr>" or "<cmd> Telescope lsp_document_symbols<cr>",
      "Document Symbols",
    },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
  },

  s = {
    name = "Search",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    t = { "<cmd>Telescope live_grep<cr>", "Text" },
  },
  T = {
    name = "Treesitter",
    i = { ":TSConfigInfo<cr>", "Info" },
  },
}

  mappings["t"] = {
    name = "Diagnostics",
    t = { "<cmd>TroubleToggle<cr>", "trouble" },
    w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "workspace" },
    d = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "document" },
    q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
    l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
    r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
  }

  vim.api.nvim_set_keymap("n", "<leader>o", ":SymbolsOutline<CR>", { noremap = true, silent = true })
  mappings["o"] = "Symbols outline"

  vim.api.nvim_set_keymap("n", "<leader>Th", ":TSHighlightCapturesUnderCursor<CR>", { noremap = true, silent = true })
  mappings[""] = "Highlight Capture"

  vim.api.nvim_set_keymap("n", "<leader>z", ":ZenMode<CR>", { noremap = true, silent = true })
  mappings["z"] = "Zen"
  -- open projects
  vim.api.nvim_set_keymap(
    "n",
    "<leader>P",
    ":lua require'telescope'.extensions.project.project{}<CR>",
    { noremap = true, silent = true }
  )
  mappings["P"] = "Projects"

  mappings["L"] = {
    name = "+Lush",
    l = { ":Lushify<cr>", "Lushify" },
    x = { ":lua require('lush').export_to_buffer(require('lush_theme.cool_name'))", "Lush Export" },
    t = { ":LushRunTutorial<cr>", "Lush Tutorial" },
    q = { ":LushRunQuickstart<cr>", "Lush Quickstart" },
  }

  vim.api.nvim_set_keymap("n", "<leader>gg", "<CMD>lua _G.__fterm_lazygit()<CR>", { noremap = true, silent = true })
  mappings["gg"] = "LazyGit"

-- for k, v in pairs(O.user_which_key) do
--   mappings[k] = v
-- end
--
--  nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
--     nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
--     nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
--     nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
--     nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
--     nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
--     nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
--     nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
--     nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>

  mappings["d"] = {
    name = "Debug",
    b = {":lua require'dap'.toggle_breakpoint()<CR>", "toggle break"},
    d = {":lua require'dap'.repl.open()<CR>", "repl open"},
    r = {":lua require'dap'.run_last()<CR>", "run last"},
    c = {":lua require'dap'.continue()", "continue"},
    n = {":lua require'dap'.step_over()", "step over"},
    i = {":lua require'dap'.step_into()", "step into"},
    o = {":lua require'dap'.step_out()", "step out"},
  }

local wk = require "which-key"
wk.register(mappings, opts)
