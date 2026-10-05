return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",

    dependencies = {
      "windwp/nvim-ts-autotag",
    },

    config = function()
      local treesitter = require("nvim-treesitter")

      treesitter.setup()

      treesitter.install({
        "json",
        "yaml",
        "markdown",
        "markdown_inline",
        "lua",
        "gitignore",
        "swift",
      })

      -- Enable Tree-sitter highlighting for buffers with an available parser.
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })

      require("nvim-ts-autotag").setup()
    end,
  },
}
