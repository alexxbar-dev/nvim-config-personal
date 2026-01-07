-- Configura el árbol de archivos lateral (nvim-tree o similar). Te da una vista clásica de carpetas y archivos para navegar por tu proyecto sin usar la terminal.
return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,                    -- Queremos que esté disponible desde el inicio
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- Iconos bonitos para los archivos
    },
    config = function()
      require("nvim-tree").setup({
        sort = {
          sorter = "case_sensitive",
        },
        view = {
          width = 30, -- Ancho de la barra lateral
          side = "right",
        },
        renderer = {
          group_empty = true,
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
          },
        },
        filters = {
          dotfiles = false, -- false shows hidden files, true only normal files
        },
        update_focused_file = {
          enable = true,
          update_root = false,
        },
      })

      -- Atajo de teclado para abrir/cerrar el explorador
      -- Usaremos Espacio + e (e de explorador)
      vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Abrir/Cerrar Explorador' })
      -- Atajo para poner el foco en el archivo actual dentro del arból estando en el archivo
      vim.keymap.set('n', '<leader>er', ':NvimTreeFindFile<CR>', { desc = 'Encontrar archivo actual' })
    end,
  },
}
