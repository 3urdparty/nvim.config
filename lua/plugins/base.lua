-- ~/.config/nvim/lua/plugins/fzf-lua.lua

return {
  {
    "ibhagwan/fzf-lua", -- Ensure this is the plugin specification
    opts = {
      files = {
        command = "rg --files --hidden --ignore-file=.gitignore",
      },
    },
  },

  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "gsa",
        delete = "gsd",
        find = "gsf",
        find_left = "gsF",
        highlight = "gsh",
        replace = "gsr",
        update_n_lines = "gsn",
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["javascript"] = { "eslint-lsp" },
        ["typescript"] = { "eslint-lsp" },
        ["javascriptreact"] = { "eslint-lsp" },
        ["typescriptreact"] = { "eslint-lsp" },
        ["vue"] = { "eslint-lsp" },
        ["css"] = { "prettier" },
        ["scss"] = { "prettier" },
        ["less"] = { "prettier" },
        ["html"] = { "prettier" },
        ["json"] = { "prettier" },
        ["jsonc"] = { "prettier" },
        ["astro"] = { "prettier" },
        ["yaml"] = { "prettier" },
        ["markdown"] = { "prettier" },
        ["markdown.mdx"] = { "prettier" },
        ["graphql"] = { "prettier" },
        ["xml"] = { "prettier" },
        ["php"] = { "prettier" },
        ["rs"] = { "ast-grep" },
      },
      formatters = {
        prettier = {
          env = {
            PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/.config/nvim/.prettierrc"),
          },
        },
      },
    },
  },
}
