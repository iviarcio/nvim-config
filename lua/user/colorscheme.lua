return {
  -- Nord Config
  {
    "gbprod/nord.nvim",
    lazy = false, -- Ensures the plugin is loaded during startup
    priority = 1000, -- Ensures this plugin is loaded before others
    config = function()
      require("nord").setup({
        transparent = true, -- Disable setting the background color
      }) 
      -- Set the default colorscheme
      vim.cmd.colorscheme("nord")
    end,
  },

  -- Tokyo Night Config
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "moon", -- Options: storm, moon, night, day
      transparent = false,
    },
  },

  -- Catppuccin Config
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
  },
}
