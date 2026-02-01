return {
  "L3MON4D3/LuaSnip",
  version = "v2.4.1",
  config = function()
    local ls = require("luasnip")

    -- Carrega os snippets da pasta luasnippets/
    require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/luasnippets/" })

    ls.config.set_config({
      history = true,
      update_events = "TextChanged,TextChangedI",
    })

    -- <C-J>: Expande o snippet (o "gatilho")
    vim.keymap.set({"i"}, "<C-J>", function()
      if ls.expandable() then ls.expand() end
    end, {silent = true})

    -- <C-L>: Pula para o PRÓXIMO campo (índice 1, 2, 0...)
    vim.keymap.set({"i", "s"}, "<C-L>", function()
      if ls.jumpable(1) then ls.jump(1) end
    end, {silent = true})

    -- <C-H>: Volta para o campo ANTERIOR
    vim.keymap.set({"i", "s"}, "<C-H>", function()
      if ls.jumpable(-1) then ls.jump(-1) end
    end, {silent = true})
  end,
}
