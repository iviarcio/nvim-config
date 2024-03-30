local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
}

function M.config()
  require("nvim-treesitter").setup {
    ensure_installed = { "lua", "vim", "markdown", "markdown_inline", "bash", "python", "cpp" },
    ignore_install = {},
    highlight = {
      enable = true,
      disable = { 'help' },
      },
    indent = {
      enable = true
      },
    }
end

return M
