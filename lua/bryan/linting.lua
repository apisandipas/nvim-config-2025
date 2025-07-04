local M = {
  "mfussenegger/nvim-lint",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
} -- to disable, comment this out

M.config = function()
  local lint = require("lint")
  local my_utils = require("bryan.my_utils")

  local linters_by_ft = {
    javascript = { "eslint_d" },
    typescript = { "eslint_d" },
    javascriptreact = { "eslint_d" },
    typescriptreact = { "eslint_d" },
  }

  local js_file_types = my_utils.get_keys(lint.linters_by_ft)

  local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

  vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    group = lint_augroup,
    callback = function(args)
      local filetype = vim.api.nvim_get_option_value("filetype", { buf = args.buf })
      local names_override = nil

      if vim.tbl_contains(js_file_types, filetype) then
        if require("lspconfig.util").root_pattern("eslint.config.mjs")(args.buf) then
          names_override = { "eslint_d" }
        end
      end
      lint.try_lint(names_override)
    end,
  })
end

return M
