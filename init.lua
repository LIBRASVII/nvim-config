-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("gitsigns").setup()
-- require("catppuccin").setup()
require("toggleterm").setup()
require("mason").setup()

require("indent_blankline").setup {
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
}
