return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- vtsls = {
      --   -- typescript = {
      --   --   tsserver = {
      --   --     maxTsServerMemory = 8192,
      --   --   },
      --   -- },
      --   settings = {
      --     typescript = {
      --       preferences = {
      --         includePackageJsonAutoImports = "off",
      --       },
      --       tsserver = {
      --         maxTsServerMemory = 8192, --8192
      --       },
      --     },
      --     vtsls = {
      --       autoUseWorkspaceTsdk = false,
      --       experimental = {
      --         maxInlayHintLength = 30,
      --         completion = {
      --           entriesLimit = 10,
      --           enableServerSideFuzzyMatch = true,
      --         },
      --       },
      --     },
      --   },
      -- },
      graphql = {
        filetypes = { "graphql", "typescriptreact", "javascriptreact", "typescript", "javascript" },
      },
      tailwindcss = {
        settings = {
          tailwindCSS = {
            experimental = {
              classRegex = {
                { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
                { "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                { "cn\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
                { "([a-zA-Z0-9\\-:]+)" },
              },
            },
          },
        },
      },
    },
  },
}
