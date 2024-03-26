local M = {
  'williamboman/mason.nvim',
}

M.init = function()
    require("mason").setup()
end

return M
