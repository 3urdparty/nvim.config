local defaultServers = {
  -- Vue 3
  volar = {
    init_options = {
      vue = {
        hybridMode = false,
      },
    },
    settings = {
      typescript = {
        inlayHints = {
          enumMemberValues = {
            enabled = true,
          },
          functionLikeReturnTypes = {
            enabled = true,
          },
          propertyDeclarationTypes = {
            enabled = true,
          },
          parameterTypes = {
            enabled = true,
            suppressWhenArgumentMatchesName = true,
          },
          variableTypes = {
            enabled = true,
          },
        },
      },
    },
  },
  -- TypeScript
  ts_ls = {
    init_options = {
      plugins = {
        {
          name = "@vue/typescript-plugin",
          location = vim.fn.stdpath("data") .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
          languages = { "vue" },
        },
      },
    },
    settings = {
      typescript = {
        tsserver = {
          useSyntaxServer = false,
        },
        inlayHints = {
          -- includeInlayParameterNameHints = "all",
          -- includeInlayParameterNameHintsWhenArgumentMatchesName = true,
          -- includeInlayFunctionParameterTypeHints = true,
          -- includeInlayVariableTypeHints = true,
          -- includeInlayVariableTypeHintsWhenTypeMatchesName = true,
          -- includeInlayPropertyDeclarationTypeHints = true,
          -- includeInlayFunctionLikeReturnTypeHints = true,
          -- includeInlayEnumMemberValueHints = true,
        },
      },
    },
  },
}
return {
  -- add tsserver and setup with typescript.nvim instead of lspconfig
  -- add pyright to lspconfig
  -- add tsserver and setup with typescript.nvim instead of lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      init = function()
        require("lazyvim.util").lsp.on_attach(function(_, buffer)
          -- stylua: ignore
          vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
          vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
        end)
      end,
    },
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = defaultServers, -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- example to setup with typescript.nvim
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
  },
}
