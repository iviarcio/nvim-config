local M = {
    "lervag/vimtex",
    lazy = false,     -- we don't want to lazy load VimTeX
    -- tag = "v2.17", -- uncomment to pin to a specific release
}

M.init = function()
    -- Configuração para o Vimtex usar o Skim no macOS
    vim.g.vimtex_view_method = 'skim'
    -- Isso faz com que o Skim abra focado na linha atual ao compilar
    vim.g.vimtex_view_skim_sync = 1
    -- Ativa a atualização automática do PDF ao compilar
    vim.g.vimtex_view_skim_activate = 1
end

return M
