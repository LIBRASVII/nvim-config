return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = { eslint = {} },
      setup = {
        eslint = function()
          require("lazyvim.util").on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
      {
        opts = {
          servers = {
            -- Ensure mason installs the server
            rust_analyzer = {
              keys = {
                { "K",          "<cmd>RustHoverActions<cr>", desc = "Hover Actions (Rust)" },
                { "<leader>cR", "<cmd>RustCodeAction<cr>",   desc = "Code Action (Rust)" },
                { "<leader>dr", "<cmd>RustDebuggables<cr>",  desc = "Run Debuggables (Rust)" },
              },
              settings = {
                ["rust-analyzer"] = {
                  cargo = {
                    allFeatures = true,
                    loadOutDirsFromCheck = true,
                    runBuildScripts = true,
                  },
                  -- Add clippy lints for Rust.
                  checkOnSave = {
                    allFeatures = true,
                    command = "clippy",
                    extraArgs = { "--no-deps" },
                  },
                  procMacro = {
                    enable = true,
                    ignored = {
                      ["async-trait"] = { "async_trait" },
                      ["napi-derive"] = { "napi" },
                      ["async-recursion"] = { "async_recursion" },
                    },
                  },
                },
              },
            },
            taplo = {
              keys = {
                {
                  "K",
                  function()
                    if vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
                      require("crates").show_popup()
                    else
                      vim.lsp.buf.hover()
                    end
                  end,
                  desc = "Show Crate Documentation",
                },
              },
            },
          },
          setup = {
            rust_analyzer = function(_, opts)
              local rust_tools_opts = require("lazyvim.util").opts("rust-tools.nvim")
              require("rust-tools").setup(vim.tbl_deep_extend("force", rust_tools_opts or {}, { server = opts }))
              return true
            end,
          },
        },
      },
      opts = {
        servers = {
          -- Ensure mason installs the server
          clangd = {
            keys = {
              { "<leader>cR", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
            },
            root_dir = function(...)
              -- using a root .clang-format or .clang-tidy file messes up projects, so remove them
              return require("lspconfig.util").root_pattern(
                "compile_commands.json",
                "compile_flags.txt",
                "configure.ac",
                ".git"
              )(...)
            end,
            capabilities = {
              offsetEncoding = { "utf-16" },
            },
            cmd = {
              "clangd",
              "--background-index",
              "--clang-tidy",
              "--header-insertion=iwyu",
              "--completion-style=detailed",
              "--function-arg-placeholders",
              "--fallback-style=llvm",
            },
            init_options = {
              usePlaceholders = true,
              completeUnimported = true,
              clangdFileStatus = true,
            },
          },
        },
        setup = {
          clangd = function(_, opts)
            local clangd_ext_opts = require("lazyvim.util").opts("clangd_extensions.nvim")
            require("clangd_extensions").setup(vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = opts }))
            return true
          end,
        },
      },
    },
  },
}
