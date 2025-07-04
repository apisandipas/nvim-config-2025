local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
}

M.init = function()
  vim.o.timeout = true
  vim.o.timeoutlen = 500
end

M.config = function()
  local wk = require("which-key")
  wk.add({
    { "<leader>q", "<cmd>confirm q<CR>", desc = "Quit" },
    { "<leader>h", "<cmd>nohlsearch<CR>", desc = "NOHL" },
    { "<leader>b", group = "+buffers" },
    --{ "<leader>ba", "<cmd>lua require('telescope.builtin').buffers()<CR>", desc = "List Buffers" },
    { "<leader>bw", "<cmd>w<CR>", desc = "Write Buffer" },
    { "<leader>bs", "<cmd>w<CR>", desc = "Save (Write) Buffer" },
    { "<leader>bd", "<cmd>lua require('bufdelete').bufdelete(0, true)<CR>", desc = "Delete Buffer" },
    { "<leader>bk", "<cmd>lua require('bufdelete').bufdelete(0, true)<CR>", desc = "Kill (Delete) Buffer" },
    { "<leader>bn", "<cmd>bn<CR>", desc = "Next Buffer" },
    { "<leader>bp", "<cmd>bp<CR>", desc = "Prev Buffer" },
    { "<leader>e", group = "+file explorer" },
    { "<leader>f", group = "+find" },
    { "<leader>a", group = "+AI" },
    { "<leader>g", group = "+git" },
    { "<leader>m", group = "+marks" },
    { "<leader>o", group = "+org" },
    { "<leader>s", group = "+search/splits" },
    { "<leader>t", group = "+tabs" },
    { "<leader>w", group = "+sessions" },
    { "<leader>p", group = "+plugins" },
    { "<leader>pp", "<cmd>Lazy<cr>", desc = "See Lazy UI" },
    { "<leader>pi", "<cmd>Lazy install<cr>", desc = "Install Plugins" },
    { "<leader>pu", "<cmd>Lazy update<cr>", desc = "Update Plugins" },
  })
end
return M
