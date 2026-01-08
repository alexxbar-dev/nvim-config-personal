# My Personal Neovim Configuration

Esta es mi configuración personalizada de Neovim construida desde cero utilizando **Lazy.nvim** como gestor de plugins.

## Características

* **Gestor de Plugins:** [Lazy.nvim](https://github.com/folke/lazy.nvim)
* **LSP:** Configuración nativa con `ts_ls`, `pyright` y otros, gestionados vía `mason.nvim`.
* **Autocompletado:** `nvim-cmp` con soporte para LSP, Snippets y rutas de archivos.
* **Sintaxis:** `nvim-treesitter` para un resaltado de código avanzado.
* **Interfaz(UI):** `lualine.nvim` para una barra de estado estética e informativa (modo actual, rama de git, lenguaje, etc.).
* **Explorador:** `nvim-tree` para gestión de archivos.
* **Buscador:** `telescope.nvim` para búsqueda difusa (fuzzy find).
* **Git:** `gitsigns.nvim` para indicadores visuales de cambios en el editor.
* **Utilidades:**
  * `conform.nvim` para auto-acomodar el código al guardar (soporta Prettier, Black, Stylua, etc.).
  * `nvim-autopairs` para cierre automático de paréntesis.
  * `nvim-ts-autotag` para cierre automático de etiquetas HTML/JSX      

## Instalación

Para replicar esta configuración, asegúrate de tener instalado **Neovim (v0.9+)** y **Git**. Luego, ejecuta:

1. Clona este repositorio en tu carpeta de configuración:
```bash
git clone https://github.com/alexxbar-dev/nvim-config-personal.git ~/.config/nvim
```

2. Abre Neovim:
```bash
nvim
```

3. Espera a que Lazy.nvim instale todos los plugins automáticamente.

4. Reinicia neovim y ejecuta `:MasonUpdate` para asegurar que los servidores LSP estén al día.

## Atajos de plugins (Keymaps)

### Nvim-Tree

| Acción | Atajo |
| :--- | :--- |
| Abre o cierra Nvim-Tree | `<Leader>e` |
| Regresar el foco a Nvim-Tree | `<Leader>er` |

### Telescope.nvim

| Acción | Atajo |
| :--- | :--- |
| Busca archivos por nombre | `<Leader>ff` |
| Busca texto en los archivos | `<Leader>fg` |
| Muestra buffers abiertos | `<Leader>fb` |
| Buscar en la ayuda | `<Leader>fh` |

### Nvim-lspconfig

| Acción | Atajo |
| :--- | :--- |
| Ir a la definición | `gd` |
| Ver documentación de ayuda | `K` |
| Acciones de código | `<Leader>ca` |

### nvim-cmp (autocompletado)
 
| Acción | Atajo |
| :--- | :--- |
| Abre el recuadro de autocompletado | `<C-Space>` |
| Cierra el recuadro de autocompletado | `<C-e>` |
| Confirma e ingresa la selección | `<CR> o Enter` |
| Siguiente elemento o snippet  | `<C-n>` |
| Anterior elemento o snippet | `<C-p>` |

> [!TIP]
> Puedes consultar o modificar todos los comandos personalizados en el archivo `lua/core/keymaps.lua`.

## Estructura de archivos
```text
~/.config/nvim
├── init.lua                 # Punto de entrada (carga los Plugins)
├── lua/
│   ├── config/              # Configuración base (opciones, atajos)
│   │   ├── keymaps.lua
│   │   ├── lazy.lua
│   │   └── options.lua
│   └── plugins/             # Configuración específica de plugins
│       ├── autopairs.lua
│       ├── autotag.lua
│       ├── completions.lua
│       ├── explorer.lua
│       ├── formatter.lua
│       ├── gitsigns.lua
│       ├── lsp.lua
│       ├── telescope.lua
│       ├── themes.lua
│       ├── treesitter.lua
│       └── ui.lua
├── README.md
├── .gitignore               # Archivos excluidos
└── lazy-lock.json           # Versiones exactas de tus plugins
```
