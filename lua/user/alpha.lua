local M = {
  "goolord/alpha-nvim",
  dependencies = {
      'nvim-tree/nvim-web-devicons',
      'nvim-lua/plenary.nvim'
  },
  event = "VimEnter",
}

function M.config()
  local dashboard = require "alpha.themes.dashboard"
  local icons = require "user.icons"

  local function button(sc, txt, keybind, keybind_opts)
    local b = dashboard.button(sc, txt, keybind, keybind_opts)
    b.opts.hl_shortcut = "Include"
    return b
  end

  dashboard.section.header.val = {
    [[                         __  __                                              ]],
    [[     /'\_/`\            /\ \/\ \                          __                 ]],
    [[    /\      \  __  __   \ \ `\\ \     __    ___   __  __ /\_\    ___ ___     ]],
    [[    \ \ \__\ \/\ \/\ \   \ \ , ` \  /'__`\ / __`\/\ \/\ \\/\ \ /' __` __`\   ]],
    [[     \ \ \_/\ \ \ \_\ \   \ \ \`\ \/\  __//\ \L\ \ \ \_/ |\ \ \/\ \/\ \/\ \  ]],
    [[      \ \_\\ \_\/`____ \   \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\ ]],
    [[       \/_/ \/_/`/___/> \   \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/ ]],
    [[                   /\___/                                                    ]],
    [[                   \/__/                                    Marcio M Pereira ]],
  }

  dashboard.section.buttons.val = {
    button("f", icons.ui.FindFile .. " Find file", ":FzfLua files<CR>"),
    button("n", icons.ui.NewFile .. " New file", ":ene <BAR> startinsert <CR>"),
    button("r", icons.ui.History .. " Recent files", ":FzfLua oldfiles <CR>"),
    button("t", icons.ui.Text .. " Find text", ":FzfLua live_grep <CR>"),
    button("c", icons.ui.Gear .. " Config", ":e ~/.config/nvim/init.lua <CR>"),
    button("q", icons.ui.SignOut .. " Quit", ":qa<CR>"),
  }
  local function footer()
    return "@Marcio"
  end

  dashboard.section.footer.val = footer()

  dashboard.section.header.opts.hl = "Keyword"
  dashboard.section.buttons.opts.hl = "Include"
  dashboard.section.footer.opts.hl = "Type"

  dashboard.opts.opts.noautocmd = true
  require("alpha").setup(dashboard.opts)

  vim.api.nvim_create_autocmd("User", {
    pattern = "LazyVimStarted",
    callback = function()
      local stats = require("lazy").stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      dashboard.section.footer.val = "Loaded " .. stats.count .. " plugins in " .. ms .. "ms"
      pcall(vim.cmd.AlphaRedraw)
    end,
  })

  vim.api.nvim_create_autocmd({ "User" }, {
    pattern = { "AlphaReady" },
    callback = function()
      vim.cmd [[
      set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
    ]]
    end,
  })
end

return M
