-- Es el motor de autocompletado (nvim-cmp). Gestiona el menú visual donde aparecen las sugerencias del LSP y los snippets.
-- Aquí liberamos la tecla Tab para indentar y configuramos Ctrl+n/p para navegar, además de añadir iconos estéticos con lspkind.
return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",            -- El plugin se carga solo cuando presiono "i", "a" o "o"
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",         -- Inteligencia del LSP
      "L3MON4D3/LuaSnip",             -- Motor de snippets
      "saadparwaiz1/cmp_luasnip",     -- Puente entre snippets y cmp
      "rafamadriz/friendly-snippets", -- Colección de snippets (estilo VS Code)
      "onsails/lspkind.nvim",         -- Iconos para el menú de autocompletado
      "hrsh7th/cmp-buffer",           -- Sugerencias de texto del archivo actual
      "hrsh7th/cmp-path",             -- Sugerencias de rutas de archivos
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")

      -- Cargar snippets de friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        -- Hace que la primera opción esté siempre resaltada visualmente
        completion = {
          completeopt = "menu,menuone,noinsert,noselect",
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          -- Usamos .bordered() para evitar el error de 'nil value' de .rounded()
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        -- Configuración de iconos y etiquetas en el menú
        formatting = {
          fields = { "kind", "abbr", "menu" }, -- Orden: Icono, Nombre, Fuente
          format = lspkind.cmp_format({
            mode = "symbol",                   -- Solo el símbolo (para evitar la duplicación con el texto)
            maxwidth = 50,
            ellipsis_char = "...",
            menu = {
              nvim_lsp = "[LSP]",
              luasnip  = "[Snippet]",
              buffer   = "[Buffer]",
              path     = "[Path]",
            },
          }),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
          -- false: Solo confirma si seleccionas algo, true: al presionar enter confirma la opcion seleccionada

          -- NAVEGACIÓN MANUAL (Reemplaza alTab)
          -- Ctrl + n: Siguiente elemento o siguiente salto de snippet
          ["<C-n>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),

          -- Ctrl + p: Elemento anterior o salto de snippet anterior
          ["<C-p>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),

          -- TAB TOTALMENTE LIBRE
          -- Al quitarlo de aquí o dejar solo 'fallback', Neovim usará su comportamiento nativo
          ["<Tab>"] = cmp.config.disable,
          ["<S-Tab>"] = cmp.config.disable,
        }),

        sources = cmp.config.sources({
          { name = "nvim_lsp" }, -- Sugerencias del servidor de lenguaje
          { name = "luasnip" },  -- Snippets
        }, {
          { name = "buffer" },   -- Palabras del archivo actual, solo sugiere palabras tras 3 letras
          { name = "path" },     -- Rutas de archivos en tu sistema
        }),
      })

      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
}
