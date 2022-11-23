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
        view = {
          width = 32,
          mappings = {
            custom_only = true,
            list = {
              {key = {"<CR>", "i", "<2-LeftMouse>"}, action = "edit"},
              {key = {"<Tab>"}, action = "preview"},
              {key = {"g<CR>", "gi"}, action = "cd"},
              {key = {"[h"}, action = "prev_git_item"},
              {key = {"]h"}, action = "next_git_item"},
              {key = {"a"}, action = "create"},
              {key = {"d"}, action = "remove"},
              {key = {"x"}, action = "cut"},
              {key = {"y"}, action = "copy"},
              {key = {"Y"}, action = "copy_path"},
              {key = {"gy"}, action = "copy_absolute_path"},
              {key = {"p"}, action = "paste"},
              {key = {"r"}, action = "rename"},
              {key = {"R"}, action = "refresh"},
              {key = {"."}, action = "toggle_dotfiles"},
              {key = {","}, action = "toggle_git_ignored"},
              {key = {"gl"}, action = "toggle_file_info"},
              {key = {"{"}, action = "first_sibling"},
              {key = {"}"}, action = "last_sibling"},
              {key = {"<leader>s", "<leader>h"}, action = "vsplit"},
              {key = {"<leader>t", "<leader>n"}, action = "split"},
            },
          },
        },
      })
    end,
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require"nvim-treesitter.configs".setup({
        ensure_installed = {
          "typescript",
          "tsx",
          "javascript",
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

      local servers = {"tsserver", "sumneko_lua"}

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
