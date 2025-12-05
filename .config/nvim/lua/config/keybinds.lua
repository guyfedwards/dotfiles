-- invert yank on paste. Normal paste won't yank selection, P will
vim.keymap.set('x', 'p', 'P', { noremap = true })
vim.keymap.set('x', 'P', 'p', { noremap = true })

-- \ calls :Rg, if visual selection, call :Rg <selection>
vim.keymap.set('v', '\\', function()
  local t = get_visual_selection()
  vim.cmd("Rg " .. t)
end, { noremap = true })

function get_visual_selection()
  -- exit visual mode so '< and '> are populated correctly
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), 'x', true)

  local s_start = vim.fn.getpos("'<")
  local s_end = vim.fn.getpos("'>")
  local n_lines = math.abs(s_end[2] - s_start[2]) + 1
  local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
  lines[1] = string.sub(lines[1], s_start[3], -1)
  if n_lines == 1 then
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
  else
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
  end
  return table.concat(lines, '\n')
end
