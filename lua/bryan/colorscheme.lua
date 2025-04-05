local M = {
  "folke/tokyonight.nvim",
}

M.config = function()
  require("tokyonight").setup({
    transparent = true,
  })
  vim.cmd([[colorscheme tokyonight]])
end

return M
