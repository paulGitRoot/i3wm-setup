return {
  'akinsho/flutter-tools.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim', -- optional but recommended
  },
  config = function()
    require('flutter-tools').setup {}
  end,
}
