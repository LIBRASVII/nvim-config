return {
  -- measure startuptime
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },
  -- ui components
  {
    "MunifTanjim/nui.nvim", lazy = true
  },
  -- lsp symbol navigation for lualine
  {
    "SmiteshP/nvim-navic",
    opts = function()
      return {
        separator = " ",
        highlight = true,
        depth_limit = 5,
        icons = require("lazyvim.config").icons.kinds,
      }
    end,
  },
  -- This plugin adds indentation guides to all lines (including empty lines).
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      -- char = "▏",
      char = "│",
      filetype_exclude = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      },
      show_trailing_blankline_indent = false,
      show_current_context = true,
    },
  },
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
      opts = { --[[ things you want to change go here]]
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
    "nvim-lua/plenary.nvim", lazy = true
  },
  -- adds icons for plugins
  {
    "nvim-tree/nvim-web-devicons", lazy = true
  },
  -- -- automatically saving your work whenever you make changes to it
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
        add = "gza",            -- Add surrounding in Norma and Visua modes
        delete = "gzd",         -- Delete surrounding
        find = "gzf",           -- Find surrounding (to the right)
        find_left = "gzF",      -- Find surrounding (to the left)
        highlight = "gzh",      -- Highlight surrounding
        replace = "gzr",        -- Replace surrounding
        update_n_lines = "gzn", -- Update `n_lines`
      },
    },
  },
}
