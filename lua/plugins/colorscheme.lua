-- plugins/colorscheme.lua - Colorscheme configuration

return {
  {
    "Mofiqul/vscode.nvim",
    priority = 1000, -- Make sure it loads early
    config = function()
      local c = require('vscode.colors').get_colors()
      require('vscode').setup({
        -- Alternatively set style in setup
        -- style = 'light'

        -- Enable transparent background
        transparent = true,

        -- Enable italic comment
        italic_comments = true,

        -- Underline `@markup.link.*` variants
        underline_links = true,

        -- Disable nvim-tree background color
        disable_nvimtree_bg = true,

        -- Override colors (see ./lua/vscode/colors.lua)
        color_overrides = {
          vscLineNumber = '#FFFFFF',
        },

        -- Override highlight groups (see ./lua/vscode/theme.lua)
        group_overrides = {
          -- this supports the same val table as vim.api.nvim_set_hl
          -- use colors from this colorscheme by requiring vscode.colors!
          Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
        }
      })
      -- require('vscode').load()

      local colorscheme = 'vscode'

      local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
      if not is_ok then
        vim.notify('Colorscheme ' .. colorscheme .. ' not found!', "error")
        return
      end
    end,
  },
  
  -- Other colorschemes that you might want to switch to
  { "rebelot/kanagawa.nvim" },
  { "catppuccin/nvim", name = "catppuccin" },
  { "challenger-deep-theme/vim" },
  { "projekt0n/github-nvim-theme", name = "github-theme" },
  { "askfiy/visual_studio_code", priority = 100 },
  {
    "sainnhe/sonokai",
    config = function()
      vim.g.sonokai_enable_italic = true
      vim.g.sonokai_style = 'andromeda'
    end
  },
}
