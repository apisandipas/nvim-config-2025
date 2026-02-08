-- Read theme from file written by theme-switcher
local function get_colorscheme()
  local theme_file = vim.fn.expand("~/.config/nvim/.colorscheme")
  local file = io.open(theme_file, "r")
  if file then
    local theme = file:read("*l")
    file:close()
    if theme and theme ~= "" then
      return theme
    end
  end
  return "rose-pine-moon" -- fallback
end

local function apply_colorscheme()
  local colorscheme = get_colorscheme()

  -- Handle variants that need special setup
  if colorscheme == "rose-pine-moon" then
    require("rose-pine").setup({ variant = "moon", styles = { transparency = true } })
    colorscheme = "rose-pine"
  elseif colorscheme == "rose-pine-dawn" then
    require("rose-pine").setup({ variant = "dawn", styles = { transparency = true } })
    colorscheme = "rose-pine"
  elseif colorscheme == "rose-pine-main" then
    require("rose-pine").setup({ variant = "main", styles = { transparency = true } })
    colorscheme = "rose-pine"
  elseif colorscheme == "gruvbox-light" then
    vim.o.background = "light"
    require("gruvbox").setup({ transparent_mode = true })
    colorscheme = "gruvbox"
  elseif colorscheme == "gruvbox" then
    vim.o.background = "dark"
    require("gruvbox").setup({ transparent_mode = true })
  elseif colorscheme == "nord-light" then
    vim.o.background = "light"
    colorscheme = "nord"
  elseif colorscheme == "nord" then
    vim.o.background = "dark"
  elseif colorscheme == "solarized-light" then
    vim.o.background = "light"
    vim.g.solarized_termtrans = 1
    colorscheme = "solarized"
  elseif colorscheme == "solarized" then
    vim.o.background = "dark"
    vim.g.solarized_termtrans = 1
  elseif colorscheme == "catppuccin-latte" then
    require("catppuccin").setup({ flavour = "latte", transparent_background = true })
    colorscheme = "catppuccin"
  elseif colorscheme == "catppuccin-mocha" then
    require("catppuccin").setup({ flavour = "mocha", transparent_background = true })
    colorscheme = "catppuccin"
  elseif colorscheme == "tokyonight-storm" then
    require("tokyonight").setup({ transparent = true, style = "storm" })
    colorscheme = "tokyonight"
  elseif colorscheme == "tokyonight-day" then
    require("tokyonight").setup({ transparent = true, style = "day" })
    colorscheme = "tokyonight"
  elseif colorscheme == "dracula" then
    require("dracula").setup({ transparent_bg = true })
  elseif colorscheme == "everforest" then
    vim.o.background = "dark"
    vim.g.everforest_transparent_background = 2
    vim.g.everforest_background = "medium"
  elseif colorscheme == "everforest-light" then
    vim.o.background = "light"
    vim.g.everforest_transparent_background = 2
    vim.g.everforest_background = "medium"
    colorscheme = "everforest"
  else
    -- Default setups
    require("rose-pine").setup({ styles = { transparency = true } })
    require("catppuccin").setup({ transparent_background = true })
    require("gruvbox").setup({ transparent_mode = true })
  end

  local ok, err = pcall(vim.cmd.colorscheme, colorscheme)
  if not ok then
    vim.notify("Colorscheme error: " .. colorscheme .. " - " .. err, vim.log.levels.ERROR)
    vim.cmd.colorscheme("default")
  end
end

return {
  { "folke/tokyonight.nvim", lazy = false, priority = 1000 },
  { "rose-pine/neovim", name = "rose-pine", lazy = false, priority = 1000 },
  { "catppuccin/nvim", name = "catppuccin", lazy = false, priority = 1000 },
  { "shaunsingh/nord.nvim", lazy = false, priority = 1000 },
  { "ellisonleao/gruvbox.nvim", lazy = false, priority = 1000 },
  {
    "ishan9299/nvim-solarized-lua",
    lazy = false,
    priority = 1000,
  },
  { "Mofiqul/dracula.nvim", lazy = false, priority = 1000 },
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = apply_colorscheme,
  },
}
