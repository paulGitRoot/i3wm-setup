return {
  'rjshkhr/shadow.nvim',
  lazy = false,
  priority = 2000,
  config = function()
    vim.opt.termguicolors = true
    vim.cmd.colorscheme 'shadow'
  end,
}
