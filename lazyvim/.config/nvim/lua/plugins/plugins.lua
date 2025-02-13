return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "enter",
        ["<C-j>"] = { "select_next" },
        ["<C-k>"] = { "select_prev" },
      },
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
      },
    },
  },
  {
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
    "tiagovla/tokyodark.nvim",
    config = function()
      require("tokyodark").setup({
        styles = {
          comments = { italic = true }, -- style for comments
          keywords = { italic = true }, -- style for keywords
          identifiers = { italic = true }, -- style for identifiers
          functions = { italic = true }, -- style for functions
          variables = { italic = true }, -- style for variables
        },
      }) -- calling setup is optional
      -- vim.cmd([[colorscheme tokyodark]])
    end,
  },
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nordic").setup({
        -- Enable bold keywords.
        bold_keywords = true,
        -- Enable italic comments.
        italic_comments = true,
        -- Enable editor background transparency.
        transparent = {
          -- Enable transparent background.
          bg = true,
          -- Enable transparent background for floating windows.
          float = false,
        },
      })
    end,
  },
  {
    "nvim-pack/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup({
        replace_engine = {
          ["sed"] = {
            cmd = "sed",
            args = {
              "-i",
              "",
              "-E",
            },
          },
        },
      })
    end,
  },

  -- { "folke/tokyonight.nvim" },
  {
    "rose-pine/neovim",
    config = function()
      require("rose-pine").setup({
        variant = "moon",
        -- dark_varient = "moon",
      })
    end,
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
  { "frenzyexists/aquarium-vim" },
  -- { "rose-pine/neovim" },
  { "rebelot/kanagawa.nvim" },
  { "phha/zenburn.nvim" }, -- needs config
  { "shaunsingh/moonlight.nvim" },
  { "RRethy/nvim-base16" },
}
