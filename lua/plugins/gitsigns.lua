return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup({
        -- Iconos en el borde izquierdo
        signs = {
          add          = { text = '┃' },
          change       = { text = '┃' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
        -- Muestra la persona que editó la línea (Blame) de forma tenue
        current_line_blame = true,
        current_line_blame_opts = {
          delay = 500,
        },
      })
    end
  }
}
