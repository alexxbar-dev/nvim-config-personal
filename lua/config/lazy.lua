
-- Bootstrapping de Lazy.nvim (Download Lazy.nvim if no already installed) 
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- Use the latest stable version
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Load plugins from the plugins directory, or install them directly 
  spec = {
    -- Import and load all plugins from the plugins diretory
    { import = "plugins" },
  },
  -- Another Lazy options...
})


