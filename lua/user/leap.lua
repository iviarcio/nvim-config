local M = {
  "ggandor/leap.nvim",
  dependencies = { "tpope/vim-repeat", },
  lazy = false 
}

M.init = function()
    require("leap").add_default_mappings()
end

return M
