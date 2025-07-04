local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "nvim-lua/plenary.nvim",
  },
}

M.servers = {
  "eslint",
  "lua_ls",
  --"cssls",
  -- "html-lsp",
  "gopls",
  "ts_ls",
  "astro",
  "pyright",
  "bashls",
  -- "jsonls",
  "yamlls",
  "marksman",
  "tailwindcss",
}

function M.config()
  local wk = require("which-key")
  wk.add({
    { "<leader>lI", "<cmd>Mason<cr>", desc = "Mason Info" },
  })

  require("mason").setup({
    ui = {
      border = "rounded",
    },
  })
  require("mason-lspconfig").setup({
    ensure_installed = M.servers,
    automatic_installation = true,
  })
end

return M
