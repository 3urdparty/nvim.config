return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },

    opts = {
      formatters_by_ft = {
        swift = { "swiftformat" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
      },

      -- format_on_save = {
      --   timeout_ms = 500,
      --   lsp_format = "fallback",
      -- },

      log_level = vim.log.levels.ERROR,
    },

    -- keys = {
    --   {
    --     "<leader>mp",
    --     function()
    --       require("conform").format({
    --         async = false,
    --         timeout_ms = 500,
    --         lsp_format = "fallback",
    --       })
    --     end,
    --     mode = { "n", "v" },
    --     desc = "Format file or range",
    --   },
    -- },
  },
}
