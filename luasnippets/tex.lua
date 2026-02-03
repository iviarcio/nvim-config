local ls = require("luasnip")
local s  = ls.snippet
local sn = ls.snippet_node
local t  = ls.text_node
local i  = ls.insert_node
local c  = ls.choice_node
local rep = require("luasnip.extras").rep

-- Função auxiliar: gera um *novo* node toda vez (não reutiliza)
local function divider()
  return t({ "%" .. string.rep("=", 71) })
end

ls.add_snippets("tex", {
  -- Atalho para \begin{} \end{} (Gatilho: beg)
  s("beg", {
    t("\\begin{"), i(1), t("}"),
    t({ "", "\t" }), i(0),
    t({ "", "\\end{" }), rep(1), t("}"),
  }),

  -- Atalho para Frações (Gatilho: ff)
  s("ff", {
    t("\\frac{"), i(1), t("}{"), i(2), t("}"), i(0)
  }),

  -- Atalho para Itens (Gatilho: it)
  s("it", {
    t("\\item "), i(0)
  }),

  -- Atalho para \bcancel (Gatilho: bc)
  s("bc", {
    t("\\bcancel "), i(0)
  }),

  -- Atalho para \problemitems (Gatilho: pri)
  -- Mudar entre "empty" e "parsep", atalho <C-K> (change_choice).
  s("pri", {
    t("\\begin{problemitems}["),
    c(1, {
      t(""), -- Opção 1: vazio
      sn(nil, { t("parsep="), i(1, "6"), t("pt") }), -- Opção 2: com campo editável
    }),
    t("]{prob:"), i(2, "label"), t("}"),
    t({ "", "\t\\item " }), i(0),
    t({ "", "\\end{problemitems}" }),
  }),

  -- Atalho para \problemenum (Gatilho: pre)
  s("pre", {
    t("\\begin{problemenum}["), i(1, "parsep=6pt"),
    t("]{prob:"), i(2, "label"),
    t("}{"), i(3, "enunciado"), t("}"),
    t({ "", "\t\\item " }), i(0),
    t({ "", "\\end{problemenum}" }),
  }),

  -- Seção Geral (Gatilho: hsec)
  s("hsec", {
    t("\\newpage"),
    t({ "", "" }), divider(),
    t({ "", "\\renewcommand{\\SectionIcon}{\\includegraphics[height=1.8cm]{" }),
    i(1, "lesson"), t(".png}}"),
    t({ "", "\\section{" }), i(2, "Título"),
    t("}\\label{sec:"), i(3, "label"), t("}"),
    t({ "", "" }), divider(),
    t({ "", "" }), i(0),
  }),

  -- Seção de Exercícios (Gatilho: hexe)
  s("hexe", {
    divider(),
    t({ "", "\\renewcommand{\\SectionIcon}{\\includegraphics[height=1.8cm]{exercise.png}}" }),
    t({ "", "\\section*{Exercícios}" }),
    t({ "", "" }), divider(),
    t({ "", "" }), i(0),
  }),
})

