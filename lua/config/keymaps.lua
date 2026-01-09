local keymap = vim.keymap.set
-- local opts = { noremap = true, silent = true }

-- Fijar la tecla líder
vim.g.mapleader = " "

-- Usa 'jk' para salir, pero con un tiempo de espera muy corto
keymap("i", "jk", "<Esc>", { desc = "Salir de modo inserción", nowait = true })

-- Guardar con Ctrl + s archivo actual (Modo normal, visual e inserción)
keymap({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Guardar archivo" })

-- Cerrar el archivo actual (buffer) sin cerrar Neovim
vim.keymap.set("n", "<leader>q", "<cmd>bd<cr>", { desc = "Cerrar buffer actual" })

-- Cerrar TODO Neovim (Salir) te avisa si hay algo sin guardar
vim.keymap.set("n", "<leader>Q", "<cmd>qa<cr>", { desc = "Salir de Neovim" })

-- Agregar líneas sin entrar en modo inserción
keymap("n", "<M-o>", 'o<Esc>0"_D', { desc = "Nueva línea limpia abajo" })
keymap("n", "<M-O>", 'O<Esc>0"_D', { desc = "Nueva línea limpia arriba" })

-- Borrar línea sin copiar al portapapeles
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

-- Mover la línea actual hacia arriba o abajo (en Modo Normal)
keymap('n', '<M-Down>', '<cmd>m .+1<cr>==', { desc = 'Mover línea abajo' })
keymap('n', '<M-Up>', '<cmd>m .-2<cr>==', { desc = 'Mover línea arriba' })

-- En Modo Visual (mueve bloques enteros de código)
keymap('v', '<M-Down>', ":m '>+1<cr>gv=gv")
keymap('v', '<M-Up>', ":m '<-2<cr>gv=gv")

-- Mantener la selección después de indentar en modo Visual
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Muévete entre ventanas con Alt + h,j,k,l (sin soltar Alt)
keymap('n', '<M-h>', '<C-w>h')
keymap('n', '<M-j>', '<C-w>j')
keymap('n', '<M-k>', '<C-w>k')
keymap('n', '<M-l>', '<C-w>l')

-- Buscar y preparar el cambio de lo seleccionado en modo Visual
keymap("v", "<leader>r", [[y/\V<C-r>=escape(@",'/\')<CR><CR>Ncgn]], { desc = "Search and prepare dot-repeat" })
-- 1. Seleccionas la oración o conjunto de caracteres en modo Visual (v).
-- 2. Presionas <leader>r (la R de "Replace").
-- 3. Magia: Neovim automáticamente resalta todas las coincidencias, vuelve a la posición original, borra el texto seleccionado y te deja en Modo Inserción.
-- 4. Escribes el nuevo texto y presionas Esc o jk.
-- 5. Ahora solo usas n para saltar a la siguiente y . para repetir (o n para ignorar).

-- Llamada al archivo de configuración de la terminal
local terminal = require("config.terminal_config")
terminal.setup()
