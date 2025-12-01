return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "night", -- Choose from "night", "storm", "moon", or "day"
  },
  config = function()
    vim.cmd.colorscheme "tokyonight"
  end,
}
