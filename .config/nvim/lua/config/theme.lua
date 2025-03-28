-- vim.cmd[[colorscheme tokyonight-night]]

local ef = require("everforest")
local colors = require("everforest.colours")


ef.setup({
  background = "hard",
  ui_contrast = "high",
  -- transparent_background_level = 2,
  colours_override = function (palette)
    if palette.bg0 == "#272e33" then
      palette.bg0 = "#1D2226"
      palette.bg1 = "#21272B"
    end
  end
})

local palette = colors.generate_palette(ef.config, vim.o.background)

ef.load()

-- access with require("config/theme")
return {
  palette = palette
}
