local M = {
  'dmmulroy/ts-error-translator.nvim'
  -- "pmizio/typescript-tools.nvim",
  -- dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
}

function M.config()
  require("ts-error-translator").setup()
  -- require("typescript-tools").setup({
  --   settings = {
  --     jsx_close_tag = {
  --       enable = true,
  --       filetypes = { "javascriptreact", "typescriptreact" },
  --     },
  --   },
  -- })
end

return M
