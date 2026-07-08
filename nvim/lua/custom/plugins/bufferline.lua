-- custom/plugins/bufferline.lua
return {
  'akinsho/bufferline.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  opts = {
    options = {
      numbers = 'none',
      close_command = 'bdelete! %d',
      right_mouse_command = 'bdelete! %d',
      left_mouse_command = 'buffer %d',
      middle_mouse_command = nil,
      indicator = { style = 'underline' },
      buffer_close_icon = '',
      modified_icon = '●',
      left_trunc_marker = '',
      right_trunc_marker = '',
      max_name_length = 18,
      max_prefix_length = 15,
      tab_size = 18,
      show_buffer_close_icons = true,
      show_close_icon = false,
      enforce_regular_tabs = false,
      view = 'multiwindow',
    },
  },
}
