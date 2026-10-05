return {
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      {
        "antosha417/nvim-lsp-file-operations",
        config = true,
      },
    },

    config = function()
      vim.lsp.config("sourcekit", {
        cmd = {
          vim.trim(vim.fn.system("xcrun -f sourcekit-lsp")),
        },

        root_dir = function(bufnr, callback)
          local filename = vim.api.nvim_buf_get_name(bufnr)

          local root = vim.fs.root(filename, {
            "Package.swift",
            ".git",
          })

          callback(root)
        end,
      })

      vim.lsp.enable("sourcekit")

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local opts = {
            buffer = event.buf,
            noremap = true,
            silent = true,
          }

          vim.keymap.set(
            "n",
            "<leader>d",
            vim.diagnostic.open_float,
            vim.tbl_extend("force", opts, {
              desc = "Show line diagnostics",
            })
          )

          vim.keymap.set(
            "n",
            "K",
            vim.lsp.buf.hover,
            vim.tbl_extend("force", opts, {
              desc = "Show documentation",
            })
          )

          vim.keymap.set(
            "n",
            "gd",
            "<cmd>Telescope lsp_definitions trim_text=true<cr>",
            vim.tbl_extend("force", opts, {
              desc = "Go to definition",
            })
          )
        end,
      })

      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = "󰠠 ",
            [vim.diagnostic.severity.INFO] = " ",
          },
        },
      })
    end,
  },
}
