require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

  use "tpope/vim-repeat"
  use "tpope/vim-speeddating"
  use "tpope/vim-surround"
  use "tpope/vim-commentary"
  use "lambdalisue/suda.vim"
  use "mattn/emmet-vim"
  use "davidxmoody/vim-indent-object"
  use "SirVer/ultisnips"

  use {
    "bluz71/vim-nightfly-guicolors",
    setup = function()
      vim.g["nightflyUnderlineMatchParen"] = 1
    end,
    config = function()
      vim.cmd("colorscheme nightfly")

      vim.api.nvim_set_hl(0, "CustomModifiedFlag", {bg = "Red", fg = "White"})
      vim.api.nvim_set_hl(0, "Pmenu", {bg = "#1d3b53"})

      -- For focused windows, use the "default" background color (from tmux). This
      -- means the current Vim window will be highlighted only if the tmux pane that
      -- vim is running in is also currently active.
      vim.api.nvim_set_hl(0, "Normal", {bg = "NONE"})

      -- Unfocused background color duplicated in tmux config
      vim.api.nvim_set_hl(0, "NormalNC", {bg = "#000a13"})
    end,
  }

  use {
    "justinmk/vim-sneak",
    setup = function()
      vim.g["sneak#absolute_dir"] = 1
      vim.g["sneak#use_ic_scs"] = 1
    end,
  }
  use {
    "easymotion/vim-easymotion",
    setup = function()
      vim.g["EasyMotion_smartcase"] = 1
      vim.g["EasyMotion_do_mapping"] = 0
      vim.g["EasyMotion_enter_jump_first"] = 1
      vim.g["EasyMotion_space_jump_first"] = 1
      vim.g["EasyMotion_use_upper"] = 1
      vim.g["EasyMotion_keys"] = "TNSRHLDMGYCWFPBVUOAIE"
    end,
  }

  use "tpope/vim-fugitive"
  use {
    "airblade/vim-gitgutter",
    setup = function()
      vim.g.gitgutter_map_keys = 0
    end,
  }

  use {
    "christoomey/vim-tmux-navigator",
    setup = function()
      vim.g.tmux_navigator_no_mappings = 1
      vim.g.tmux_navigator_disable_when_zoomed = 1
    end,
  }

  use {
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("nvim-tree").setup({
        renderer = {
          add_trailing = true,
          highlight_opened_files = "icon",
          indent_markers = {enable = true},
        },
        update_focused_file = {enable = true},
        filters = {dotfiles = true},
        view = {width = 32},
        on_attach = function(bufnr)
          local api = require("nvim-tree.api")

          local function opts(desc)
            return {
              desc = "nvim-tree: " .. desc,
              buffer = bufnr,
              noremap = true,
              silent = true,
              nowait = true,
            }
          end

          vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
          vim.keymap.set("n", "i", api.node.open.edit, opts("Open"))
          vim.keymap.set("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))
          vim.keymap.set("n", "<Tab>", api.node.open.preview,
            opts("Open Preview"))
          vim.keymap.set("n", "g<CR>", api.tree.change_root_to_node, opts("CD"))
          vim.keymap.set("n", "gi", api.tree.change_root_to_node, opts("CD"))
          vim.keymap
            .set("n", "[h", api.node.navigate.git.prev, opts("Prev Git"))
          vim.keymap
            .set("n", "]h", api.node.navigate.git.next, opts("Next Git"))
          vim.keymap.set("n", "a", api.fs.create, opts("Create"))
          vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))
          vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
          vim.keymap.set("n", "y", api.fs.copy.node, opts("Copy"))
          vim.keymap.set("n", "Y", api.fs.copy.relative_path,
            opts("Copy Relative Path"))
          vim.keymap.set("n", "gy", api.fs.copy.absolute_path,
            opts("Copy Absolute Path"))
          vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
          vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
          vim.keymap.set("n", "R", api.tree.reload, opts("Refresh"))
          vim.keymap.set("n", ".", api.tree.toggle_hidden_filter,
            opts("Toggle Dotfiles"))
          vim.keymap.set("n", ",", api.tree.toggle_gitignore_filter,
            opts("Toggle Git Ignore"))
          vim.keymap.set("n", "gl", api.node.show_info_popup, opts("Info"))
          vim.keymap.set("n", "{", api.node.navigate.sibling.first,
            opts("First Sibling"))
          vim.keymap.set("n", "}", api.node.navigate.sibling.last,
            opts("Last Sibling"))
          vim.keymap.set("n", "<leader>s", api.node.open.vertical,
            opts("Open: Vertical Split"))
          vim.keymap.set("n", "<leader>h", api.node.open.vertical,
            opts("Open: Vertical Split"))
          vim.keymap.set("n", "<leader>t", api.node.open.horizontal,
            opts("Open: Horizontal Split"))
          vim.keymap.set("n", "<leader>n", api.node.open.horizontal,
            opts("Open: Horizontal Split"))
        end,
      })
    end,
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "typescript",
          "tsx",
          "javascript",
          "svelte",
          "graphql",
          "python",
          "regex",
          "jsdoc",
          "html",
          "bash",
          "json",
          "yaml",
          "css",
          "lua",
        },
        highlight = {enable = true},
        indent = {enable = true},
      })
    end,
  }

  use "jparise/vim-graphql"

  use {
    "neovim/nvim-lspconfig",
    requires = "hrsh7th/cmp-nvim-lsp",
    config = function()
      local nvim_lsp = require("lspconfig")

      local servers = {"tsserver", "svelte", "eslint", "lua_ls"}

      for _, lsp in ipairs(servers) do
        nvim_lsp[lsp].setup({
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
          settings = {
            Lua = {
              runtime = {version = "LuaJIT"},
              diagnostics = {globals = {"vim", "hs"}},
              workspace = {
                library = {
                  vim.fn.expand("$VIMRUNTIME/lua"),
                  vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
                  "/Applications/Hammerspoon.app/Contents/Resources/extensions/hs/",
                },
              },
              telemetry = {enable = false},
            },
          },
        })
      end

      vim.diagnostic.config({float = {border = "single", source = true}})
    end,
  }

  use {
    "junegunn/fzf.vim",
    requires = {{"junegunn/fzf", run = "./install --bin"}},
  }
  use {
    "ojroques/nvim-lspfuzzy",
    config = function()
      require("lspfuzzy").setup({})
    end,
  }

  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "quangnguyen30192/cmp-nvim-ultisnips",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-buffer",
      "windwp/nvim-autopairs",
    },
    config = function()
      vim.opt.completeopt = "menuone,noselect"

      local cmp = require("cmp")

      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          -- ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          -- ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = function(fallback)
            if cmp.visible() then
              cmp.confirm({select = true})
            else
              fallback()
            end
          end,
          ["<Tab>"] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end,
          ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end,
        }),
        sources = cmp.config.sources({
          {name = "nvim_lsp"},
          {name = "ultisnips"},
          {name = "path"},
        }, {{name = "buffer"}}),
      })

      cmp.setup.cmdline({"/", "?"}, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {{name = "buffer"}},
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({{name = "path"}}, {{name = "cmdline"}}),
      })

      cmp.setup.filetype({"markdown", "help"},
        {completion = {autocomplete = false}})

      require("nvim-autopairs").setup()
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  }

  use {
    "sbdchd/neoformat",
    setup = function()
      vim.g.shfmt_opt = "-i 2 -sr -ci"
      vim.g.neoformat_typescript_prettier = {
        exe = "./node_modules/.bin/prettier",
        args = {"--write", "--config .prettierrc"},
        replace = 1,
      }
      vim.g.neoformat_typescriptreact_prettier = {
        exe = "./node_modules/.bin/prettier",
        args = {"--write", "--config .prettierrc"},
        replace = 1,
      }
    end,
  }
end)
