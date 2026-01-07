-- Gestiona la estética mediante Conform.nvim. Ejecuta herramientas como Prettier o Black automáticamente al guardar (:w), asegurando que la indentación y el estilo del código sean siempre consistentes.
return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" }, -- o "isort" seguido de "black"
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        html = { "prettier" },
        css = { "prettier" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback", -- Si no hay formateador, usa el LSP
      },
    },
  },
}
