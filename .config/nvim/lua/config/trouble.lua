local trouble = require("trouble")

trouble.setup {
  signs = {
    error = "●",
    warning = "●",
    hint = "●",
    information = "●",
    other = "●"
  },
  use_diagnostic_signs = false,
  icons = false
}
