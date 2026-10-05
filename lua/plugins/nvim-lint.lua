return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },

    config = function()
      local lint = require("lint")

      lint.linters_by_ft = {
        swift = { "swiftlint" },
      }

      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave", "TextChanged" }, {
        group = lint_augroup,

        callback = function()
          local filename = vim.api.nvim_buf_get_name(0)

          if not vim.endswith(filename, "swiftinterface") then
            lint.try_lint()
          end
        end,
      })

      vim.keymap.set("n", "<leader>ml", function()
        lint.try_lint()
      end, {
        desc = "Lint file",
      })
    end,
  },
}
