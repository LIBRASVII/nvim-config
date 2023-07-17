return {
  -- clangd_extensions.nvim
  {
    "p00f/clangd_extensions.nvim",
    opts = {
      extensions = {
        inlay_hints = {
          inline = false,
        },
        ast = {
          --These require codicons (https://github.com/microsoft/vscode-codicons)
          role_icons = {
            type = "",
            declaration = "",
            expression = "",
            specifier = "",
            statement = "",
            ["template argument"] = "",
          },
          kind_icons = {
            Compound = "",
            Recovery = "",
            TranslationUnit = "",
            PackExpansion = "",
            TemplateTypeParm = "",
            TemplateTemplateParm = "",
            TemplateParamObject = "",
          },
        },
      },
    },
  },
  -- Use Neovim as a language server to inject LSP diagnostics,
  -- code actions, and more via Lua.
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = {
      function(_, opts)
        local nls = require("null-ls")
        table.insert(opts.sources, nls.builtins.formatting.prettierd)
      end,
    },
  },
  -- -- allows you to easily manage external editor tooling such as LSP servers, DAP servers,
  -- -- linters, and formatters through a single interface
  -- {
  --   "williamboman/mason.nvim",
  --   opts = function(_, opts)
  --     table.insert(opts.ensure_installed, "prettierd")
  --   end,
  -- },

  -- -- Debug Adapter Protocol client implementation
  -- {
  --   "mfussenegger/nvim-dap",
  --
  --   dependencies = {
  --     --  is an adapter for the Neovim lua language
  --     {
  --       "jbyuki/one-small-step-for-vimkind",
  --     -- stylua: ignore
  --     keys = {
  --       { "<leader>daL", function() require("osv").launch({ port = 8086 }) end, desc = "Adapter Lua Server" },
  --       { "<leader>dal", function() require("osv").run_this() end, desc = "Adapter Lua" },
  --     },
  --       config = function()
  --         local dap = require("dap")
  --         dap.adapters.nlua = function(callback, config)
  --           callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
  --         end
  --         dap.configurations.lua = {
  --           {
  --             type = "nlua",
  --             request = "attach",
  --             name = "Attach to running Neovim instance",
  --           },
  --         }
  --       end,
  --     },
  --
  --     -- fancy UI for the debugger
  --     {
  --       "rcarriga/nvim-dap-ui",
  --     -- stylua: ignore
  --     keys = {
  --       { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
  --       { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
  --     },
  --       opts = {},
  --       config = function(_, opts)
  --         local dap = require("dap")
  --         local dapui = require("dapui")
  --         dapui.setup(opts)
  --         dap.listeners.after.event_initialized["dapui_config"] = function()
  --           dapui.open({})
  --         end
  --         dap.listeners.before.event_terminated["dapui_config"] = function()
  --           dapui.close({})
  --         end
  --         dap.listeners.before.event_exited["dapui_config"] = function()
  --           dapui.close({})
  --         end
  --       end,
  --     },

  --   -- virtual text for the debugger
  --   {
  --     "theHamsta/nvim-dap-virtual-text",
  --     opts = {},
  --   },
  --
  --   -- which key integration
  --   {
  --     "folke/which-key.nvim",
  --     optional = true,
  --     opts = {
  --       defaults = {
  --         ["<leader>d"] = { name = "+debug" },
  --         ["<leader>da"] = { name = "+adapters" },
  --       },
  --     },
  --   },
  --
  --   -- mason.nvim integration
  --   {
  --     "jay-babu/mason-nvim-dap.nvim",
  --     dependencies = "mason.nvim",
  --     cmd = { "DapInstall", "DapUninstall" },
  --     opts = {
  --       -- Makes a best effort to setup the various debuggers with
  --       -- reasonable debug configurations
  --       automatic_installation = true,
  --
  --       -- You can provide additional configuration to the handlers,
  --       -- see mason-nvim-dap README for more information
  --       handlers = {},
  --
  --       -- You'll need to check that you have the required things installed
  --       -- online, please don't ask me how to install them :)
  --       ensure_installed = {
  --         -- Update this to ensure that you have the debuggers for the langs you want
  --       },
  --     },
  --   },
  -- },

  -- -- stylua: ignore
  -- keys = {
  --   { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
  --   { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
  --   { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
  --   { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
  --   { "<leader>dg", function() require("dap").goto_() end, desc = "Go to line (no execute)" },
  --   { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
  --   { "<leader>dj", function() require("dap").down() end, desc = "Down" },
  --   { "<leader>dk", function() require("dap").up() end, desc = "Up" },
  --   { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
  --   { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
  --   { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
  --   { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
  --   { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
  --   { "<leader>ds", function() require("dap").session() end, desc = "Session" },
  --   { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
  --   { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
  -- },
  --
  --   config = function()
  --     local Config = require("lazyvim.config")
  --     vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
  --
  --     for name, sign in pairs(Config.icons.dap) do
  --       sign = type(sign) == "table" and sign or { sign }
  --       vim.fn.sign_define(
  --         "Dap" .. name,
  --         { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
  --       )
  --     end
  --   end,
  -- },
  -- better yank/paste
  "gbprod/yanky.nvim",
  opts = function()
    local mapping = require("yanky.telescope.mapping")
    local mappings = mapping.get_defaults()
    mappings.i["<c-p>"] = nil
    return {
      highlight = { timer = 200 },
      ring = { storage = jit.os:find("Windows") and "shada" or "sqlite" },
      picker = {
        telescope = {
          use_default_mappings = false,
          mappings = mappings,
        },
      },
    }
  end,
  -- designed to make you better at vim by creating a game to practice basic movements in.
  {
    "ThePrimeagen/vim-be-good",
  },
  -- TODO: need more configuration
  -- Smart, directional Neovim split resizing and navigation
  {
    "mrjones2014/smart-splits.nvim",
  },

  -- TODO: need configuration the keybinds and more
  -- to persist and toggle multiple terminals during an editing session
  {
    -- amongst your other plugins
    { "akinsho/toggleterm.nvim", version = "*", config = true },
    -- or
    {
      "akinsho/toggleterm.nvim",
      version = "*",
      -- require("toggleterm")({
      opts = {--[[ things you want to change go here]]
      },
      -- }),
    },
  },
  -- colorschema
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  --  comments
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
  },

  -- All the lua functions I don't want to write twice.
  {
    "nvim-lua/plenary.nvim",
  },
  -- adds icons for plugins
  {
    "nvim-tree/nvim-web-devicons",
  },
  -- auto-pairs
  -- {
  --   "echasnovski/mini.pairs",
  --   event = "VeryLazy",
  --   opts = {},
  -- },
  -- auto completion
  {
    "hrsh7th/nvim-cmp",
    version = false,
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
    },
    opts = function()
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
      local cmp = require("cmp")
      local defaults = require("cmp.config.default")()
      return {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<S-CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
        formatting = {
          format = function(_, item)
            local icons = require("lazyvim.config").icons.kinds
            if icons[item.kind] then
              item.kind = icons[item.kind] .. item.kind
            end
            return item
          end,
        },
        experimental = {
          ghost_text = {
            hl_group = "CmpGhostText",
          },
        },
        sorting = defaults.sorting,
      }
    end,
  },

  -- automatically saving your work whenever you make changes to it
  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup()
    end,
  },

  -- snippets/Friendly Snippets
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
  },
  -- add symbols-outline
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    opts = {
      -- add your options that should be passed to the setup() function here
      position = "right",
    },
  },
  -- metrics, insights, and time tracking automatically generated from your programming activity
  -- okda
  {
    "wakatime/vim-wakatime",
  },

  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "gza", -- Add surrounding in Norma and Visua modes
        delete = "gzd", -- Delete surrounding
        find = "gzf", -- Find surrounding (to the right)
        find_left = "gzF", -- Find surrounding (to the left)
        highlight = "gzh", -- Highlight surrounding
        replace = "gzr", -- Replace surrounding
        update_n_lines = "gzn", -- Update `n_lines`
      },
    },
  },
}
