local M = {}

M.filetypes = { "svelte" }

-- Optional: Add any specific settings for svelte-ls
M.settings = {
  svelte = {
    plugin = {
      html = { completions = { enable = true } },
      svelte = { completions = { enable = true } },
      css = { completions = { enable = true } }
    }
  }
}

-- Add this to help with diagnostics
M.on_attach = function(client, bufnr)
  -- Enable highlighting
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
    vim.api.nvim_clear_autocmds({ buffer = bufnr, group = "lsp_document_highlight" })
    vim.api.nvim_create_autocmd("CursorHold", {
      callback = vim.lsp.buf.document_highlight,
      buffer = bufnr,
      group = "lsp_document_highlight",
      desc = "Document Highlight",
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      callback = vim.lsp.buf.clear_references,
      buffer = bufnr,
      group = "lsp_document_highlight",
      desc = "Clear All the References",
    })
  end
end

return M
