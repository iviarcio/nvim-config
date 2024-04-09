local M = {
  'williamboman/mason.nvim',
  opts = {
      ensure_installed = {
          "clangd",
          "clang-format",
          "cmake-language-server"
      }
  }
}

M.init = function()
    require("mason").setup()
end

return M
