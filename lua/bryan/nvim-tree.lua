local M = {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}

M.config = function()
  local nvim_tree = require("nvim-tree")
  nvim_tree.setup({
    update_cwd = true,
    hijack_cursor = true,
    git = {
      ignore = false,
    },
    actions = {
      open_file = {
        resize_window = true,
      },
    },
    view = {
      width = 32,
      adaptive_size = true,
      centralize_selection = false,
      -- hide_root_folder = true,
      side = "left",
      preserve_window_proportions = false,
      number = false,
      relativenumber = false,
      signcolumn = "no",
      float = {
        enable = true,
        quit_on_focus_loss = true,
        open_win_config = {
          relative = "editor",
          border = "rounded",
          width = 30,
          height = 40,
          row = 1,
          col = 1,
        },
      },
    },
    renderer = {
      highlight_git = true,
      root_folder_modifier = ":t",
      icons = {
        glyphs = {
          default = "",
          symlink = "",
          bookmark = "◉",
          git = {
            unstaged = "",
            staged = "",
            unmerged = "",
            renamed = "",
            deleted = "",
            untracked = "",
            ignored = "",
          },
          folder = {
            default = "",
            open = "",
            symlink = "",
          },
        },
        show = {
          git = false,
          file = true,
          folder = true,
          folder_arrow = false,
        },
      },
      indent_markers = {
        enable = true,
      },
    },
  })

  local wk = require("which-key")
  wk.add({
    { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Explorer" },
  })
end

return M
