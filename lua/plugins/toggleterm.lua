return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      persist_size = true,
      shade_terminals = true,
      shade_filetypes = {},
      shade_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      direction = "float",
      floats_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    },
  },
}
