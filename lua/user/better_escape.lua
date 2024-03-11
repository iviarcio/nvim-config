local M = {
    "max397574/better-escape.nvim"
  }

M.config = function()
  require("better_escape").setup {
      mapping = {"jk", "jj", "kk"}, 
      timeout = vim.o.timeoutlen,
      clear_empty_lines = false, -- clear line after escaping if there is only whitespace
      keys = "<Esc>"
  }
end

return M
