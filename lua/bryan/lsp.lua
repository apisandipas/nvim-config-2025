vim.lsp.enable {
  "ts_ls",
  "lua_ls", -- Lua
  "html_ls",
  --"biome", -- Biome = Eslint + Prettier
  "json", -- JSON
  --"pyright", -- Python
  --"gopls", -- Go
  "tailwindcss", -- Tailwind CSS
}

vim.diagnostic.config {
  virtual_lines = true,
}
