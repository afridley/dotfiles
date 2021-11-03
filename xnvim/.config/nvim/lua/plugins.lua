-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
--vim._update_package_paths()

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use "Pocco81/DAPInstall.nvim"
  use 'mfussenegger/nvim-dap'
  use { "hrsh7th/vim-vsnip", event = "InsertEnter" }
  use { "rafamadriz/friendly-snippets", event = "InsertEnter" }
  use 'nvim-lua/plenary.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  use {
      'neovim/nvim-lspconfig',
      'williamboman/nvim-lsp-installer',
  }
  use { 'tami5/lspsaga.nvim' } 
  use "folke/tokyonight.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    "ray-x/lsp_signature.nvim",
    config = function() require"lsp_signature".on_attach() end,
    event = "InsertEnter"
  }
  use {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  }
  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'},
    event = "BufWinEnter",
  }
  use {"folke/lsp-colors.nvim", event = "BufRead"}
  use {
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
  }
  use {
  "blackCauldron7/surround.nvim",
    config = function()
      -- vim.g.surround_prefix = "<c-s>"
      require("surround").setup({mappings_style = "sandwich"})
    end
  }
  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
    after = "telescope.nvim",
    config = function()
      require("telescope").load_extension "fzf"
    end,
  }
  use {
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
  }
  use {
  "folke/which-key.nvim",
  }
  use 'windwp/nvim-ts-autotag'
  use 'p00f/nvim-ts-rainbow'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
      use {
        "terrortylor/nvim-comment",
        cmd = "CommentToggle",
        config = function()
            require('nvim_comment').setup()
        end
    }
  use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
	config = function()
	  require'nvim-treesitter.configs'.setup {
		ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    matchup = {
        enable = true -- mandatory, false will disable the whole extension
        -- disable = { "c", "ruby" },  -- optional, list of language that will be disabled
    },
    highlight = {
        enable = true -- false will disable the whole extension
    },
    context_commentstring = {enable = true, config = {css = '// %s'}},
    -- indent = {enable = true, disable = {"python", "html", "javascript"}},
    -- TODO seems to be broken
    indent = {enable = {"javascriptreact"}},
    autotag = {enable = true},
    rainbow = { enable = true},
	  }
  end
  }
  use 'hrsh7th/nvim-compe'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
  }


end)

