local M = {
  "nvim-lualine/lualine.nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}

function M.config()
  require("lualine").setup {
          options = {
              theme = "nord",
              globalstatus = false,
              icons_enabled = true,
              component_separators = { left = '', right = ''},
              section_separators = { left = '', right = ''},
              ignore_focus = {},
              disabled_filetypes = {
                statusline = {},
                winbar = {},
              },
              always_divide_middle = true,
              refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 200,
              }
          },
          sections = {
              lualine_a = {'mode'},
              lualine_b = {'branch', 'diff', 'diagnostics'},
              lualine_c = {'filename'},
              lualine_x = {'encoding', 'fileformat', 'filetype'},
              lualine_y = {'progress'},
              lualine_z = {'location'}
          },
          inactive_sections = {
              lualine_a = {'mode'},
              lualine_b = {},
              lualine_c = {'filename'},
              lualine_x = {'location'},
              lualine_y = {},
              lualine_z = {}
            },
            tabline = {},
            winbar = {
              lualine_a = {
                { 'buffers',
                  show_filename_only = true,   -- Shows shortened relative path when set to false.
                  hide_filename_extension = false,   -- Hide filename extension when set to true.
                  show_modified_status = true, -- Shows indicator when the buffer is modified.
                  mode = 4,  -- 0: buffer name 1: buffer index 2: buffer name + buffer index
                             -- 3: buffer number 4: buffer name + buffer number

                  filetype_names = {
                          TelescopePrompt = 'Telescope',
                          dashboard = 'Dashboard',
                          fzf = 'FZF',
                          alpha = ''
                        }, -- Shows specific buffer name for that filetype

                }
            },
              lualine_b = {},
              lualine_c = {},
              lualine_x = {},
              lualine_y = {},
              lualine_z = {}
            },
            inactive_winbar = {
              lualine_a = {},
              lualine_b = {},
              lualine_c = {},
              lualine_x = {},
              lualine_y = {},
              lualine_z = {}
            },
            extensions = {"fugitive"}
        }
    end

return M
