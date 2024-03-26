-- disable netrw at the very start
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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
-- vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
-- vim.opt.showtabline = 1 -- always show tabs
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
-- vim.opt.splitbelow = true -- force all horizontal splits to go below current window
-- vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- creates a swapfile
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.timeout = true
vim.opt.timeoutlen = 300 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 100 -- faster completion (4000ms default)
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4 -- insert 2 spaces for a tab
-- vim.opt.cursorline = true -- highlight the current line
vim.opt.number = true -- set numbered lines
vim.opt.laststatus = 3
vim.opt.showcmd = false
-- vim.opt.ruler = false
vim.opt.hidden = true

vim.opt.numberwidth = 4 -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = true 
vim.opt.wrapmargin = 4
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

-- Set up an autocommand group for custom color modifications
vim.api.nvim_create_augroup("MyCustomColor", {clear = true})

-- Define the function to modify some colors highlight
local function colors_highlight()
    vim.api.nvim_set_hl(0, "Comment", {fg = '#B4D0CB', bg = NONE, italic = true})
    vim.api.nvim_set_hl(0, "CursorLineNR", { bg = NONE, bold = true })
    vim.api.nvim_set_hl(0, 'LineNr', { fg = '#A5B3CE' })
end

-- Set up the autocommand to call the above function when the color scheme is Nord
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "nord",
    callback = colors_highlight,
    group = "MyCustomColor",
})

-- Clear the default CursorLine highlight and set CursorLineNR highlight
vim.api.nvim_command("highlight clear CursorLine")
