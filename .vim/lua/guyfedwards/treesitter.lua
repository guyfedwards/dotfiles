local configs = require("nvim-treesitter.configs")

configs.setup {
  ensure_installed = {
    "javascript",
    "typescript",
    "jsdoc",
    "rust",
    "go",
    "json",
    "bash",
    "css",
    "hcl",
    "html",
    "lua",
    "tsx",
  },
  highlight = {
    enable = true
  }
}
