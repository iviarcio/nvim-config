local M = {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip", -- Permite que o cmp veja os snippets do luasnip
  },
}

function M.config()
  local cmp = require "cmp"
  local luasnip = require "luasnip"

  cmp.setup {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert {
      ["<C-k>"] = cmp.mapping.select_prev_item(),
      ["<C-j>"] = cmp.mapping.select_next_item(),
      ["<CR>"] = cmp.mapping.confirm { select = false },

      ["<Tab>"] = cmp.mapping(function(fallback)
        if luasnip.expand_or_locally_jumpable() then
          -- PRIORIDADE 1: Se der para expandir ou pular no snippet, faça isso!
          luasnip.expand_or_jump()
        elseif cmp.visible() then
          -- PRIORIDADE 2: Se não for snippet mas a lista estiver aberta, navega
          cmp.select_next_item()
        else
          -- PRIORIDADE 3: Se não for nada disso, apenas dê um Tab real
          fallback()
        end
      end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if luasnip.locally_jumpable(-1) then
          luasnip.jump(-1)
        elseif cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, { "i", "s" }),
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" }, -- Seus snippets aparecerão na lista
      { name = "buffer" },
      { name = "path" },
    },
    window = {
      completion = {
        border = "rounded",
        scrollbar = false,
      },
      documentation = {
        border = "rounded",
      },
    },
  }
end

return M
