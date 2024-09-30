local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}

-- function M.config()
--     local wk = require "which-key"
--     wk.register {
--     { "", group = "Git" },
--     { "", "<leader>q", desc = "<cmd>confirm q<CR>" },
--     { "", "<leader>v", desc = "<cmd>vsplit<CR>" },
--     { "", desc = "<leader>x" },
--     { "", desc = "<leader>p" },
--     { "", "<leader>h", desc = "<cmd>nohlsearch<CR>" },
--     { "", group = "LSP" },
--     { "", "<leader>;", desc = "<cmd>terminal<CR>" },
--   }
-- end

return M
