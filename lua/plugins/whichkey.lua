local wk = require("which-key")

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
    wk.register({
      ["<leader>"] = {
        C = {
          name = "+crates",
          t = { "<cmd>Crates toggle<cr>", "Toggle" },
          r = { "<cmd>Crates reload<cr>", "Reload" },
          v = { "<cmd>Crates show_version_popup<cr>", "Show Version" },
          f = { "<cmd>Crates show_features_popup<cr>", "Show Features" },
          d = { "<cmd>Crates show_dependencies_popup<cr>", "Show Dependencies" },
          u = { "<cmd>Crates update_crates<cr>", "Update" },
          a = { "<cmd>Crates update_all_crates<cr>", "Update All" },
          U = { "<cmd>Crates upgrade_crates<cr>", "Upgrade" },
          A = { "<cmd>Crates upgrade_all_crates<cr>", "Upgrade All" },
          e = { "<cmd>Crates expand_plain_crates_to_inline_table<cr>", "Expand Plain Inline Table" },
          E = { "<cmd>Crates extract_crates_into_table<cr>", "Extract Into Table" },
          H = { "<cmd>Crates open_homepage<cr>", "Open Homepage" },
          R = { "<cmd>Crates Open_repository<cr>", "Open Repository" },
          D = { "<cmd>Crates open_documentation<cr>", "Open Documentation" },
          C = { "<cmd>Crates open_crates_io<cr>", "Open Crates IO" },
        }
      }
    })
  },
}
