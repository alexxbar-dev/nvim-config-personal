-- Es el "cerebro". Configura Mason para descargar servidores de lenguaje y los vincula con Neovim.
-- Permite que el editor entienda tu código, detecte errores de sintaxis en tiempo real y ofrezca definiciones de funciones.
return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" }, -- Solo carga cuando abres un archivo con algo que leer
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "b0o/SchemaStore.nvim",
    },
    config = function()
      -- Diagnósticos (API Moderna)
      vim.diagnostic.config({
        virtual_text = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "✘",
            [vim.diagnostic.severity.WARN]  = "▲",
            [vim.diagnostic.severity.HINT]  = "⚑",
            [vim.diagnostic.severity.INFO]  = "»",
          },
        },
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = { border = "rounded" },
      })

      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls", "pyright", "ts_ls", "html", "cssls", "jsonls", "bashls", "yamlls"
        },
      })

      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- 1. LUA
      vim.lsp.config('lua_ls', {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
              disable = { "trailing-space", "multiple-empty-lines" }, -- Desactiva quejas de espacios
            },
            workspace = {
              checkThirdParty = false,
              library = vim.api.nvim_get_runtime_file("", true),
            },
          },
        },
      })
      vim.lsp.enable('lua_ls')

      -- 2. PYTHON
      vim.lsp.config('pyright', {
        capabilities = capabilities,
        settings = {
          python = {
            analysis = {
              autoImportCompletions = true,
              typeCheckingMode = "basic",
              diagnosticMode = "workspace",
            },
          },
        },
      })
      vim.lsp.enable('pyright')

      -- 3. JAVASCRIPT / TYPESCRIPT
      -- Primero definimos los patrones para encontrar la carpeta raíz del proyecto
      local root_patterns = { "package.json", "tsconfig.json", "jsconfig.json", ".git" }
      vim.lsp.config('ts_ls', {
        capabilities = capabilities,
        -- root_dir le dice al editor que busque las carpetas indicadas arriba
        root_dir = vim.fs.root(0, root_patterns),
        settings = {
          -- Aquí puedes añadir settings específicos si los necesitas más adelante
        },
      })
      vim.lsp.enable('ts_ls')

      -- 4. HTML / CSS
      vim.lsp.config('html', { capabilities = capabilities })
      vim.lsp.enable('html')
      vim.lsp.config('cssls', { capabilities = capabilities })
      vim.lsp.enable('cssls')

      -- 5. JSON (Corregido)
      vim.lsp.config('jsonls', {
        capabilities = capabilities,
        settings = {
          json = {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
          },
        },
      })
      vim.lsp.enable('jsonls')

      -- 6. BASH / YAML
      vim.lsp.config('bashls', { capabilities = capabilities })
      vim.lsp.enable('bashls')

      vim.lsp.config('yamlls', {
        capabilities = capabilities,
        settings = {
          yaml = {
            schemaStore = { enable = false, url = "" },
            schemas = require('schemastore').yaml.schemas(),
          },
        },
      })
      vim.lsp.enable('yamlls')

      -- Emmet para HTML y CSS
      vim.lsp.config('emmet_ls', {
        capabilities = capabilities,
        filetypes = {
          "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte"
        },
      })
      vim.lsp.enable('emmet_ls')

      -- Keymaps
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Ir a definición" })
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Ver documentación" })
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Acciones de código" })
      -- Renombrar letra,palabras u oraciones con LSP (funciona solo en modo normal y sobre una sola entidad a la vez)
      -- Es decir no funcionara en modo visual ni podras seleccionar oraciones dado que lo hace por variable, funcion, etc.
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'LSP Rename' })
    end,
  }
}
