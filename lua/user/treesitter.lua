local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
}

function M.config()
  local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
  
  parser_config.mlir = {
    install_info = {
      url = "https://github.com/artagnon/tree-sitter-mlir", 
      files = { "src/parser.c" },
    },
    filetype = "mlir",
  }

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
      additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
  })
end

return M
