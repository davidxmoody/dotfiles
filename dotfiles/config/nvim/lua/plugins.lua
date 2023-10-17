local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

require("lazy").setup({
  "tpope/vim-repeat",
  "tpope/vim-speeddating",
  "tpope/vim-surround",
  "tpope/vim-commentary",
  "lambdalisue/suda.vim",
  "mattn/emmet-vim",
  "davidxmoody/vim-indent-object",

  {
    "SirVer/ultisnips",
    init = function()
      vim.keymap.set({"n", "x", "o"}, "<C-F>", "<Nop>")
      vim.keymap.set({"n", "x", "o"}, "<C-B>", "<Nop>")
      vim.g.UltiSnipsExpandTrigger = "<C-F>"
      vim.g.UltiSnipsJumpForwardTrigger = "<C-F>"
      vim.g.UltiSnipsJumpBackwardTrigger = "<C-B>"
    end,
  },

  {
    "bluz71/vim-nightfly-guicolors",
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
  },

  {
    "justinmk/vim-sneak",
    config = function()
      vim.g["sneak#absolute_dir"] = 1
      vim.g["sneak#use_ic_scs"] = 1
    end,
  },
  {
    "easymotion/vim-easymotion",
    config = function()
      vim.g["EasyMotion_smartcase"] = 1
      vim.g["EasyMotion_do_mapping"] = 0
      vim.g["EasyMotion_enter_jump_first"] = 1
      vim.g["EasyMotion_space_jump_first"] = 1
      vim.g["EasyMotion_use_upper"] = 1
      vim.g["EasyMotion_keys"] = "TNSRHLDMGYCWFPBVUOAIE"
    end,
  },

  "tpope/vim-fugitive",
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r)
          vim.keymap.set(mode, l, r, {buffer = bufnr})
        end

        map("n", "<leader>ga", gs.stage_hunk)
        map("v", "<leader>ga", function()
          gs.stage_hunk {vim.fn.line("."), vim.fn.line("v")}
        end)
        map("n", "<leader>gA", gs.undo_stage_hunk)

        map("n", "<leader>gu", gs.reset_hunk)
        map("v", "<leader>gu", function()
          gs.reset_hunk {vim.fn.line("."), vim.fn.line("v")}
        end)

        map("n", "<leader>gw", gs.stage_buffer)
        map("n", "<leader>gr", gs.reset_buffer)

        map("n", "<leader>gl", gs.preview_hunk)

        map("n", "<leader>gb", gs.blame_line)
        map("n", "<leader>gB", gs.toggle_current_line_blame)

        map("n", "<leader>gd", gs.diffthis)

        map("n", "]h", gs.next_hunk)
        map("n", "[h", gs.prev_hunk)

        map({"o", "x"}, "ih", ":<C-U>Gitsigns select_hunk<CR>")
      end,
    },
  },

  {
    "christoomey/vim-tmux-navigator",
    init = function()
      vim.g.tmux_navigator_no_mappings = 1
      vim.g.tmux_navigator_disable_when_zoomed = 1
    end,
  },

  {
    "kyazdani42/nvim-tree.lua",
    dependencies = "kyazdani42/nvim-web-devicons",
    opts = {
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

        local function map(l, r)
          vim.keymap.set("n", l, r, {
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
          })
        end

        map("<CR>", api.node.open.edit)
        map("i", api.node.open.edit)
        map("<2-LeftMouse>", api.node.open.edit)
        map("<Tab>", api.node.open.preview)
        map("g<CR>", api.tree.change_root_to_node)
        map("gi", api.tree.change_root_to_node)
        map("[h", api.node.navigate.git.prev)
        map("]h", api.node.navigate.git.next)
        map("a", api.fs.create)
        map("d", api.fs.remove)
        map("x", api.fs.cut)
        map("y", api.fs.copy.node)
        map("Y", api.fs.copy.relative_path)
        map("gy", api.fs.copy.absolute_path)
        map("p", api.fs.paste)
        map("r", api.fs.rename)
        map("R", api.tree.reload)
        map(".", api.tree.toggle_hidden_filter)
        map(",", api.tree.toggle_gitignore_filter)
        map("gl", api.node.show_info_popup)
        map("{", api.node.navigate.sibling.first)
        map("}", api.node.navigate.sibling.last)
        map("<leader>s", api.node.open.vertical)
        map("<leader>h", api.node.open.vertical)
        map("<leader>t", api.node.open.horizontal)
        map("<leader>n", api.node.open.horizontal)
      end,
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    opts = {
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
      sync_install = false,
      auto_install = false,
      highlight = {enable = true},
      indent = {enable = true},
    },
  },

  "jparise/vim-graphql",

  {
    "neovim/nvim-lspconfig",
    dependencies = "hrsh7th/cmp-nvim-lsp",
    config = function()
      local nvim_lsp = require("lspconfig")

      local servers = {"tsserver", "svelte", "eslint", "lua_ls"}

      for _, lsp in ipairs(servers) do
        nvim_lsp[lsp].setup({
          on_attach = function(client)
            if client.name == "svelte" then
              vim.api.nvim_create_autocmd("BufWritePost", {
                pattern = {"*.js", "*.ts"},
                callback = function(ctx)
                  client.notify("$/onDidChangeTsOrJsFile", {uri = ctx.file})
                end,
              })
            end
          end,
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
  },

  {
    "junegunn/fzf.vim",
    dependencies = {{"junegunn/fzf", run = "./install --bin"}},
  },
  {"ojroques/nvim-lspfuzzy", opts = {}},

  {"windwp/nvim-autopairs", opts = {}},

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
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

      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },

  {
    "sbdchd/neoformat",
    config = function()
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
  },
})
