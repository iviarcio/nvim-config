-- disable netrw at the very start
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_perl_provider = 0

vim.opt.backup = false --  does not create a backup file
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp plugin
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.pumblend = 10

vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- creates a swapfile
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.timeout = true
vim.opt.timeoutlen = 300 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 100 -- faster completion (4000ms default)

vim.opt.writebackup = false -- if a file is being edited by another program (or was written
                            -- to file while editing with another program), it is not allowed to be edited

vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.softtabstop = 2

-- vim.opt.cursorline = true -- highlight the current line

vim.opt.number = true -- set numbered lines
vim.opt.laststatus = 3
vim.opt.showcmd = false
vim.opt.hidden = true

vim.opt.numberwidth = 4 -- set number column width to 4 {default}
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.linebreak = true
vim.opt.scrolloff = 0
vim.opt.sidescrolloff = 8
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications

-- set relativenumber on normal mode and absolute number on insert mode
local augroup = vim.api.nvim_create_augroup("NumberToggle", { clear = true })
vim.api.nvim_create_autocmd({"BufEnter", "FocusGained", "InsertLeave", "WinEnter"}, {
  group = augroup,
  pattern = "*",
  callback = function()
    if vim.opt.number then
      vim.opt.relativenumber = true
    end
  end,
})
vim.api.nvim_create_autocmd({"BufLeave", "FocusLost", "InsertEnter", "WinLeave"}, {
  group = augroup,
  pattern = "*",
  callback = function()
    if vim.opt.number then
      vim.opt.relativenumber = false
    end
  end,
})

-- Define the function to clear the background for comment
local function clear_comment_bg()
  local groups = {
    "Comment",
    "@comment",
    "@comment.cpp",
    "@lsp.type.comment",
    "@lsp.type.comment.cpp",
  }

  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { bg = "NONE" })
  end
end

-- Define the function to modify foreground colors in comment
local function nord_comment_fg()
  local fg = "#F1E4F8" -- old: B4D0CB, last: DBD5CA

  local groups = {
    "Comment",
    "@comment",
    "@comment.cpp",
    "@lsp.type.comment",
    "@lsp.type.comment.cpp",
  }

  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, {
      fg = fg,
      bg = "NONE",
      italic = false,
    })
  end
end

-- Set up an autocommand group for custom color modifications
vim.api.nvim_create_augroup("MyCustomColor", {clear = true})

vim.api.nvim_create_autocmd("ColorScheme", {
  group = "MyCustomColor",
  callback = function()
    -- always remove the background
    clear_comment_bg()

    -- only adjust fg to Nord
    if vim.g.colors_name == "nord" then
      nord_comment_fg()
    end
  end,
})

-- Clear the default CursorLine highlight and set CursorLineNR highlight
vim.api.nvim_command("highlight clear CursorLine")

-- Syntax highlight for tablegen files
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.td",
  command = "set syntax=tablegen",
})

-- Syntax highlight for llvm files
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.ll",
  command = "set syntax=llvm",
})

-- Syntax highlight for mlir files
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.mlir",
  command = "set syntax=mlir",
})

-- Syntax highlight for mir files
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.mir",
  command = "set syntax=mir",
})

vim.api.nvim_command('set commentstring=//%s')

-- (Exuberant/Universal) Ctags
vim.opt.tags = '.tags'

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "py", "java", "cs" },
  callback = function()
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 4
  end,
})
