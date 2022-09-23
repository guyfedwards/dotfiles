
-- completion in command
require'cmp'.setup.cmdline(':', {
  sources = {
    { name = 'cmdline' }
  }
})

