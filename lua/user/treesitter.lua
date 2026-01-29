local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
}

function M.config()
  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "c",
      "cpp",
      "lua",
      "vim",
      "bash",
      "python",
      "regex",
      "markdown",
      "markdown_inline",
    },
    auto_install = true,

    highlight = {
      enable = true,
      -- Eu recomendo começar com false para evitar “double highlight”.
      -- Se você quiser manter regex do Vim como fallback, use true (não uma lista).
      additional_vim_regex_highlighting = false,
    },

    indent = { enable = true },
  })
end

return M
