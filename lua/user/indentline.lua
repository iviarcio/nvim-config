local M = {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  main = "ibl",
  opts = {}
}

function M.config()

  require("ibl").setup {
    indent = { char = "|" },
    scope = { enabled = false },
  }

end

return M
