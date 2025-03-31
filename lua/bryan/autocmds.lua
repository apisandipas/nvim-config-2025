local function augroup(name)
  return vim.api.nvim_create_augroup("bryan_" .. name, {})
end

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("checktime"),
  command = "checktime",
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- Show cursor line only in active window
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  group = augroup("auto_cursorline_show"),
  callback = function(event)
    if vim.bo[event.buf].buftype == "" then
      vim.opt_local.cursorline = true
    end
  end,
})
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
  group = augroup("auto_cursorline_hide"),
  callback = function()
    vim.opt_local.cursorline = false
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "NvimTree_*",
  callback = function()
    vim.opt.laststatus = 0 -- Hide Lualine
  end,
})

vim.api.nvim_create_autocmd("BufLeave", {
  pattern = "NvimTree_*",
  callback = function()
    vim.opt.laststatus = 2 -- Show Lualine
  end,
})

-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = "NvimTree_*",
--   callback = function()
--     local layout = vim.api.nvim_call_function("winlayout", {})
--     if layout[1] == "leaf" and vim.bo.filetype == "NvimTree" then
--       vim.cmd("quit")
--     end
--   end,
-- })
