-- Mejora los componentes visuales básicos de Neovim, como la línea de estado (lualine) o las ventanas flotantes, haciendo que la interfaz sea más informativa y moderna.
return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = {
          theme = 'iceberg_dark', -- O el tema que prefieras
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          globalstatus = true, -- Mantiene una sola barra aunque dividas la pantalla
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { 'filename' },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        },
      })
    end
  }
}
