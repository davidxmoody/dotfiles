require"nvim-treesitter.configs".setup {
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
}
