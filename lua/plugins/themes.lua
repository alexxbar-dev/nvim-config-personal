-- Define la apariencia visual y el esquema de colores de todo el editor (como Catppuccin o Tokyonight). Es la base estética sobre la que se aplican tus personalizaciones.
return {
  {
    "folke/tokyonight.nvim",
    lazy = false,    -- Indicamos el tema que se tiene que cargar primero, desactivamos la carga lenta
    priority = 1000, -- Indicamos la prioridad sobre otros plugins
    -- Ambas opciones solo lo debe tener el tema/plugin que se va a usar al iniciar la instancia dado que si varios tienen
    -- estas prioridades se hara lento el arranque.
    config = function()
      -- Aquí es donde activamos el tema después de descargarlo
    end,
  },

  {
    'olivercederborg/poimandres.nvim',
    config = function()
      require('poimandres').setup {
        -- leave this setup function empty for default config
        -- or refer to the configuration section
        -- for configuration options
      }
    end,
  },

  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
  },

  {
    "EdenEast/nightfox.nvim",
  },

  {
    "rebelot/kanagawa.nvim",
  },

  {
    "mellow-theme/mellow.nvim",
  },
}
