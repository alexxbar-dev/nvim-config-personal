-- Se encarga del análisis sintáctico avanzado. Proporciona un resaltado de colores mucho más preciso que el estándar y permite que otros plugins (como autotag) entiendan la estructura jerárquica de tu código.
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    local ts = require("nvim-treesitter")

    -- Instalar parsers
    ts.install({
      "lua",
      "python",
      "javascript",
      "typescript",
      "html",
      "css",
      "json",
      "bash",
      "markdown",
      "sql",
      "vim",
      "yaml",
      "zsh",
    })

    -- Activar Treesitter solo en filetypes reales
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "lua",
        "python",
        "javascript",
        "typescript",
        "html",
        "css",
        "json",
        "bash",
        "markdown",
        "sql",
        "vim",
        "yaml",
        "zsh",
      },
      callback = function()
        vim.treesitter.start()
        -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
