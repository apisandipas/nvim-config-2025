local M = {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional - Diff integration
    "nvim-telescope/telescope.nvim", -- optional
  },
  config = true,
}

M.config = function()
  local wk = require("which-key")

  wk.add({
    { "<leader>gs", "<cmd>Neogit <cr>", desc = "Git Status" },
  })
end

return M
