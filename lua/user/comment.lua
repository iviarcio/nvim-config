
local M = {-- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
    'numToStr/Comment.nvim',
    lazy = false,
}

M.init = function()
    require("Comment").setup({})

end

return M
