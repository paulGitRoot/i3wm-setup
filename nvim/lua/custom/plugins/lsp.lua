return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', build = ':MasonUpdate' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'hrsh7th/cmp-nvim-lsp' }, -- LSP → cmp bridge
    },

    config = function()
      local lspconfig = require 'lspconfig'

      -- Capabilities for nvim-cmp
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Mason setup
      require('mason').setup()
      require('mason-lspconfig').setup {
        ensure_installed = {
          'lua_ls',
          'rust_analyzer',
          'ts_ls',
          'html',
          'cssls',
          'jsonls',
          'yamlls',
          'bashls',
        },
      }

      -- ======================
      -- RUST (Intellisense + Clippy)
      -- ======================
      lspconfig.rust_analyzer.setup {
        capabilities = capabilities,
        settings = {
          ['rust-analyzer'] = {
            cargo = {
              allFeatures = true,
            },
            checkOnSave = {
              command = 'clippy',
            },
            diagnostics = {
              enable = true,
            },
          },
        },
      }

      -- ======================
      -- JAVASCRIPT / NODE / TS
      -- ======================
      lspconfig.tsserver.setup {
        capabilities = capabilities,
      }

      -- ======================
      -- LUA (Neovim config)
      -- ======================
      lspconfig.lua_ls.setup {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
          },
        },
      }

      -- ======================
      -- HTML / CSS / JSON /PYTHON
      -- ======================
      lspconfig.html.setup { capabilities = capabilities }
      lspconfig.cssls.setup { capabilities = capabilities }
      lspconfig.jsonls.setup { capabilities = capabilities }
      lspconfig.dartls.setup { capabilities = capabilities }
    end,
  },
}
