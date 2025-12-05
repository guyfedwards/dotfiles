return {
  "neanias/everforest-nvim",
  version = false,
  priority = 1000, -- load before other plugins
  lazy = false,
  config = function()
    local ef = require("everforest")

    ef.setup({
      background = "hard",
      ui_contrast = "high",
      colours_override = function (palette)
        if palette.bg0 == "#272e33" then
          palette.bg0 = "#1D2226"
          palette.bg1 = "#21272B"
        end
      end
    })
    -- load colorscheme
    -- alternative to colorscheme everforest
    ef.load()
  end,
}
