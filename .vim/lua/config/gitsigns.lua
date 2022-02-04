local signs = require('gitsigns')

signs.setup {
  signs = {
    add          = {show_count = false, text = '┃' },
    change       = {show_count = false, text = '┃' },
    delete       = {show_count = true, text = '╻' },
    topdelete    = {show_count = true, text = '╹' },
    changedelete = {show_count = false, text = '┃' },
  }
}
