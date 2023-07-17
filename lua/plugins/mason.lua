return {
  -- allows you to easily manage external editor tooling such as LSP servers,
  -- DAP servers, linters, and formatters through a single interface
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    opts = {
      function(_, opts)
        table.insert(opts.ensure_installed, "prettierd")
      end,
    },
  },
}
