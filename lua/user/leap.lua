local M = {
  url = "https://codeberg.org/andyg/leap.nvim",
  -- "ggandor/leap.nvim",
  dependencies = { "tpope/vim-repeat", },
  lazy = false 
}

M.init = function()
  vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap)')
  vim.keymap.set('n',             'S', '<Plug>(leap-from-window)')
end

return M
