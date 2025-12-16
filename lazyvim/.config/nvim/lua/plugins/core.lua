local theme = "tokyodark"
return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        vim.cmd("colorscheme " .. theme)
      end,
    },
  },
}
