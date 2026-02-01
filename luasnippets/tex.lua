local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("tex", {
  -- 1. Atalho para \begin{} \end{} (Gatilho: beg)
  s("beg", {
      t("\\begin{"), i(1), t("}"),
      t({"", "\t"}), i(0),
      t({"", "\\end{"}), rep(1), t("}"),
  }),

  -- 2. Atalho para Frações (Gatilho: ff)
  s("ff", {
    t("\\frac{"), i(1), t("}{"), i(2), t("}"), i(0)
  }),

  -- 3. Atalho para Itens (Gatilho: it)
  s("it", {
    t("\\item "), i(0)
  }),
})
