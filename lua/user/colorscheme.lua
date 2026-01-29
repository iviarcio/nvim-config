-- local M = {
--   "gbprod/nord.nvim",
--   lazy = false, -- This ensures the plugin is loaded during startup, which is what you want for a colorscheme
--   priority = 1000, -- Ensures this plugin is loaded before others
-- }
--
-- -- function M.config()
-- --     -- Ensure nord is configured only if it's already loaded
-- --     local status_ok, nord_color = pcall(require, "nord")
-- --     if status_ok then
-- --         nord_color.setup({
-- --             transparent = true, -- Disable setting the background color
-- --         })
-- --     end
-- --
-- --     -- Set the colorscheme
-- --     vim.cmd("colorscheme nord")
-- -- end
--
-- function M.config()
--     require("nord").setup({
--     {
--         vim.cmd.colorscheme("nord")
--     },
--     install = {
--         colorscheme = { "nord" },
--     }})
-- end
--
-- return M

return {
  -- Configuração do Nord (Seu padrão)
  {
    "gbprod/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nord").setup({
        transparent = true, -- Ative se desejar o fundo transparente
      })
      vim.cmd.colorscheme("nord")
    end,
  },

  -- Configuração do Tokyo Night
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "moon", -- Opções: storm, moon, night, day
      transparent = false,
    },
  },
}
