-- lua/config/terminal_config.lua
local M = {}

-- Función para manejar la apertura y recuperación de la terminal
M.open_terminal = function()
  local term_buf = nil
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[buf].buftype == "terminal" then
      term_buf = buf
      break
    end
  end

  if term_buf then
    local term_win = vim.fn.bufwinid(term_buf)
    if term_win ~= -1 then
      vim.api.nvim_set_current_win(term_win)
    else
      vim.cmd("botright sbuffer " .. term_buf)
      vim.cmd("resize 10")
    end
  else
    vim.cmd("botright split | term")
    vim.cmd("resize 10")
  end
  vim.cmd("startinsert")
end

-- Función mejorada para ocultar
M.hide_or_close = function()
  -- Si el buffer actual es una terminal, simplemente cerramos la ventana (hide)
  if vim.bo.buftype == "terminal" then
    vim.cmd("hide")
  else
    -- Si es un buffer normal, lo borramos
    vim.cmd("bd")
  end
end

-- Aplicar los Keymaps
M.setup = function()
  -- 1. Salir de modo de inserción en la terminal con Esc
  vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = 'Salir modo terminal' })

  -- 2. Abrir/Recuperar terminal
  vim.keymap.set("n", "<leader>t", M.open_terminal, { desc = "Abrir/Recuperar terminal" })

  -- 3. CERRAR/OCULTAR 
  
  -- Desde modo INSERCIÓN en terminal: escapa y oculta ventana
  vim.keymap.set("t", "<leader>q", [[<C-\><C-n><C-w>q]], { desc = "Ocultar terminal desde inserción" })

  -- Desde modo NORMAL (global): detecta si es terminal y actúa
  vim.keymap.set("n", "<leader>q", M.hide_or_close, { desc = "Ocultar terminal o cerrar buffer" })
end

return M
