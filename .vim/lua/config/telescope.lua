local telescope = require("telescope")
local actions = require("telescope.actions")
local themes = require("telescope.themes")

--- with_theme combines overrides with ivy theme
--- takes additional picker settings and combines
--- with theme settings
local function with_theme(settings)
  settings = settings or {}
  local theme_overrides = {
    layout_config = {
      prompt_position = "bottom",
    },
    sorting_strategy = "descending",
  }
  local ivy = themes.get_ivy(theme_overrides)

  return vim.tbl_deep_extend("force", ivy, settings)
end

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous
      }
    }
  },
  pickers = {
    find_files = with_theme({ hidden = true }),
    live_grep = with_theme({ additional_args = "--hidden" }),
    grep_string = with_theme({ additional_args = "--hidden" }),
    buffers = with_theme()
  }
}

-- To get fzf loaded and working with telescope,
-- you need to call load_extension, somewhere after
-- the setup function.
telescope.load_extension('fzf')

