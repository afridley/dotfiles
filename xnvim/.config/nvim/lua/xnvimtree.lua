local tree_cb = require'nvim-tree.config'.nvim_tree_callback
require'nvim-tree'.setup {
      open_on_setup = false,
      auto_close = true,
      open_on_tab = false,
      update_focused_file = {
        enable = true,
      },
      diagnostics = {
        enable = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      view = {
        width = 30,
        side = "left",
        auto_resize = false,
        mappings = {
          custom_only = false,
          list = {
{ key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
      { key = "h", cb = tree_cb "close_node" },
      { key = "v", cb = tree_cb "vsplit" },
      }
        },
      },
      ignore = { ".git", "node_modules", ".cache" },
       quit_on_open = 0,
    git_hl = 1,
    -- root_folder_modifier = ":t",
    allow_resize = 1,
      show_icons = {
      git = 1,
      -- folders = 1,
      -- files = 1,
      -- folder_arrows = 1,
      tree_width = 30,
         icons = {
      default = "",
      symlink = "",
      git = {
        unstaged = "",
        staged = "S",
        unmerged = "",
        renamed = "➜",
        deleted = "",
        untracked = "U",
        ignored = "◌",
      },
      folder = {
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
      },
    },
    },
}


