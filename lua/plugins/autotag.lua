-- Específico para desarrollo web. Utiliza la inteligencia de Treesitter para cerrar etiquetas HTML/JSX automáticamente y renombrar la etiqueta de cierre si modificas la de apertura.
return {
  {
    "windwp/nvim-ts-autotag",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require('nvim-ts-autotag').setup({
        opts = {
          enable_close = true,          -- Cerrar etiquetas automáticamente
          enable_rename = true,         -- Renombrar etiquetas pareja
          enable_close_on_slash = true, -- Cerrar al poner /
        },
      })
    end
  }
}
