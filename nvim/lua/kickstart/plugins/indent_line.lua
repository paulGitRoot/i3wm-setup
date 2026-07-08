return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  opts = {
    char = '│', -- character for guide
    show_trailing_blankline_indent = false, -- don't show guides on empty lines
    show_first_indent_level = true, -- show first indent level
    filetype_exclude = { 'help', 'terminal' }, -- optional
  },
}
