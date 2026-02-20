local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
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
  "tpope/vim-fugitive",
  "lambdalisue/suda.vim",
  "mattn/emmet-vim",
  "davidxmoody/vim-indent-object",

  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.ai").setup({
        custom_textobjects = {
          c = function(ai_type)
            local cell_marker = "^# %%"
            local start_line = vim.fn.search(cell_marker, "bcnW")

            if start_line == 0 then
              start_line = 1
            else
              if ai_type == "i" then
                start_line = start_line + 1
              end
            end

            local end_line = vim.fn.search(cell_marker, "nW") - 1
            if end_line == -1 then
              end_line = vim.fn.line("$")
            end

            local last_col = math.max(vim.fn.getline(end_line):len(), 1)

            local from = {line = start_line, col = 1}
            local to = {line = end_line, col = last_col}

            return {from = from, to = to, vis_mode = "V"}
          end,
        },
      })

      require("mini.surround").setup({
        mappings = {
          add = "-",
          delete = "d-",
          replace = "c-",
          find = "",
          find_left = "",
          highlight = "",
          suffix_last = "",
          suffix_next = "",
        },
      })

      require("mini.hipatterns").setup({
        highlighters = {
          hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
          cells = {
            pattern = "^# %%%%.*",
            group = "",
            extmark_opts = {
              virt_text = {{string.rep("─", 256), "Comment"}},
              hl_mode = "combine",
            },
          },
        },
      })
    end,
  },

  {
    "jpalardy/vim-slime",
    init = function()
      vim.g.slime_target = "tmux"
      vim.g.slime_no_mappings = 1
      vim.g.slime_dont_ask_default = 1
      vim.g.slime_bracketed_paste = 1
      vim.g.slime_default_config = {
        socket_name = vim.fn.split(vim.env.TMUX or "", ",")[1] or "",
        target_pane = "{right}",
      }
      vim.keymap.set("x", "<leader>p", "<Plug>SlimeRegionSend")
      vim.keymap.set("n", "<leader>p", function()
        local view = vim.fn.winsaveview()
        vim.cmd.normal("vic p")
        vim.fn.winrestview(view)
      end)
    end,
  },

  {
    "folke/zen-mode.nvim",
    opts = {window = {backdrop = 0, width = 90, options = {signcolumn = "no"}}},
  },

  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_snipmate").lazy_load()
      require("luasnip.loaders.from_lua").lazy_load()

      local ls = require("luasnip")

      vim.keymap.set({"i", "s"}, "<C-F>", function()
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        end
      end, {silent = true})

      vim.keymap.set({"i", "s"}, "<C-B>", function()
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end, {silent = true})
    end,
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      auto_integrations = true,
      transparent_background = true,
      custom_highlights = function(colors)
        return {
          NormalNC = {bg = colors.mantle},
          StatusLineNC = {bg = colors.mantle},
          WinSeparator = {bg = colors.mantle},
          NvimTreeNormalNC = {bg = colors.mantle},
          NvimTreeWinSeparator = {bg = colors.mantle},
          ModifiedFlag = {bg = colors.red, fg = colors.base},
        }
      end,
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  {
    "justinmk/vim-sneak",
    init = function()
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

        local image_exts = {
          png = true,
          jpg = true,
          jpeg = true,
          gif = true,
          bmp = true,
          webp = true,
          svg = true,
        }
        local function open_or_edit()
          local node = api.tree.get_node_under_cursor()
          local ext = node.name:match("%.(%w+)$")
          if ext and image_exts[ext:lower()] then
            api.node.run.system()
          else
            api.node.open.edit()
          end
        end

        map("<CR>", open_or_edit)
        map("i", open_or_edit)
        map("<2-LeftMouse>", open_or_edit)
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
      auto_install = true,
      highlight = {enable = true},
      indent = {enable = true},
    },
  },

  {
    "junegunn/fzf.vim",
    dependencies = {{"junegunn/fzf", build = "./install --bin"}},
  },
  {"ojroques/nvim-lspfuzzy", opts = {}},

  {"windwp/nvim-autopairs", opts = {}},

  -- Load early for native LSP config
  {"hrsh7th/cmp-nvim-lsp", lazy = false},

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-buffer",
      "windwp/nvim-autopairs",
      "jmbuhr/otter.nvim",
    },
    config = function()
      vim.opt.completeopt = "menuone,noselect"

      local cmp = require("cmp")

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
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
          {name = "otter"},
          {name = "nvim_lsp"},
          {name = "luasnip"},
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
      vim.g.neoformat_enabled_typescript = {"prettier"}
      vim.g.neoformat_enabled_typescriptreact = {"prettier"}
      vim.g.neoformat_typescript_prettier = {
        exe = "./node_modules/.bin/prettier",
        args = {"--write", "--config .prettierrc"},
        replace = 1,
      }
      vim.g.neoformat_typescriptreact_prettier = vim.g
                                                   .neoformat_typescript_prettier
    end,
  },
})
