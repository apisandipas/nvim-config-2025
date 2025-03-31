local M = {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional - Diff integration

    -- Only one of these is needed.
    "nvim-telescope/telescope.nvim", -- optional
    "ibhagwan/fzf-lua", -- optional
    "echasnovski/mini.pick", -- optional
  },
  config = true,
}

M.config = function()
  local wk = require("which-key")

  wk.add({
    { "<leader>gc", "<cmd>Neogit" },
  })
end

return M
