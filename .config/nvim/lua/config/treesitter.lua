local configs = require("nvim-treesitter.configs")

configs.setup {
  ensure_installed = {
    "bash",
    "css",
    "dockerfile",
    "go",
    "hcl",
    "html",
    "javascript",
    "jsdoc",
    "json",
    "lua",
    "markdown",
    "proto",
    "rust",
    "tsx",
    "typescript",
    "zig"
  },
  highlight = {
    enable = true
  },
  playground = {
    enabled = true
  }
}
