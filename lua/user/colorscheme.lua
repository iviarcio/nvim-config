-- local M = {
--   -- "shaunsingh/nord.nvim",
--   "gbprod/nord.nvim",
--   lazy = false, -- make sure we load this during startup if it is your main colorscheme
--   priority = 1000, -- make sure to load this before all the other start plugins
-- }
--
-- function M.config()
--     require("Comment").setup({
--         transparent = true, -- Enable this to disable setting the background color
--     }),
--     vim.cmd.colorscheme "nord"
-- end
--
-- return M
--

local M = {
  "gbprod/nord.nvim",
  lazy = false, -- This ensures the plugin is loaded during startup, which is what you want for a colorscheme
  priority = 1000, -- Ensures this plugin is loaded before others
}

function M.config()
    -- Ensure nord is configured only if it's already loaded
    local status_ok, nord_color = pcall(require, "nord")
    if status_ok then
        nord_color.setup({
            transparent = true, -- Disable setting the background color
        })
    end

    -- Set the colorscheme
    vim.cmd("colorscheme nord")
end

return M
