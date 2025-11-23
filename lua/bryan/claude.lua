local M = {
  "greggh/claude-code.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for git operations
  }
}

M.config = function()
  require("claude-code").setup()
  vim.keymap.set('n', '<leader>ac', '<cmd>ClaudeCode<CR>', { desc = 'Toggle Claude Code' })
  vim.keymap.set('n', '<leader>aC', '<cmd>ClaudeCodeContinue<CR>', { desc = 'Toggle Claude Code' })
end


return M
