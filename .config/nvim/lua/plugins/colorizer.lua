return {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = { -- set to setup table
      filetypes = { "css","html","scss","less","json" }, -- Filetype options.  Accepts table like `user_default_options`
    },
}
