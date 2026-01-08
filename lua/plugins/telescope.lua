-- Es tu herramienta de búsqueda potente. Te permite encontrar archivos por nombre, buscar texto dentro de todo tu proyecto (grep) o navegar por tus archivos abiertos con una interfaz rápida y visual.
return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    cmd = "Telescope",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Buscar archivos" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>",  desc = "Buscar texto (grep)" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>",    desc = "Ver buffers abiertos" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>",  desc = "Buscar en la ayuda" },
    },
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local actions = require("telescope.actions")

      require('telescope').setup({
        defaults = {
          path_display = { "smart" },
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
    end
  }
}
