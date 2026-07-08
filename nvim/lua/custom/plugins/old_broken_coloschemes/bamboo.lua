return -- Using lazy.nvim
{
  'ribru17/bamboo.nvim',
  lazy = false,
  priority = 2000,
  config = function()
    require('bamboo').setup {
      -- optional configuration here
    }
    require('bamboo').load()
  end,
}
