vim.cmd[[colorscheme tokyonight-night]]

vim.api.nvim_create_user_command(
  'ToggleTheme',
  function()
    if vim.g.colorscheme == 'tokyonight-night' then
      vim.cmd[[colorscheme tokyonight-day]]
    else
      vim.cmd[[colorscheme tokyonight-night]]
    end
  end,
  { nargs = 0 }
)
