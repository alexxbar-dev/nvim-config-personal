local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Fijar la tecla líder
vim.g.mapleader = " "

-- Agregar líneas sin entrar en modo inserción
keymap("n", "<leader>o", "o<Esc>", { desc = "Nueva línea abajo" })
keymap("n", "<leader>O", "O<Esc>", { desc = "Nueva línea arriba" })

-- Borrar línea sin copiar al portapapeles (el que pediste antes)
keymap("n", "<leader>d", '"_dd', { desc = "Borrar línea sin copiar" })
keymap("n", "x", '"_x', { desc = "Borrar carácter sin copiar" })

-- Mantener el cursor centrado al saltar media pantalla
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

-- Moverse por líneas visuales (para cuando el texto hace wrap)
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Moverse entre pestañas con Tab y Shift+Tab
keymap("n", "<Tab>", "gt", { desc = "Siguiente pestaña" })
keymap("n", "<S-Tab>", "gT", { desc = "Pestaña anterior" })

-- Crear una nueva pestaña vacía rápidamente
keymap("n", "<leader>tn", ":tabnew<CR>", { desc = "Nueva pestaña" })
-- Cerrar la pestaña actual
keymap("n", "<leader>tc", ":tabclose<CR>", { desc = "Cerrar pestaña" })

-- Navegar entre buffers (archivos abiertos) rápido Shift+l o Shift+h
keymap("n", "<S-l>", ":bnext<CR>", { desc = "Siguiente buffer" })
keymap("n", "<S-h>", ":bprev<CR>", { desc = "Buffer anterior" })
