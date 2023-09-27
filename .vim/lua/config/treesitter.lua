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
    "rust",
    "tsx",
    "typescript",
  },
  highlight = {
    enable = true
  },
  playground = {
    enabled = true
  }
}
