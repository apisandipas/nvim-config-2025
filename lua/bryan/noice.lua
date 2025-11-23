local M = {
  "folke/noice.nvim",
  event = "VeryLazy",
}

M.config = function()
  require("noice").setup()
end

return M
