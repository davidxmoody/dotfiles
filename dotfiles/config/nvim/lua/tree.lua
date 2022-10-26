require("nvim-tree").setup({
  renderer = {
    add_trailing = true,
    highlight_opened_files = "icon",
    indent_markers = {
      enable = true,
    },
  },
  update_focused_file = {
    enable = true,
  },
  filters = {
    dotfiles = true,
  },
  view = {
    width = 32,
    mappings = {
      custom_only = true,
      list = {
        { key = {"<CR>", "i", "<2-LeftMouse>"}, action = "edit" },
        { key = {"<Tab>"}, action = "preview" },
        { key = {"g<CR>", "gi"}, action = "cd" },
        { key = {"[h"}, action = "prev_git_item" },
        { key = {"]h"}, action = "next_git_item" },
        { key = {"a"}, action = "create" },
        { key = {"d"}, action = "remove" },
        { key = {"x"}, action = "cut" },
        { key = {"y"}, action = "copy" },
        { key = {"Y"}, action = "copy_path" },
        { key = {"gy"}, action = "copy_absolute_path" },
        { key = {"p"}, action = "paste" },
        { key = {"r"}, action = "rename" },
        { key = {"R"}, action = "refresh" },
        { key = {"."}, action = "toggle_dotfiles" },
        { key = {","}, action = "toggle_git_ignored" },
        { key = {"gl"}, action = "toggle_file_info" },
        { key = {"{"}, action = "first_sibling" },
        { key = {"}"}, action = "last_sibling" },
        { key = {"<leader>s", "<leader>h"}, action = "vsplit" },
        { key = {"<leader>t", "<leader>n"}, action = "split" },
      },
    },
  },
})
