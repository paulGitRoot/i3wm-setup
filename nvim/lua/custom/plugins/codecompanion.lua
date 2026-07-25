return {
  'olimorris/codecompanion.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-treesitter/nvim-treesitter' },
  opts = {
    adapters = {
      http = {
        omniroute = function()
          return require('codecompanion.adapters').extend('openai_compatible', {
            env = {
              url = 'http://localhost:20128',
              api_key = 'OMNIROUTE_API_KEY',
              chat_url = '/v1/chat/completions',
            },
            schema = {
              model = { default = 'oc/deepseek-v4-flash-free' },
            },
          })
        end,
      },
    },
    interactions = {
      chat = { adapter = 'omniroute' },
      inline = { adapter = 'omniroute' },
    },
  },
}
