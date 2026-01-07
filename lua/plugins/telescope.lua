-- Es tu herramienta de búsqueda potente. Te permite encontrar archivos por nombre, buscar texto dentro de todo tu proyecto (grep) o navegar por tus archivos abiertos con una interfaz rápida y visual.
return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local actions = require("telescope.actions")

      require('telescope').setup({
        defaults = {
          mappings = {
            -- Mapeos en modo Inserción (cuando estás escribiendo)
            i = {
              -- ["<C-d>"] = actions.delete_buffer, -- Ctrl + d para borrar buffer
              -- ["<C-q>"] = actions.close,
            },
            -- Mapeos en modo Normal (después de presionar Esc)
            n = {
              ["dd"] = actions.delete_buffer, -- dd para borrar buffer
              ["q"] = actions.close,          -- q para cerrar telescope
            },
          },
          preview = {
            treesitter = false,
          },
        },
      })

      -- Atajos de teclado principales
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Buscar Archivos' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Buscar Texto (Grep)' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Ver Buffers abiertos' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Buscar en la Ayuda' })
    end
  }
}
