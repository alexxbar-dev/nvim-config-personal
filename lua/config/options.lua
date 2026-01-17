local opt = vim.opt           -- Acceso directo para escribir menos

opt.expandtab = true          -- Transforma el "Tab" en espacios. (Importante para Python, JS, etc.)
opt.tabstop = 2               -- Un carácter de Tab ocupa el espacio de 2 espacios.
opt.softtabstop = 2           -- Al presionar Tab o borrar, se siente como si fueran 2 espacios.
opt.shiftwidth = 2            -- Tamaño de la indentación automática (ej. al dar Enter después de un '{').

opt.clipboard = "unnamedplus" -- Sincroniza Neovim con el portapapeles de tu sistema.

opt.number = true             -- Muestra el número de la línea actual.
opt.relativenumber = true     -- Muestra cuántas líneas hay hacia arriba/abajo desde el cursor.
-- (Vital para saltar rápido: ej. "10j" para bajar 10 líneas).

opt.wrap = true        -- Activa el ajuste de línea visual.
opt.linebreak = true   -- Evita que las palabras se corten a la mitad al saltar de línea.
opt.breakindent = true -- Añade una pequeña sangría a la línea que saltó para que se note que es continuación.

opt.ignorecase = true  -- No distingue entre mayúsculas y minúsculas al buscar...
opt.smartcase = true   -- ...A MENOS que escribas una mayúscula a propósito.
opt.hlsearch = false   -- No deja resaltada la última búsqueda (es molesto después de encontrar lo que querías).

-- opt.cursorline = true      -- Resalta la línea donde está el cursor. Ayuda a no perderse.
opt.termguicolors = true -- Activa colores de 24 bits (necesario para temas modernos).
opt.signcolumn = "yes"   -- Siempre muestra la columna de la izquierda (donde aparecen errores de código).
-- Evita que el texto "salte" cuando aparece un error.

opt.scrolloff = 4 -- Mantiene siempre 8 líneas visibles arriba/abajo del cursor al hacer scroll.
-- Así nunca tienes el cursor pegado al borde superior/inferior.

opt.mouse = "a"      -- Permite usar el mouse (para redimensionar splits o hacer clic).
opt.updatetime = 250 -- Neovim reacciona más rápido (útil para que los errores aparezcan pronto).

opt.showmode = true  -- Muestra si estás en INSERT, VISUAL, etc.
opt.showcmd = true   -- Muestra las teclas que vas presionando abajo a la derecha.
opt.cmdheight = 1    -- Asegura que haya espacio para mensajes abajo

-- Reducimos el tiempo de espera entre combinaciones de teclas
opt.timeoutlen = 500 -- El tiempo de espera en milisegundos
