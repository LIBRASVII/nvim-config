--  displays a popup with possible key bindings
--  of the command you started typing
return {
  {
    "folke/which-key.nvim",
    optional = true,
    -- dap which key integration
    opts = {
      defaults = {
        -- DAP
        ["<leader>d"] = { name = "+debug" },
        ["<leader>da"] = { name = "+adapters" },
        -- Neotest
        ["<leader>t"] = { name = "+test" },
      },
      -- noicer ui
      opts = function(_, opts)
        if require("lazyvim.util").has("noice.nvim") then
          opts.defaults["<leader>sn"] = { name = "+noice" }
        end
      end
    },
    -- mini-files
    keys = {
      {
        "<leader>fm",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = "Open mini.files (directory of current file)",
      },
      {
        "<leader>fM",
        function()
          require("mini.files").open(vim.loop.cwd(), true)
        end,
        desc = "Open mini.files (cwd)",
      },
    },
  }
}
