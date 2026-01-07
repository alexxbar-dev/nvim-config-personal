return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true,                      -- Usa Treesitter para ser más inteligente
        ts_config = {
          lua = { "string" },                 -- No añadir pares en nodos de string de Lua
          javascript = { "template_string" }, -- No añadir pares en template strings de JS
        },
      })
    end,
  },
}
