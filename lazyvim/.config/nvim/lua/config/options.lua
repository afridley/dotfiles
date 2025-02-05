-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- lvim.transparent_window = true

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
-- local graphql_lsp_opts = {
-- 	filetypes = { "graphql", "typescriptreact", "javascriptreact", "typescript", "javascript" },
-- }
--
-- local tailwind_opts = {
-- 	settings = {
-- 		tailwindCSS = {
-- 			experimental = {
-- 				classRegex = {
-- 					"tv\\(([^)]*)\\)",
-- 					"[\"'`]([^\"'`]*).*?[\"'`]",
-- 				},
-- 			},
-- 		},
-- 	},
-- }
--
-- require("lvim.lsp.manager").setup("tailwindcss", tailwind_opts)
--
-- require("lvim.lsp.manager").setup("graphql", graphql_lsp_opts)
