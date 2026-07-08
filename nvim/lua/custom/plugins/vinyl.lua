return {
  'kamwitsta/vinyl.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('vinyl').setup {
      variant = 'darker', -- the default is "lighter"
      overrides = {
        ['@string'] = { fg = '#00ff00' },
      },
    }
  end,
}
