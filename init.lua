-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("gitsigns").setup()
-- require("catppuccin").setup()
require("toggleterm").setup()
require("mason").setup()
require("crates").setup()

require("indent_blankline").setup {
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
}

-- Show appropriate documentation in Cargo.toml
local function show_documentation()
  local filetype = vim.bo.filetype
  if vim.tbl_contains({ 'vim', 'help' }, filetype) then
    vim.cmd('h ' .. vim.fn.expand('<cword>'))
  elseif vim.tbl_contains({ 'man' }, filetype) then
    vim.cmd('Man ' .. vim.fn.expand('<cword>'))
  elseif vim.fn.expand('%:t') == 'Cargo.toml' and require('crates').popup_available() then
    require('crates').show_popup()
  else
    vim.lsp.buf.hover()
  end
end

vim.keymap.set('n', 'K', show_documentation, { silent = true })
