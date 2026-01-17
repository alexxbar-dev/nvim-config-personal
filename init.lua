-- Load user options
require("config.options")

-- Load user keymaps
require("config.keymaps")

-- Load Lazy's plugin manager
require("config.lazy")

-- Elimina los espacios al final de la linea al guardar
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- === THEMES GLOBAL CONFIGURATION ===
vim.cmd([[colorscheme wildcharm]])
-- Un color más suave para que la letra se lea mejor al seleccionar
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#3e4452", fg = "#abb2bf", bold = true })

-- Esto intenta forzar que el fondo sea el de la terminal
--vim.cmd([[highlight Normal guibg=NONE ctermbg=NONE]])
--vim.cmd.colorscheme("mellow")
-- ========================================
