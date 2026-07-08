return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = { 'BufReadPost', 'BufNewFile' },
  lazy = false, -- make sure it's loaded at startup
  config = function()
    require('nvim-treesitter.config').setup {
      ensure_installed = {
        'lua',
        'javascript',
        'typescript',
        'tsx',
        'html',
        'css',
        'json',
        'c',
        'cpp',
        'python',
        'c_sharp',
      },
      sync_install = false,
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    }
  end,
}
